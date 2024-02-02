#!/bin/bash

# Clone the SQLite amalgamation repository for simulator
git clone https://github.com/azadkuh/sqlite-amalgamation.git $HOME/opt/sqlite-amalgamation_simulator

cd $HOME/opt/sqlite-amalgamation_simulator

# Adjust PREFIX and OS for simulator build
PREFIX=$HOME/build/iphonesimulator
OS=SIMULATORCOMBINED

# Create build directory
rm -rf build_$OS
mkdir build_$OS
cd build_$OS

# Run cmake with the required options for simulator
cmake . -G Xcode \
      -DCMAKE_TOOLCHAIN_FILE=$CMTOOLCHAIN \
      -DPLATFORM=OOS64COMBINED  \
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