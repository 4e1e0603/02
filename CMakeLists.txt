cmake_minimum_required(VERSION 3.10)

enable_language(Fortran)
SET(CMAKE_FC_COMPILER  "C:/Users/dlanda/gcc/bin/gfortran.exe")

# Set project details.
project(
    fortran_examples
    LANGUAGES Fortran
    )

set(PROJECT_DESCRIPTION "${CPACK_PACKAGE_NAME}")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output)

# Set the executable/targets for each example.
add_executable(arrays_01 source/arrays_01.f90)

# Setup CTest
include(CTest)
enable_testing()

# Set package metadata.
set(CPACK_PACKAGE_NAME "fortran_examples")
set(CPACK_PACKAGE_VERSION_MAJOR "0")
set(CPACK_PACKAGE_VERSION_MINOR "1")
set(CPACK_PACKAGE_VERSION_PATCH "0")
