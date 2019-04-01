cmake_minimum_required(VERSION 3.12)
project(vcpkg-test-uvw)

find_package(uvw CONFIG REQUIRED)

add_executable(test main.cpp)
target_link_libraries(test PRIVATE uvw::uvw)
