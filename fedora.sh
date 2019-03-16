#!/bin/bash
set -e

NAME_VERSION="x48-0.6.4"

./autogen.sh
./configure
rm -rf $NAME_VERSION && mkdir $NAME_VERSION
cp -ar aclocal.m4 AUTHORS ChangeLog compile config* COPYING depcomp INSTALL install-sh Makefile* missing NEWS README ROMs/* romdump rpm src version.m4 x48.png $NAME_VERSION
tar -cvzf ~/rpmbuild/SOURCES/$NAME_VERSION.tar.gz $NAME_VERSION
( cd rpm && rpmbuild --verbose -bb x48.spec )
rm -rf $NAME_VERSION
sudo dnf -y install ~/rpmbuild/RPMS/x86_64/$NAME_VERSION*.rpm
x48
