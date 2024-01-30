#!/bin/bash

# Define libiconv version
LIBICONV_VERSION="1.16" # Replace with the desired version

# Download and extract libiconv
curl -O https://ftp.gnu.org/pub/gnu/libiconv/libiconv-${LIBICONV_VERSION}.tar.gz
tar xzf libiconv-${LIBICONV_VERSION}.tar.gz
cd libiconv-${LIBICONV_VERSION}


# Run cmake with the required options
cmake -DCMAKE_TOOLCHAIN_FILE=$CMTOOLCHAIN \
      -DPLATFORM=$OS \
      -DENABLE_BITCODE=OFF \
      -DBUILD_SHARED_LIBS=OFF \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DENABLE_TIFF=OFF -DENABLE_CURL=OFF \

# Build and install
cmake --build .
cmake --build . --target install