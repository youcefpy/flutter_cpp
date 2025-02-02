cmake_minimum_required(VERSION 3.10)

project(hello_lib)

# Ensure we build a shared library (.so)
add_library(hello SHARED hello.cpp)

# Define include directories (if needed)
target_include_directories(hello PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# Export function for FFI
set_target_properties(hello PROPERTIES PUBLIC_HEADER hello.h)
