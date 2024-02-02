#!/bin/bash

set -e

PREFIX=$HOME/build/iphonesimulator_x86_64

git clone https://github.com/OSGeo/libgeotiff.git $HOME/opt/libgeotiff
cd $HOME/opt/libgeotiff

mkdir build && cd build

cmake .. -DCMAKE_TOOLCHAIN_FILE=$CMTOOLCHAIN \
         -DPLATFORM=SIMULATOR64 \
         -DCMAKE_INSTALL_PREFIX=$PREFIX

cmake --build . --config Release
cmake --install . --config Release