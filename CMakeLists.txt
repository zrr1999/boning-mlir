cmake_minimum_required(VERSION 3.10)
project(boning-mlir LANGUAGES CXX C)

if(POLICY CMP0068)
  cmake_policy(SET CMP0068 NEW)
  set(CMAKE_BUILD_WITH_INSTALL_NAME_DIR ON)
endif()

if(POLICY CMP0075)
  cmake_policy(SET CMP0075 NEW)
endif()

if(POLICY CMP0077)
  cmake_policy(SET CMP0077 NEW)
endif()

if(POLICY CMP0116)
  cmake_policy(SET CMP0116 OLD)
endif()

include(cmake/init.cmake)
include(cmake/3rdparty.cmake)


set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${BONING_BINARY_DIR})

set(BONING_EXAMPLES OFF CACHE BOOL "Build examples")
set(BONING_ENABLE_OPENCV OFF CACHE BOOL "Enable OpenCV support.")

# Generate libraries into `lib` of build directory.
set(LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)

# Add BONING files to the include path
include_directories(${BONING_SOURCE_DIR}/include)
include_directories(${BONING_MIDEND_INCLUDE_DIR})
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(${CMAKE_CURRENT_BINARY_DIR}/midend/include)
# include_directories(${BONING_MIDEND_INCLUDE_DIR}/Interface)
# include_directories(${BONING_MIDEND_INCLUDE_DIR}/Dialect)
# include_directories(${CMAKE_CURRENT_BINARY_DIR}/midend/include/Dialect)
# include_directories(${CMAKE_CURRENT_BINARY_DIR}/backend/include)
# include_directories(${BONING_SOURCE_DIR}/lib)
# include_directories(${BONING_THIRDPARTY_INCLUDE_DIR})
# include_directories(${BONING_SOURCE_DIR}/frontend/Interfaces)

# -------------------------------------------------------------------------------
# Hardware detection
# -------------------------------------------------------------------------------

# include(${BONING_SOURCE_DIR}/cmake/check_simd.cmake)
# include(${BONING_SOURCE_DIR}/cmake/check_toolchain.cmake) check_simd()
# check_toolchain()

# -------------------------------------------------------------------------------
# Directory setup
# -------------------------------------------------------------------------------

# add_subdirectory(frontend)
add_subdirectory(midend)
# add_subdirectory(backend)
add_subdirectory(tools)
# add_subdirectory(examples) add_subdirectory(tests)
