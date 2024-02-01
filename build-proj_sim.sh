#!/bin/bash

# Ensure script fails if any command fails
set -e

# PROJ version
PROJ_VERSION="9.3.1"

# Clone the PROJ repository for simulator
git clone https://github.com/OSGeo/PROJ.git $HOME/opt/proj_simulator

cd $HOME/opt/proj_simulator
git checkout $PROJ_VERSION

# Adjust PREFIX and OS for simulator build
PREFIX=$HOME/build/iphonesimulator
OS=SIMULATOR

# Create build directory
rm -rf build_$OS
mkdir build_$OS
cd build_$OS

# Run cmake with the required options for simulator
cmake -DCMAKE_TOOLCHAIN_FILE=$CMTOOLCHAIN \
      -DPLATFORM=SIMULATORARM64 \
      -DENABLE_BITCODE=OFF \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBUILD_SHARED_LIBS=OFF \
      -DENABLE_TIFF=OFF -DENABLE_CURL=OFF \
      -DBUILD_PROJSYNC=OFF \
      -DSQLITE3_INCLUDE_DIR=$PREFIX/include \
      -DSQLITE3_LIBRARY=$PREFIX/lib/libsqlite3.a \
      ..

# Build and install
cmake --build .
cmake --build . --target install