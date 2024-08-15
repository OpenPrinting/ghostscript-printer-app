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


### Contained Printer Drivers (in the Rock)

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
  file in the Rock is user-editable, see below.

- **`pxljr`**: For HP Color LaserJet 3500/3550/3600, should give
  better output quality than HPLIP.

- **`foo2zjs`**: Driver for laser printers with proprietary languages,
  from Dell, Epson, Fuji, HP, Kyocera, Lexmark, (Konica) Minolta, Oki,
  Olivetti, Ricoh, Samsung, Xerox. Note that the firmware loading
  facility for HP is not included in this Printer Application, use the
  [HPLIP Printer Application](https://snapcraft.io/hplip-printer-app)
  (download proprietary plugin in-app, via web interface) for these
  printers, the firmware is proprietary anyway. In the Rock the user
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
  Lexmark, Canon, and Minolta printers. For `m2300w` in the Rock the
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
  not have access to for testing. The packaging in the Rock (and also
  in Debian where the Rock uses a Debian source) is minimum-invasive
  to assure formerly working code stays working, but it is not assured
  due to changes in GCC and the libraries or due to the Rock
  environment.

- This Printer Application supports thousands of (usually older)
  printer models. The needed printer capability information and driver
  usage information is mainly taken from OpenPrinting's Foomatic
  database, but also from information which comes with individual
  drivers.

- From the Foomatic data CUPS PPD files are pre-built, compressed and
  packaged with the Rock. Also the foomatic-rip filter of
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

## Install from Docker Hub
### Prerequisites

1. **Docker Installed**: Ensure Docker is installed on your system. You can download it from the [official Docker website](https://www.docker.com/get-started).

### Step-by-Step Guide

#### 1. Pull the ghostscript-printer-app docker image:

The first step is to pull the ghostscript-printer-app Docker image from Docker Hub.
```sh
sudo docker pull openprinting/ghostscript-printer-app
```

#### 2. Start the ghostscript-printer-app Container

##### Run the following Docker command to run the ghostscript-printer-app image:
```sh
sudo docker run --rm -d --name ghostscript-printer-app -p <port>:8000 \
    openprinting/ghostscript-printer-app:latest
```

## Setting Up and Running ghostscript-printer-app locally

### Prerequisites

1. **Docker Installed**: Ensure Docker is installed on your system. You can download it from the [official Docker website](https://www.docker.com/get-started).

2. **Rockcraft**: Rockcraft should be installed. You can install Rockcraft using the following command:
```sh
sudo snap install rockcraft --classic
```

3. **Skopeo**: Skopeo should be installed to compile `.rock` files into Docker images. <br>
**Note**: It comes bundled with Rockcraft.

### Step-by-Step Guide

#### 1. Build ghostscript-printer-app rock:

The first step is to build the Rock from the `rockcraft.yaml`. This image will contain all the configurations and dependencies required to run ghostscript-printer-app.

Open your terminal and navigate to the directory containing your `rockcraft.yaml`, then run the following command:

```sh
rockcraft pack -v
```

#### 2. Compile to Docker Image:

Once the rock is built, you need to compile docker image from it.

```sh
sudo rockcraft.skopeo --insecure-policy copy oci-archive:<rock_image> docker-daemon:ghostscript-printer-app:latest
```

#### Run the ghostscript-printer-app Docker Container:

```sh
sudo docker run --rm -d --name ghostscript-printer-app -p <port>:8000 \
    ghostscript-printer-app:latest
```

### Setting up

Enter the web interface

```sh
http://localhost:<port>/
```

Use the web interface to add a printer. Supply a name, select the
discovered printer, then select make and model. Also set the installed
accessories, loaded media and the option defaults. Accessory
configuration and option defaults can also offen get polled from the
printer.