#
# Makefile for the Ghostscript Printer Application
#
# Copyright © 2020-2021 by Till Kamppeter
# Copyright © 2020 by Michael R Sweet
#
# Licensed under Apache License v2.0.  See the file "LICENSE" for more
# information.
#

# Version and
VERSION		=	1.0
prefix		=	$(DESTDIR)/usr
localstatedir	=	$(DESTDIR)/var
includedir	=	$(prefix)/include
bindir		=	$(prefix)/bin
libdir		=	$(prefix)/lib
mandir		=	$(prefix)/share/man
ppddir		=	$(prefix)/share/ppd
statedir	=	$(localstatedir)/lib/ghostscript-printer-app
spooldir	=	$(localstatedir)/spool/ghostscript-printer-app
serverbin	=	$(prefix)/lib/ghostscript-printer-app
resourcedir	=	$(prefix)/share/ghostscript-printer-app
cupsserverbin	=	`cups-config  --serverbin`
unitdir 	:=	$(DESTDIR)`pkg-config --variable=systemdsystemunitdir systemd`


# Compiler/linker options...
OPTIM		=	-Os -g
CFLAGS		+=	`pkg-config --cflags pappl` `cups-config --cflags` `pkg-config --cflags libppd` `pkg-config --cflags libcupsfilters` `pkg-config --cflags libpappl-retrofit` $(OPTIM)
ifdef SNAP
CFLAGS          +=      -DSNAP=$(SNAP)
endif
LDFLAGS		+=	$(OPTIM) `cups-config --ldflags`
LIBS		+=	`pkg-config --libs pappl` `cups-config --image --libs` `pkg-config --libs libppd` `pkg-config --libs libcupsfilters` `pkg-config --libs libpappl-retrofit`


# Targets...
OBJS		=	ghostscript-printer-app.o
TARGETS		=	ghostscript-printer-app


# General build rules...
.SUFFIXES:	.c .o
.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<


# Targets...
all:		$(TARGETS)

clean:
	rm -f $(TARGETS) $(OBJS)

install:	$(TARGETS)
	mkdir -p $(bindir)
	cp $(TARGETS) $(bindir)
	mkdir -p $(mandir)/man1
	cp ghostscript-printer-app.1 $(mandir)/man1
	mkdir -p $(ppddir)
	mkdir -p $(statedir)/ppd
	mkdir -p $(spooldir)
	mkdir -p $(resourcedir)
	cp testpage.ps $(resourcedir)
	if test "x$(cupsserverbin)" != x; then \
	  mkdir -p $(libdir); \
	  touch $(serverbin) 2> /dev/null || :; \
	  if rm $(serverbin) 2> /dev/null; then \
	    ln -s $(cupsserverbin) $(serverbin); \
	  fi; \
	else \
	  mkdir -p $(serverbin)/filter; \
	  mkdir -p $(serverbin)/backend; \
	fi
	if test "x$(unitdir)" != x; then \
	  mkdir -p $(unitdir); \
	  cp ghostscript-printer-app.service $(unitdir); \
	fi

ghostscript-printer-app:	$(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

$(OBJS):	Makefile
