#!/bin/bash
set +e

echo "Reset environment variables"
export CC=gcc-7
export CXX=g++-7

echo "Checkout vcpkg fork"
git clone https://github.com/Helco/vcpkg
cd vcpkg
git checkout libuv_uvw_1_27
./bootstrap-vcpkg.sh

echo "Install uvw"
touch -R ./*
CC=gcc CXX=g++ ./vcpkg install uvw

echo "Build test repository"
cd ..
mkdir build
toolchain_param="-DCMAKE_TOOLCHAIN_FILE="`pwd`"/vcpkg/scripts/buildsystems/vcpkg.cmake"
cd build
cmake $toolchain_param ..
cmake --build .
./test
