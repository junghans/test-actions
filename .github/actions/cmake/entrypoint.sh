#!/bin/bash -l

echo "$1"
echo CXX=$CXX
touch myfile
echo "::set-output name=cmake-args::-DBUILD_SHARED_LIBS=ON"
ls
pwd
