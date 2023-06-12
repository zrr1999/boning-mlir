#!/bin/bash
usage() {
  echo "Usage: $0 [-s|--step] [1|2]" 1>&2
  exit 1
}

step=""

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -s|--step)
      step="$2"
      shift
      shift
      ;;
    *)  # Unknown Parameter
      echo "Unknown Parameter: $1"
      usage
      exit 1
      ;;
  esac
done

if [[ $step == "1" ]]; then
  echo "Boning-mlir One-step Build"
elif [[ $step == "2" ]]; then
  echo "Boning-mlir Two-step Build"
else
  echo "The build step should be 1 or 2!"
  exit 1
fi

if [[ $step == "1" ]]; then
    # One-step Build
    ./clean_dir.sh
    cmake -G Ninja -Bbuild \
        -DLLVM_ENABLE_PROJECTS="mlir" \
        -DLLVM_TARGETS_TO_BUILD="X86;ARM" \
        -DLLVM_EXTERNAL_PROJECTS="boning-mlir" \
        -DLLVM_EXTERNAL_BONING_MLIR_SOURCE_DIR="$PWD" \
        -DLLVM_ENABLE_ASSERTIONS=ON \
        -DCMAKE_BUILD_TYPE=RELEASE \
        3rdparty/llvm/llvm
    cd build
    ninja check-mlir
    ninja
    # ninja install
elif [[ $step == "2" ]]; then
    # Two-step Build
    echo "Build LLVM and MLIR"

    ./clean_dir.sh
    cd 3rdparty/llvm
    mkdir build && cd build
    cmake -G Ninja ../llvm \
        -DLLVM_ENABLE_PROJECTS="mlir;" \
        -DLLVM_TARGETS_TO_BUILD="X86;ARM" \
        -DLLVM_ENABLE_ASSERTIONS=ON \
        -DCMAKE_BUILD_TYPE=RELEASE
    ninja check-mlir

    echo "Build Boning-mlir"

    cd ../../..
    mkdir build && cd build
    cmake -G Ninja .. \
        -DMLIR_DIR=$PWD/../3rdparty/llvm/build/lib/cmake/mlir \
        -DLLVM_DIR=$PWD/../3rdparty/llvm/build/lib/cmake/llvm \
        -DLLVM_ENABLE_ASSERTIONS=ON \
        -DCMAKE_BUILD_TYPE=RELEASE
    ninja
    # ninja install
fi
