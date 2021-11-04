cmake_minimum_required(VERSION 3.5)

# Set package metadata.
set(CPACK_PACKAGE_NAME "fortran_examples")
set(CPACK_PACKAGE_VERSION_MAJOR "0")
set(CPACK_PACKAGE_VERSION_MINOR "1")
set(CPACK_PACKAGE_VERSION_PATCH "0")

# Set project details.
project(fortran_exaples)
enable_language(Fortran)
set(PROJECT_DESCRIPTION "${CPACK_PACKAGE_NAME}")


set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output)

add_executable(
	01_example
	source/01_example.f95
)


# Setup CTest
include(CTest)
enable_testing()
