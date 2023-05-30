//===- BoningPasses.cpp - Boning passes -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
#include "Boning/BoningOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/PatternMatch.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"

#include "Boning/BoningPasses.h"
#include <mlir/Support/LogicalResult.h>

namespace mlir::boning {
#define GEN_PASS_DEF_BONINGSWITCHBARFOO
#define GEN_PASS_DEF_BONINGSWITCHBARFOOOP
#define GEN_PASS_DEF_BONINGSWITCHCALLBARFOO
#include "Boning/BoningPasses.h.inc"

namespace {
class BoningSwitchBarFooRewriter : public OpRewritePattern<func::FuncOp> {
public:
  using OpRewritePattern<func::FuncOp>::OpRewritePattern;
  LogicalResult matchAndRewrite(func::FuncOp op,
                                PatternRewriter &rewriter) const final {
    if (op.getSymName() == "bar") {
      rewriter.updateRootInPlace(op, [&op]() { op.setSymName("foo"); });
      return success();
    }
    return failure();
  }
};

class BoningSwitchBarFoo
    : public impl::BoningSwitchBarFooBase<BoningSwitchBarFoo> {
public:
  using impl::BoningSwitchBarFooBase<
      BoningSwitchBarFoo>::BoningSwitchBarFooBase;
  void runOnOperation() final {
    RewritePatternSet patterns(&getContext());
    patterns.add<BoningSwitchBarFooRewriter>(&getContext());
    FrozenRewritePatternSet patternSet(std::move(patterns));
    if (failed(applyPatternsAndFoldGreedily(getOperation(), patternSet)))
      signalPassFailure();
  }
};

class BoningSwitchCallBarFooRewriter : public OpRewritePattern<func::CallOp> {
public:
  using OpRewritePattern<func::CallOp>::OpRewritePattern;
  LogicalResult matchAndRewrite(func::CallOp op,
                                PatternRewriter &rewriter) const final {

    if (op.getCallee() != "foo") {
      rewriter.updateRootInPlace(op, [&op]() { op.setCallee("foo"); });
      return success();
    }
    return failure();
  }
};

class BoningSwitchCallBarFoo
    : public impl::BoningSwitchCallBarFooBase<BoningSwitchCallBarFoo> {
public:
  using impl::BoningSwitchCallBarFooBase<
      BoningSwitchCallBarFoo>::BoningSwitchCallBarFooBase;
  void runOnOperation() final {
    RewritePatternSet patterns(&getContext());
    patterns.add<BoningSwitchCallBarFooRewriter>(&getContext());
    FrozenRewritePatternSet patternSet(std::move(patterns));
    if (failed(applyPatternsAndFoldGreedily(getOperation(), patternSet)))
      signalPassFailure();
  }
};

class BoningSwitchBarFooOpRewriter : public OpRewritePattern<boning::FooOp> {
public:
  using OpRewritePattern<boning::FooOp>::OpRewritePattern;
  LogicalResult matchAndRewrite(boning::FooOp op,
                                PatternRewriter &rewriter) const final {
    auto loc = op->getLoc();
    boning::BarOp new_op =
        rewriter.create<typename boning::BarOp>(loc, op.getInput());
    rewriter.replaceAllUsesWith(op, new_op);
    return success();
  }
};

class BoningSwitchBarFooOp
    : public impl::BoningSwitchBarFooOpBase<BoningSwitchBarFooOp> {
public:
  using impl::BoningSwitchBarFooOpBase<
      BoningSwitchBarFooOp>::BoningSwitchBarFooOpBase;
  void runOnOperation() final {
    RewritePatternSet patterns(&getContext());
    patterns.add<BoningSwitchBarFooOpRewriter>(&getContext());
    FrozenRewritePatternSet patternSet(std::move(patterns));
    if (failed(applyPatternsAndFoldGreedily(getOperation(), patternSet)))
      signalPassFailure();
  }
};
} // namespace
} // namespace mlir::boning
