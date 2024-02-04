cmake_minimum_required(VERSION 3.27)
project(gdal-ios LANGUAGES C CXX)

###############################
# iOS Toolchain Configuration #
###############################

if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/ios-cmake/ios.toolchain.cmake)
    message(FATAL_ERROR "ios-cmake submodule not present! Please run `git submodule update --init --recursive`")
endif()

# Build a fat library (ARM64 + x86_64)
set(PLATFORM OS64COMBINED)

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/ios-cmake/ios.toolchain.cmake)

################################
# GDAL Configuration           #
################################

set(GDAL_BUILD_OPTIONAL_DRIVERS OFF CACHE BOOL "Build optional GDAL drivers")
set(OGR_BUILD_OPTIONAL_DRIVERS OFF CACHE BOOL "Build optional OGR drivers")

# Add GDAL subdirectory
add_subdirectory(gdal)

