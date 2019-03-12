#!/bin/bash
set -e

NAME_VERSION="x48-0.6.4"

./autogen.sh
./configure
rm -rf $NAME_VERSION && mkdir $NAME_VERSION
cp -ar aclocal.m4 AUTHORS ChangeLog compile config* COPYING debian depcomp INSTALL install-sh Makefile* missing NEWS README romdump rpm src version.m4 $NAME_VERSION
tar -cvzf ~/rpmbuild/SOURCES/$NAME_VERSION.tar.gz $NAME_VERSION
( cd rpm && rpmbuild --verbose -bb x48.spec )
rm -rf $NAME_VERSION
sudo dnf -y install ~/rpmbuild/RPMS/x86_64/$NAME_VERSION*.rpm
mkdir -p ~/.hp48
cp -av ROMs/* ~/.hp48
( cd ~/.hp48 && ln -svf sxrom-j rom && ln -svf rom rom.dump && if [ ! -s hp48 ] ; then x48 -initialize ; fi )

