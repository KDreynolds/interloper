# CMake

This directory contains the CMake build config for GDAL.

## Building

First, clone the submodules:

```bash
git submodule update --init --recursive
```

Then, create a build directory and run CMake:

```bash
mkdir build
cd build
cmake ..
```

Finally, build the project:

```bash
cmake --build . -j 8
```

Use a different value for `-j` to specify the number of parallel jobs to run.
