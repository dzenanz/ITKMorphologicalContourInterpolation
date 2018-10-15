#!/bin/bash

# This is a script to build the modules and run the test suite in the base
# Docker container.

die() {
  echo "Error: $@" 1>&2
  exit 1;
}

cd /usr/src/ITKMorphologicalContourInterpolation-build || die "Could not cd into the build directory"

cmake \
  -G Ninja \
  -DCMAKE_CXX_FLAGS='-std=c++11' \
  -DITK_DIR:PATH=/usr/src/ITK-build \
  -DCMAKE_BUILD_TYPE:STRING=Release \
  -DBUILDNAME:STRING=External-MorphologicalContourInterpolation \
    /usr/src/ITKMorphologicalContourInterpolation || die "CMake Algo B configuration failed"
ctest -VV -D Experimental || die "ctest failed"
