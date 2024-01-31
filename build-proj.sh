#!/bin/bash

# Ensure script fails if any command fails
set -e

# PROJ version
PROJ_VERSION="9.3.1" # Replace with the actual version you're using

# Clone the PROJ repository
git clone https://github.com/OSGeo/PROJ.git $HOME/opt/proj
cd $HOME/opt/proj
git checkout $PROJ_VERSION

# Create build directory
rm -rf build_$OS
mkdir build_$OS
cd build_$OS

# Run cmake with the required options
cmake -DCMAKE_TOOLCHAIN_FILE=$CMTOOLCHAIN \
      -DPLATFORM=$OS \
      -DENABLE_BITCODE=OFF \
      -DBUILD_SHARED_LIBS=OFF \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DENABLE_TIFF=OFF -DENABLE_CURL=OFF \
      -DBUILD_PROJSYNC=OFF \
      -DSQLITE3_INCLUDE_DIR=$PREFIX/include \
      -DSQLITE3_LIBRARY=$PREFIX/lib/libsqlite3.a \
      ..

# Build and install
cmake --build .
cmake --build . --target install