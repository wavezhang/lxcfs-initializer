#!/bin/bash

set -e

rpmdev-setuptree && cd /root/rpmbuild

wget https://github.com/Zexi/lxcfs/archive/cpu-view.zip -O /root/rpmbuild/SOURCES/cpu-view.zip

cp /root/lxcfs.spec /root/rpmbuild/SPECS
rpmbuild -bb /root/rpmbuild/SPECS/lxcfs.spec
