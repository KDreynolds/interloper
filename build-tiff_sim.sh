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

# Create build directory
mkdir build && cd build

# Configure the build
cmake .. -DCMAKE_TOOLCHAIN_FILE=$CMTOOLCHAIN \
         -DPLATFORM=SIMULATOR64 \
         -DCMAKE_INSTALL_PREFIX=$PREFIX

# Build and install
cmake --build . --config Release
cmake --install . --config Release