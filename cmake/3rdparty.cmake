option(LLVM_INCLUDE_TOOLS "Generate build targets for the LLVM tools." ON)
option(LLVM_BUILD_TOOLS
       "Build the LLVM tools. If OFF, just generate build targets." ON)
option(BONING_MLIR_OUT_OF_TREE_BUILD "Specifies an out of tree build" OFF)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR
   OR BONING_MLIR_OUT_OF_TREE_BUILD)
  message(STATUS "boning-mlir two-step build.")
  # Two-step build
  # -------------------------------------------------------------------------------
  # MLIR/LLVM Configuration
  # -------------------------------------------------------------------------------
  find_package(MLIR REQUIRED CONFIG)
  message(STATUS "Using MLIRConfig.cmake in: ${MLIR_DIR}")
  message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

  set(LLVM_MLIR_BINARY_DIR ${MLIR_DIR}/../../../bin)
  set(LLVM_MLIR_SOURCE_DIR ${MLIR_DIR}/../../../../mlir)
  set(LLVM_PROJECT_SOURCE_DIR ${MLIR_DIR}/../../../../)

  list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
  list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

  find_program(LLVM_TABLEGEN_EXE "llvm-tblgen" ${LLVM_TOOLS_BINARY_DIR}
               NO_DEFAULT_PATH)

  include(TableGen)
  include(AddLLVM)
  include(AddMLIR)
  include(HandleLLVMOptions)
else()
  message(STATUS "boning-mlir one-step build.")
  # one-step build with LLVM_EXTERNAL_PROJECTS=boning-mlir
  # -------------------------------------------------------------------------------
  # MLIR/LLVM Configuration
  # -------------------------------------------------------------------------------

  set(MLIR_MAIN_SRC_DIR ${LLVM_MAIN_SRC_DIR}/../mlir)
  set(MLIR_INCLUDE_DIR ${LLVM_MAIN_SRC_DIR}/../mlir/include)
  set(MLIR_GENERATED_INCLUDE_DIR ${LLVM_BINARY_DIR}/tools/mlir/include)
  set(LLVM_MLIR_BINARY_DIR ${CMAKE_BINARY_DIR}/bin)
  set(MLIR_INCLUDE_DIRS "${MLIR_INCLUDE_DIR};${MLIR_GENERATED_INCLUDE_DIR}")
  set(LLVM_PROJECT_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/llvm")
  set(LLVM_MLIR_SOURCE_DIR "${LLVM_MAIN_SRC_DIR}/../mlir")
endif()

# Add MLIR and LLVM headers to the include path
include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${MLIR_INCLUDE_DIRS})

# Configure CMake.
list(APPEND CMAKE_MODULE_PATH ${MLIR_MAIN_SRC_DIR}/cmake/modules)
list(APPEND CMAKE_MODULE_PATH ${LLVM_MAIN_SRC_DIR}/cmake)

find_program(LLVM_TABLEGEN_EXE "llvm-tblgen" ${LLVM_TOOLS_BINARY_DIR}
             NO_DEFAULT_PATH)

include(TableGen)
include(AddLLVM)
include(AddMLIR)
include(HandleLLVMOptions)
