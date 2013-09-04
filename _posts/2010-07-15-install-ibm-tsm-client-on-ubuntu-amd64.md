---
layout: post
title: Install IBM TSM Client on Ubuntu (amd64)
tags:
- TSM
- ubuntu
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '95'
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
---
<strong>1. Get the RPMs for the client software</strong>
You should have them already when you read this.

<strong>2. Additional software that may be required</strong>
sudo apt-get install ksh libstdc++5

<strong>3. Unpack the archive</strong>
tar xvf 6.1.3.0-TIV-TSMBAC-LinuxX86.tar

<!--more-->

<strong>4. Unpack the RPM archives</strong>
alien -g TIVsm-API.i386.rpm
alien -g TIVsm-BA.i386.rpm
alien -g TIVsm-API64.i386.rpm

<strong>5. Change directory names</strong>
mv TIVsm-API-6.1.3/debian TIVsm-API-6.1.3/DEBIAN
mv TIVsm-BA-6.1.3/debian TIVsm-BA-6.1.3/DEBIAN
mv TIVsm-API64-6.1.3/debian TIVsm-API64-6.1.3/DEBIAN

<strong>6. Edit the control files</strong>
vim TIVsm-API-6.1.3/DEBIAN/control
-- remove blank line after "Maintainer:" line
-- in "Architecture:" line change "i386" to "amd64"
-- delete "${shlibs:Depends}" in "Depends:" line
-- joing two "Description:" lines into one line
-- insert line "Version: 6.1.3"
-- delete last two lines " ." and " (Converted..."
-- append an empty line as last line
|Source: tivsm-api
|Section: alien
|Priority: extra
|Maintainer: who you are
|Package: tivsm-api
|Architecture: amd64
|Depends:
|Description: the API IBM Tivoli Storage Manager API
|Version: 6.1.3
|
-- save and exit

vim TIVsm-BA-6.1.3/DEBIAN/control
-- remove blank line after "Maintainer:" line
-- in "Architecture:" line change "i386" to "amd64"
-- delete "${shlibs:Depends}" in "Depends:" line
-- joing two "Description:" lines into one line
-- insert line "Version: 6.1.3"
-- delete last two lines " ." and " (Converted..."
-- append an empty line as last line
|Source: tivsm-ba
|Section: alien
|Priority: extra
|Maintainer: who you are
|Package: tivsm-ba
|Architecture: amd64
|Depends:
|Description: the Backup Archive Client IBM Tivoli Storage Manager Client
|Version: 6.1.3
|
-- save and exit

vim TIVsm-API64-6.1.3/DEBIAN/control
-- remove blank line after "Maintainer:" line
-- in "Architecture:" line change "i386" to "amd64"
-- delete "${shlibs:Depends}" in "Depends:" line
-- joing two "Description:" lines into one line
-- insert line "Version: 6.1.3"
-- delete last two lines " ." and " (Converted..."
-- append an empty line as last line
|Source: tivsm-api64
|Section: alien
|Priority: extra
|Maintainer: who you are
|Package: tivsm-api64
|Architecture: amd64
|Depends:
|Description: the API IBM Tivoli Storage Manager API
|Version: 6.1.3
|
-- save and exit

<strong>7. Create *.deb packages</strong>
dpkg -b TIVsm-API-6.1.3
dpkg -b TIVsm-BA-6.1.3
dpkg -b TIVsm-API64-6.1.3

<strong>8. Install *.deb packages</strong>
sudo dpkg -i TIVsm-API-6.1.3.deb
sudo dpkg -i TIVsm-BA-6.1.3.deb
sudo dpkg -i TIVsm-API64-6.1.3.deb

<strong>9. Create/modify TSM configuration files</strong>
vim /opt/tivoli/tsm/client/ba/bin/dsm.opt
| ServerName TSMServer
| Domain ALL-LOCAL
| DateFormat 3
-- save and exit

vim /opt/tivoli/tsm/client/ba/bin/dsm.sys
| ServerName TSMServer
| CommMethod TCPip
| TcpPort 1500
| TcpServerAddress tsmserver.your.domain.com
| NodeName registered-name-for-this-system
| PasswordAccess generate
| Compression On
| ErrorLogName /var/log/dsmerror.log
| ErrorLogRetention 5 D
| SchedLogName /var/log/dsmsched.log
| SchedLogRetention 5 D
|* InclExcl /opt/tivoli/tsm/client/ba/bin/dsm.inclexcl
-- set the TcpServerAddress to the fully qualified name of the TSM Server
-- set the NodeName to the node name as registered with the TSM Server
-- save and exit

<strong>10. Possible errors</strong>

<strong>/usr/bin/dsmc: No such file or directory, but the file /usr/bin/dsmc is present</strong>

run

ldd /usr/bin/dsmc

if it says "not a dynamic executable"

sudo apt-get install ia32-libs

<strong>dsmc: error while loading shared libraries: libgpfs.so: cannot open shared object file: No such file or directory</strong>

Print shared library dependencies (not necessary):
ldd /usr/bin/dsmc

sudo vim /etc/ld.so.conf.d/tivoli.conf
--add line:  /opt/tivoli/tsm/client/api/bin/

sudo ldconfig

<strong>ANS0102W Unable to open the message repository /opt/tivoli/tsm/client/ba/bin/EN_US/dsmclientV3.cat. The American English repository will be used instead.</strong>

cd /opt/tivoli/tsm/client/ba/bin
sudo ln -s /opt/tivoli/tsm/client/lang/EN_US

<strong>dsmj (GUI) starts to load, but then gives the error: "ANS5179E TSM is unable to continue. Exiting program."</strong>

cd /usr/lib
sudo ln -s ../../opt/tivoli/tsm/client/api/bin/libxerces-c1_6_0.so /usr/lib/libtsm613xerces-c1_6_0.so

<strong>11. Run TSM client by:</strong>
sudo dsmc (command line)
or
sudo dsmj (GUI)

<strong>References:</strong>

<a href="http://www.adsm.org/forum/showthread.php?t=16637">http://www.adsm.org/forum/showthread.php?t=16637</a>
<a href="http://www.adsm.org/forum/showthread.php?t=17756">http://www.adsm.org/forum/showthread.php?t=17756</a>
<a href="http://www.adsm.org/forum/showthread.php?t=3809">http://www.adsm.org/forum/showthread.php?t=3809</a>
<a href="http://publib.boulder.ibm.com/infocenter/tsminfo/v6/index.jsp?topic=/com.ibm.itsm.client.doc/t_cfg_crtdefopt.html">http://publib.boulder.ibm.com/infocenter/tsminfo/v6/index.jsp?topic=/com.ibm.itsm.client.doc/t_cfg_crtdefopt.html</a>
<a href="http://wiki.bolay.net/doku.php?id=operating_systems:linux:debian:installing_the_tsm_client">http://wiki.bolay.net/doku.php?id=operating_systems:linux:debian:installing_the_tsm_client</a>
<a href="http://www.oucs.ox.ac.uk/hfs/help/faq/index.xml.ID=solaris">http://www.oucs.ox.ac.uk/hfs/help/faq/index.xml.ID=solaris</a>