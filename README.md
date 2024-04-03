# Boning-mlir

## 使用方法
### docker
```sh
docker run --name Boning-mlir -itd --restart unless-stopped -p 10001:22 -v ~/workspace/:/workspace/ zrr1999/boning-mlir:latest
ssh -p 10001 zrr1999@localhost
```
### 构建项目

#### 1. Prerequisites: clang ninja

#### 2. Run "git submodule update --init" to get the llvm project

#### 3. Build:
3.1 Use shell script:

One-step Build：
```sh
./build.sh --step 1
```
Two-step Build：
```sh
./build.sh --step 2
```
3.2 Use CLI directly

One-step Build
```sh
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
ninja install (optional)
```
Two-step Build

Build LLVM and MLIR
```sh
cd boning-mlir/3rdparty/llvm
mkdir build && cd build
cmake -G Ninja ../llvm \
    -DLLVM_ENABLE_PROJECTS="mlir;" \
    -DLLVM_TARGETS_TO_BUILD="X86;ARM" \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_BUILD_TYPE=RELEASE
ninja check-mlir
```
Build boning-mlir
```sh
cd boning-mlir
mkdir build && cd build
cmake -G Ninja .. \
    -DMLIR_DIR=$PWD/../3rdparty/llvm/build/lib/cmake/mlir \
    -DLLVM_DIR=$PWD/../3rdparty/llvm/build/lib/cmake/llvm \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_BUILD_TYPE=RELEASE
ninja
ninja install (optional)
```

## TODO
- 利用 [IssueTools](https://github.com/zrr1999/IssueTools) 管理 issue 和 TODO
- 添加 Python 支持
- 实现 PyTorch 前端支持
- x86 CPU 后端方言（或利用 llvm ir）
- 添加单元测试机制及补充 CI 机制
- 量化、剪枝等机制的研究
- 内存分配优化算法
- 针对 Arm CPU（A53）和 GPU（Mali）的技术调研
- 方案报告
- 更多内容
