# Boning-mlir

## 使用方法
### docker
```sh
docker run --name Boning-mlir -itd --restart unless-stopped -p 10001:22 -v ~/workspace/:/workspace/ zrr1999/boning-mlir:latest
ssh -p 10001 zrr1999@localhost
```
### 构建项目
```sh
cd /workspace/boning-mlir
mkdir build && cd build
cmake -G Ninja ..
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DCMAKE_BUILD_TYPE=RELEASE
ninja install
```

## 技术方案
### 报告
计划采用 Typst，Typst 是使用 Rust 编写的新兴文档排版语言，可以很好的使用git管理源代码，
从而可以提供良好的多人协作体验，同时在格式调整上较为方便，协作者 review 也比较方便。
相比于普通的 Word 和在线多人 Word，Typst 的管理方案更加安全自由，不需要受限于平台，且有更好的多人协作体验。
相比于 LaTeX，Typst 学习门槛更低，没有历史遗留问题，虽然在功能上有所欠缺，但是发展迅速，且对于普通文档并不构成太大问题。

## 协作方案
### 版本管理方案
项目使用 git 进行管理，托管到 GitHub/Gitee，
以 PR 方式贡献代码到主仓库。

## 贡献度计算方案
最终的奖金分配和证书排序上会综合考虑实际贡献量和竞赛分数贡献量。
实际贡献量包括一切对竞赛排名相关的贡献，包括代码贡献，
提出关键性建议，或者参与答辩等，具体分配方案待讨论。

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
