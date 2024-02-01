#!/bin/bash

# Fail the script if any command fails
set -e

# GDAL version
GDAL_VERSION="3.5.3"

# Clone the GDAL repository for simulator
git clone https://github.com/OSGeo/gdal.git $HOME/opt/gdal_simulator

cd $HOME/opt/gdal_simulator
git checkout tags/v$GDAL_VERSION -b v$GDAL_VERSION

# Adjust PREFIX and OS for simulator build
PREFIX=$HOME/build/iphonesimulator
OS=SIMULATOR

ZSTD_PREFIX=$HOME/build/zstd_ios_simulator_arm64


# Create build directory
rm -rf build_$OS
mkdir build_$OS
cd build_$OS

# Run cmake with the required options
cmake -DCMAKE_TOOLCHAIN_FILE=$CMTOOLCHAIN \
      -DPLATFORM=$OS \
      -DENABLE_BITCODE=OFF \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBUILD_SHARED_LIBS=OFF \
      -DBUILD_APPS=OFF \
      -DBUILD_PYTHON_BINDINGS=OFF \
      -DPROJ_ROOT=$PREFIX \
      -DSQLITE3_INCLUDE_DIR=$PREFIX/include \
      -DSQLITE3_LIBRARY=$PREFIX/lib/libsqlite3.a \
      -DIconv_INCLUDE_DIR=$SDKPATH/usr \
      -DIconv_LIBRARY=$SDKPATH/usr/lib/libiconv.tbd \
      -DCMAKE_BUILD_TYPE=Release \
      ..

# Build and install
cmake --build .
cmake --build . --target install