#!/bin/bash
set -e

./autogen.sh
./configure
tar -cvzf x48-0.6.4.tar.gz aclocal.m4 AUTHORS ChangeLog compile config* COPYING debian depcomp INSTALL install-sh Makefile* missing NEWS README rpm src version.m4
cd rpm && rpmbuild -bb x48.spec

