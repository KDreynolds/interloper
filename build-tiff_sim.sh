#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Define where to install the libraries
PREFIX=$HOME/build/iphonesimulator_x86_64

# Clone the TIFF library
git clone https://gitlab.com/libtiff/libtiff.git $HOME/opt/libtiff
cd $HOME/opt/libtiff

# Checkout a specific version if needed
# git checkout <tag_version>

# Create or enter the build directory
mkdir -p build
cd build

# Configure the build with CMake
cmake .. -DCMAKE_TOOLCHAIN_FILE=$CMTOOLCHAIN \
         -DPLATFORM=SIMULATOR64 \
         -DCMAKE_INSTALL_PREFIX=$PREFIX \
         -DBUILD_SHARED_LIBS=OFF \
         -Dld-version-script=OFF \
         -Djpeg=ON \
         -DZIP_SUPPORT=ON

# Build and install
cmake --build . --config Release
cmake --install . --config Release