set(CMAKE_BUILD_WITH_INSTALL_NAME_DIR ON)

set(CMAKE_CXX_STANDARD
    17
    CACHE STRING "C++ standard to conform to")
set(CMAKE_CXX_STANDARD_REQUIRED YES)
set(PYTHON_SOURCE_DIR ${PROJECT_SOURCE_DIR}/python)

if(APPLE)
  if("${CMAKE_HOST_SYSTEM_PROCESSOR}" STREQUAL "arm64")
    set(CMAKE_OSX_ARCHITECTURES ${CMAKE_HOST_SYSTEM_PROCESSOR})
  endif()
endif()

message("C Flags: ${CMAKE_C_FLAGS}")
message("C++ Flags: ${CMAKE_CXX_FLAGS}")
message("Build type: ${CMAKE_BUILD_TYPE}")
message("CMAKE_OSX_ARCHITECTURES: ${CMAKE_OSX_ARCHITECTURES}")
message("LLVM_BUILD_LIBRARY_DIR: ${LLVM_BUILD_LIBRARY_DIR}")

if(CLANG_EXECUTABLE)
  message("Clang executable ${CLANG_EXECUTABLE}")
elseif("${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang")
  set(CLANG_EXECUTABLE ${CMAKE_CXX_COMPILER})
  message("Clang executable using host compiler ${CLANG_EXECUTABLE}")
else()
  find_program(CLANG_EXECUTABLE NAMES clang clang-10 clang-11 clang-9 clang-8
                                      clang-7)
  message("Clang executable found at ${CLANG_EXECUTABLE}")
endif()
if(NOT CLANG_EXECUTABLE)
  message(FATAL_ERROR "Cannot find any clang executable.")
endif()

set(BONING_SOURCE_DIR ${PROJECT_SOURCE_DIR})
set(BONING_BUILD_DIR ${CMAKE_CURRENT_BINARY_DIR})
set(BONING_BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/bin)
set(BONING_EXAMPLES_DIR ${BONING_SOURCE_DIR}/examples)
set(BONING_MIDEND_INCLUDE_DIR ${BONING_SOURCE_DIR}/midend/include/)
set(BONING_THIRDPARTY_INCLUDE_DIR ${BONING_SOURCE_DIR}/3rdparty/include/)

include_directories(${BONING_SOURCE_DIR})
include_directories(${BONING_BUILD_DIR})
