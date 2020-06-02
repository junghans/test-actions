#!/bin/bash -l

echo "$1"
echo CXX=$CXX
touch myfile
echo echo "::set-output name=cmake_args::-DBUILD_SHARED_LIBS=ON"
ls
pwd
