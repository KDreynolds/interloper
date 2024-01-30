#!/bin/bash

# Clone the SQLite amalgamation repository
git clone https://github.com/azadkuh/sqlite-amalgamation.git /opt/sqlite-amalgamation

# Navigate to the repository
cd /opt/sqlite-amalgamation

# Remove any existing build directory and create a new one
rm -rf build_$OS
mkdir build_$OS
cd build_$OS

# Run cmake with the required options
cmake -DCMAKE_TOOLCHAIN_FILE=$CMTOOLCHAIN \
      -DPLATFORM=$OS \
      -DENABLE_BITCODE=OFF \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBUILD_SHARED_LIBS=OFF \
      -DSQLITE_ENABLE_RTREE=ON \
      -DSQLITE_ENABLE_COLUMN_METADATA=ON \
      -DSQLITE_OMIT_DECLTYPE=OFF \
      ..

# Build and install
cmake --build .
cmake --build . --target install