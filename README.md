# Ghostscript Printer Application

## INTRODUCTION

This repository contains a Printer Application for printers supported
by Ghostscript's built-in printer drivers and some extra filters.

It uses [PAPPL](https://www.msweet.org/pappl) to support IPP
printing from multiple operating systems. In addition, it uses the
resources of [cups-filters
2.x](https://github.com/OpenPrinting/cups-filters) (filter functions
in libcupsfilters, libppd) and
[pappl-retrofit](https://github.com/OpenPrinting/pappl-retrofit)
(encapsulating classic CUPS drivers in Printer Applications). This
work (or now the code of pappl-retrofit) is derived from the
[hp-printer-app](https://github.com/michaelrsweet/hp-printer-app).

For printer capability and driver usage information the Foomatic
database of OpenPrinting (Online access [by
printer](http://www.openprinting.org/printers/), [by
driver](http://www.openprinting.org/drivers/),
[Downlod](http://github.com/OpenPrinting/foomatic-db)) is used.

Your contributions are welcome. Please post [issues and pull
requests](https://github.com/OpenPrinting/ghostscript-printer-app).


### Contained Printer Drivers (in the Snap)

- **Ghostscript built-in**:
  ```
  ap3250, appledmp, bj10e, bj10vh, bj10v, bj10, bj200, bj8XXYYZ.upp,
  bjc250gs, bjc600, bjc800, bjc880j, cdj500, cdj550, cdnj500, chp2200,
  cljet5, cp50, declj250, deskjet, dj505j, djet500, dnj650c,
  eplaser-jp, eplaser, eps9high, eps9mid, epsonc, epson, escpage,
  fmlbp, fmpr, gdi, hl1250, hl7x0, ibmpro, imagen, iwhi, jetp3852,
  jj100, la50, la70, la75plus, la75, laserjet, lbp310, lbp320, lbp8,
  lex5700, lex7000, lips2p, lips3, lips4v, lips4, lj250, lj4dithp,
  lj4dith, lj5gray, ljet2p, ljet3d, ljet3, ljet4d, ljet4, ljetplus,
  ln03, lp2000, lp2563, lp8000, lq850, lxm3200-tweaked, lxm5700m,
  m8510, md1xMono, md2k, md50Eco, md50Mono, md5k, mj700v2c, ml600,
  necp2xX.upp, necp6, npdl, oce9050, oki182, oki4w, okiibm, paintjet,
  pcl3, picty180, pjetxl, pjxl300, pjxl, pj, ps2write, pr150, pr201,
  pxlcolor, pxldpl, pxlmono, r4081, rpdl, sharp.upp, sipixa6.upp,
  sj48, stcolor, t4693dX, tek4696, xes
  ```

  This gives support for many old and ancient printers, but also for
  PCL lasers (especially PCL 6/XL) and dot-matrix printers.

  The included Ghostscript can have more drivers but these are the
  ones for which we have PPD support from Foomatic and which are not
  considered deprecated by another driver.

- **`hpijs` of HPLIP**: For non-HP PCL printers (use the [HPLIP
  Printer Application](https://snapcraft.io/hplip-printer-app) for HP
  printers). Better print quality than with Ghostscript's built-in
  drivers.

- **`pnm2ppa`**: Driver for some older HP printers with proprietary
  protocol, probably the only HP printers **NOT supported by
  HPLIP**. even not with HP's proprietary plugin. The configuration
  file in the Snap is user-editable, see below.

- **`pxljr`**: For HP Color LaserJet 3500/3550/3600, should give
  better output quality than HPLIP.

- **`foo2zjs`**: Driver for laser printers with proprietary languages,
  from Dell, Epson, Fuji, HP, Kyocera, Lexmark, (Konica) Minolta, Oki,
  Olivetti, Ricoh, Samsung, Xerox. Note that the firmware loading
  facility for HP is not included in this Printer Application, use the
  [HPLIP Printer Application](https://snapcraft.io/hplip-printer-app)
  (download proprietary plugin in-app, via web interface) for these
  printers, the firmware is proprietary anyway. In the Snap the user
  can add color profiles, see below.

- **`SpliX`**: Driver for laser printers with proprietary languages,
  from Dell, Lexmark, Samsung, Toshiba, Xerox

- **`brlaser`**: Driver for Brother HL, DCP, and MFC laser printers
  which do not understand PostScript nor PCL.

- **`fxlinuxprint`**: Driver from Fuji Xerox for their PDF printers
  before the times of driverless IPP.

- **`c2esp`**: Driver for Kodak EasyShare printers.

- **`rastertosag-gdi`**: For the few Ricoh models which do not do
  PostScript or PCL: Ricoh Aficio SP 1000S/1100S

- **`dymo`**: Driver for Dymo's label printers

- **`ptouch`**: Driver for Brother's P-Touch label printers

- **`c2050`, `cjet`, `min12xxw`, `m2300w`**: Drivers for older
  Lexmark, Canon, and Minolta printers. For `m2300w` in the Snap the
  user can add color profiles, see below.

- **`CUPS`, `cups-filters`**: Included drivers for PCL, dot-matrix
  (Oki, Epson), label printers (Dymo, Intellitech, Zebra), and some
  older HP DesignJet large-format printers.

- **Manufacturer-supplied PPD files**: For PCL and PDF printers from
  Ricoh and OEM (Gestetner, InfoPrint, Infotec, Lanier, NRG, Ricoh,
  Savin) and from Samsung.

### Not included

- **PostScript**: For manufacturer-supplied PostScript support, use
  the [PostScript Printer
  Application](https://snapcraft.io/ps-printer-app).

- **HPLIP**: For practically all HP printers use the [HPLIP Printer
  Application](https://snapcraft.io/hplip-printer-app). It also
  supports HP's proprietary plugin for printers which need to load
  their firmware on startup or need a proprietary driver extension.

- **Gutenprint**: High-quality output with inkjets from Epson, Canon,
  and others, also PCL laser printers. A lot of adjustable
  parameters. Use the [Gutenprint Printer
  Application](https://snapcraft.io/gutenprint-printer-app).

- **`epson-inkjet-printer-escpr`**: Epson's free-software printer
  driver for ESC/P-R-based inkjet printers. It supports only 360 dpi
  resolution and a very awkward user interface which cannot get easily
  mapped to IPP. Therefore it is not included in this Printer
  Application. Use the [Gutenprint Printer
  Application](https://snapcraft.io/gutenprint-printer-app).

- **Braille embosser drivers**: We plan a separate Printer Application
  for that.

- **Scanners in multi-function devices**: We plan a SANE retro-fit
  Scanner Application.

### Properties

- A Printer Application providing Ghostscript-based printer
  drivers. Input data is converted to PDF or PostScript (if not
  already supplied in one of these formats) as these are the input
  data formats of Ghostscript, fed into Ghostscript and by Ghostscript
  converted into the printer's native language. In some cases
  Ghostscript produces generic raster output which is converted to the
  printer's language by an additional filter.

- PWG Raster, Apple Raster or image input data is converted to
  PostScript and not to PDF as PostScript is streamable, and this way
  large jobs need less resources or one can theoretically even print
  infinite jobs.

- This Printer Application also includes some separate, old and now
  unmaintained printer drivers which are too small projects for their
  own Printer Application. These can also consist of a CUPS Raster
  filter, not needing Ghostscript if the input is PWG Raster, Apple
  Raster, or an image.

- Note that most of the drivers (both inside Ghostscript and separate
  filters) are old, unmaintained code, for old printers which we do
  not have access to for testing. The packaging in the Snap (and also
  in Debian where the Snap uses a Debian source) is minimum-invasive
  to assure formerly working code stays working, but it is not assured
  due to changes in GCC and the libraries or due to the Snap
  environment.

- This Printer Application supports thousands of (usually older)
  printer models. The needed printer capability information and driver
  usage information is mainly taken from OpenPrinting's Foomatic
  database, but also from information which comes with individual
  drivers.

- From the Foomatic data CUPS PPD files are pre-built, compressed and
  packaged with the Snap. Also the foomatic-rip filter of
  cups-filters, Ghostscript, and the extra printer driver filters are
  included. With this a CUPS driver retro-fit using the pappl-retrofit
  library is done. This way we do not need to modify or adapt the now
  mostly unmaintained printer driver code, nor the Foomatic data or
  the PPD files. This is important as we do not have the printers for
  testing.

- We use the printer's IEEE-1284 device ID to identify manufacturer
  and model of the printer and look for explicit driver support for
  this model. If we do not find it, we check the CMD: field of the ID
  to see whetrher the printer supports any common data format,
  currently PostScript, PCL-6/XL, PCL 5c, and PCL 5e to select a
  generic driver.

- Available printer devices are discovered (and used) with CUPS'
  backends and not with PAPPL's own backends. This way quirk
  workarounds for USB printers with compatibility problems are used
  (and are editable) and any driver's output can get sent to the
  printer via IPP, IPPS (encrypted!), and LPD in addition to socket
  (usually port 9100). The SNMP backend can get configured (community,
  address scope).

- If you have an unusual system configuration or a personal firewall
  your printer will perhaps not get discovered. In this situation the
  fully manual "Network Printer" entry in combination with the
  hostname/IP field can be helpful.

- Standard job IPP attributes are mapped to the driver's option
  settings best fitting to them so that users can print from any type
  of client (like for example a phone or IoT device) which only
  supports standard IPP attributes and cannot retrive the PPD
  options. Trays, media sizes, media types, and duplex can get mapped
  easily, but when it comes to color and quality it gets more complex,
  as relevant options differ a lot in the PPD files. Here we use an
  algorithm which automatically (who wants hand-edit ~10000 PPD files
  for the assignments) finds the right set of option settings for each
  combination of `print-color-mode` (`color`/`monochrome`),
  `print-quality` (`draft`/`normal`/`high`), and
  `print-content-optimize`
  (`auto`/`photo`/`graphics`/`text`/`text-and-graphics`) in the PPD of
  the current printer. So you have easy access to the full quality or
  speed of your printer without needing to deal with printer-specific
  option settings (the original options are still accessible via web
  admin interface).

### To Do

- Human-readable strings for vendor options (Needs support by PAPPL:
  [Issue #58: Localization
  support](https://github.com/michaelrsweet/pappl/issues/58))

- Internationalization/Localization (Needs support by PAPPL: [Issue
  #58: Localization
  support](https://github.com/michaelrsweet/pappl/issues/58))

- SNMP Ink level check via ps_status() function (Needs support by PAPPL:
  [Issue #83: CUPS does IPP and SNMP ink level polls via backends,
  PAPPL should have functions for
  this](https://github.com/michaelrsweet/pappl/issues/83))

- Build options for cups-filters, to build without libqpdf and/or
  without libppd, the former will allow to create the Snap of this
  Printer Application without downloading and building QPDF


## THE SNAP

### Installing and building

To just run and use this Printer Application, simply install it from
the Snap Store:

```
sudo snap install --edge ghostscript-printer-app
```

Then follow the instructions below for setting it up.

To build the Snap by yourself, in the main directory of this
repository run

```
snapcraft snap
```

This will download all needed packages and build the Ghostscript
Printer Application. Note that PAPPL (upcoming 1.0) and cups-filters
(upcoming 2.0) are pulled directly from their GIT repositories, as
there are no appropriate releases yet. This can also lead to the fact
that this Printer Application will suddenly not build any more.

To install the resulting Snap run

```
sudo snap install --dangerous ghostscript-printer-app_1.0_amd64.snap
```


### Setting up

The Printer Application will automatically be started as a server daemon.

Enter the web interface

```
http://localhost:8000/
```

Use the web interface to add a printer. Supply a name, select the
discovered printer, then select make and model. Also set the installed
accessories, loaded media and the option defaults. Accessory
configuration and option defaults can also offen get polled from the
printer.

Then print PDF, PostScript, JPEG, Apple Raster, or PWG Raster files
with

```
ghostscript-printer-app FILE
```

or print with CUPS, CUPS (and also cups-browsed) discover and treat
the printers set up with this Printer Application as driverless IPP
printers (IPP Everywhere and AirPrint).

See

```
ghostscript-printer-app --help
```

for more options.

Use the "-o log-level=debug" argument for verbose logging in your
terminal window.

You can add files to `/var/snap/ghostscript-printer-app/common/usb/`
for additional USB quirk rules. Edit the existing files only for quick
tests, as they get replaced at every update of the Snap (to introduce
new rules).

You can edit the
`/var/snap/ghostscript-printer-app/common/cups/snmp.conf` file for
configuring SNMP network printer discovery.

For the `pnm2ppa` driver you can edit the configuration file:

```
/var/snap/ghostscript-printer-app/common/pnm2ppa/pnm2ppa.conf
```

For the `foo2zjs` and `m2300w` drivers you can add color profiles in
the appropriate subdirectories of

```
/var/snap/ghostscript-printer-app/common/foo2zjs/
/var/snap/ghostscript-printer-app/common/m2300w/
```

Automatic firmware loading by foo2zjs is not supported. If you have
one of these HP printers which need it, use the HPLIP Printer
Application and download HP's plugin (use the web interface of the
HPLIP Printer Application for that).

All the changes mentioned her take effect with the next print job.

If you mess up any configuration file under
`/var/snap/ghostscript-printer-app/common/`, simply delete it (or move
it away) and restart the Snap to get it restored.

## THE ROCK (OCI CONTAINER IMAGE)

### Install from Docker Hub
#### Prerequisites

1. **Docker Installed**: Ensure Docker is installed on your system. You can download it from the [official Docker website](https://www.docker.com/get-started).
```sh
  sudo snap install docker
```

#### Step-by-Step Guide

You can pull the `ghostscript-printer-app` Docker image from either the GitHub Container Registry or Docker Hub.

**From GitHub Container Registry** <br>
To pull the image from the GitHub Container Registry, run the following command:
```sh
  sudo docker pull ghcr.io/openprinting/ghostscript-printer-app:latest
```

To run the container after pulling the image from the GitHub Container Registry, use:
```sh
  sudo docker run -d \
      --name ghostscript-printer-app \
      --network host \
      -e PORT=<port> \
      ghcr.io/openprinting/ghostscript-printer-app:latest
```

**From Docker Hub** <br>
Alternatively, you can pull the image from Docker Hub, by running:
```sh
  sudo docker pull openprinting/ghostscript-printer-app
```

To run the container after pulling the image from Docker Hub, use:
```sh
  sudo docker run -d \
      --name ghostscript-printer-app \
      --network host \
      -e PORT=<port> \
      openprinting/ghostscript-printer-app:latest
```

- `PORT` is an optional environment variable used to start the printer-app on a specified port. If not provided, it will start on the default port 8000 or, if port 8000 is busy, on 8001 and so on.
- **The container must be started in `--network host` mode** to allow the Printer-Application instance inside the container to access and discover printers available in the local network where the host system is in.
- Alternatively using the internal network of the Docker instance (`-p <port>:8000` instead of `--network host -e PORT=<port>`) only gives access to local printers running on the host system itself.

### Setting Up and Running gutenprint-printer-app locally

#### Prerequisites

**Docker Installed**: Ensure Docker is installed on your system. You can download it from the [official Docker website](https://www.docker.com/get-started) or from the Snap Store:
```sh
  sudo snap install docker
```

**Rockcraft**: Rockcraft should be installed. You can install Rockcraft using the following command:
```sh
  sudo snap install rockcraft --classic
```

**Skopeo**: Skopeo should be installed to compile `*.rock` files into Docker images. It comes bundled with Rockcraft, so no separate installation is required.

#### Step-by-Step Guide

**Build ghostscript-printer-app rock**

The first step is to build the Rock from the `rockcraft.yaml`. This image will contain all the configurations and dependencies required to run ghostscript-printer-app.

Open your terminal and navigate to the directory containing your `rockcraft.yaml`, then run the following command:

```sh
  rockcraft pack -v
```

**Compile to Docker Image**

Once the rock is built, you need to compile docker image from it.

```sh
  sudo rockcraft.skopeo --insecure-policy copy oci-archive:<rock_image> docker-daemon:ghostscript-printer-app:latest
```

**Run the ghostscript-printer-app Docker Container**

```sh
  sudo docker run -d \
      --name ghostscript-printer-app \
      --network host \
      -e PORT=<port> \
      ghostscript-printer-app:latest
```
- `PORT` is an optional environment variable used to start the printer-app on a specified port. If not provided, it will start on the default port 8000 or, if port 8000 is busy, on 8001 and so on.
- **The container must be started in `--network host` mode** to allow the Printer-Application instance inside the container to access and discover printers available in the local network where the host system is in.
- Alternatively using the internal network of the Docker instance (`-p <port>:8000` instead of `--network host -e PORT=<port>`) only gives access to local printers running on the host system itself.

#### Setting up

Enter the web interface

```sh
http://localhost:<port>/
```

Use the web interface to add a printer. Supply a name, select the
discovered printer, then select make and model. Also set the installed
accessories, loaded media and the option defaults. If the printer is a
PostScript printer, accessory configuration and option defaults can
also often get polled from the printer.

<!-- Begin Included Components -->
## Included Components
  - pappl v1.4.8
  - qpdf v11.9.1
  - ghostscript ghostpdl-10.05.0-test-base-001
  - cups v2.4.11
  - libcupsfilters 2.1.0
  - libppd 2.1.0
  - cups-filters 2.0.1
  - pyppd release-1-1-0
  - foomatic-db 20240504
  - hplip debian/3.22.10+dfsg0-6
  - c2050 debian/0.3-7
  - cjet debian/0.8.9-11
  - min12xxw debian/0.0.9-11
  - pnm2ppa debian/1.13-13
  - c2esp debian/27-11
  - dymo-cups-drivers debian/1.4.0-12
  - foo2zjs debian/20200505dfsg0-3
  - fxlinuxprint debian/1.1.0+ds-4
  - m2300w debian/0.51-15
  - printer-driver-oki 1.0.2
  - pxljr debian/1.4+repack0-6
  - rastertosag-gdi debian/0.1-8
  - splix debian/2.0.1-1
  - brlaser v6
  - ptouch-driver debian/1.7-1
<!-- End Included Components -->

## BUILDING WITHOUT PACKAGING OR INSTALLATION

You can also do a "quick-and-dirty" build without snapping and without
needing to install [PAPPL](https://www.msweet.org/pappl),
[cups-filters 2.x](https://github.com/OpenPrinting/cups-filters), and
[pappl-retrofit](https://github.com/OpenPrinting/pappl-retrofit) into
your system. You need a directory with the latest GIT snapshot of
PAPPL, the latest GIT snapshot of cups-filters, and the latest GIT
snapshot of pappl-retrofit (master branches of each). They all need to
be compiled (`./autogen.sh; ./configure; make`), installing not
needed. Also install the header files of all needed libraries
(installing "libcups2-dev" should do it).

In the directory with ghostscript-printer-app.c run the command line

```
gcc -o ghostscript-printer-app ghostscript-printer-app.c $PAPPL_SRC/pappl/libpappl.a $CUPS_FILTERS_SRC/.libs/libppd.a $CUPS_FILTERS_SRC/.libs/libcupsfilters.a $PAPPL_RETROFIT_SRC/.libs/libpappl-retrofit.a -ldl -lpthread  -lppd -lcups -lavahi-common -lavahi-client -lgnutls -ljpeg -lpng16 -ltiff -lz -lm -lusb-1.0 -lpam -lqpdf -lstdc++ -I. -I$PAPPL_SRC/pappl -I$CUPS_FILTERS_SRC/ppd -I$CUPS_FILTERS_SRC/cupsfilters -I$PAPPL_RETROFIT_SRC/pappl/retrofit -L$CUPS_FILTERS_SRC/.libs/ -L$PAPPL_RETROFIT_SRC/.libs/
```

There is also a Makefile, but this needs PAPPL, cups-filters 2.x, and
pappl-retrofit to be installed into your system.

Run

```
./ghostscript-printer-app --help
```

When running the non-snapped version, by default, PPD files are
searched for in

```
/usr/share/ppd/
/usr/lib/cups/driver/
/var/lib/ghostscript-printer-app/ppd/
```

You can set the `PPD_PATHS` environment variable to search other
places instead:

```
PPD_PATHS=/path/to/my/ppds:/my/second/place ./ghostscript-printer-app server
```

Simply put a colon-separated list of any amount of paths into the
variable. Creating a wrapper script is recommended.

This Printer Application uses CUPS' backends and not PAPPL's, meaning
that for USB printers CUPS' USB quirk workarounds for compatibility
problems are used, network printers can also be used with IPP, IPPS,
and LPD protocols, and SNMP printer discovery is configurable.

USB Quirk rules in `/usr/share/cups/usb` and the `/etc/cups/snmp.conf`
file can get edited if needed.

Make sure you have Ghostscript, CUPS (at least its backends), and the
desired printer drivers (if not built into Ghostscript) installed.

For access to the test page `testpage.ps` use the TESTPAGE_DIR
environment variable:

```
TESTPAGE_DIR=`pwd` PPD_PATHS=/path/to/my/ppds:/my/second/place ./ghostscript-printer-app server
```

or for your own creation of a test page (PostScript, PDF, PNG, JPEG,
Apple Raster, PWG Raster):

```
TESTPAGE=/path/to/my/testpage/my_testpage.ps PPD_PATHS=/path/to/my/ppds:/my/second/place ./ghostscript-printer-app server
```


## LEGAL STUFF

The Ghostcript Printer Application is Copyright © 2020 by Till Kamppeter.

It is derived from the HP PCL Printer Application, a first working model of
a raster Printer Application using PAPPL. It is available here:

https://github.com/michaelrsweet/hp-printer-app

The HP PCL Printer Application is Copyright © 2019-2020 by Michael R Sweet.

This software is licensed under the Apache License Version 2.0 with an exception
to allow linking against GPL2/LGPL2 software (like older versions of CUPS).  See
the files "LICENSE" and "NOTICE" for more information.