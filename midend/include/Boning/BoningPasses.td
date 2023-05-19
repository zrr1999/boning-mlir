//===- BoningPsss.td - Boning dialect passes -------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef BONING_PASS
#define BONING_PASS

include "mlir/Pass/PassBase.td"

def BoningSwitchBarFoo: Pass<"boning-switch-bar-foo", "::mlir::ModuleOp"> {
  let summary = "Switches the name of a FuncOp named `bar` to `foo` and folds.";
  let description = [{
    Switches the name of a FuncOp named `bar` to `foo` and folds.
    ```
    func.func @bar() {
      return
    }
    // Gets transformed to:
    func.func @foo() {
      return
    }
    ```
  }];
}

def BoningSwitchCallBarFoo: Pass<"boning-switch-call-bar-foo", "::mlir::ModuleOp"> {
  let summary = "Switches the call of a FuncOp named `bar` to `foo` and folds.";
  let description = [{
    Switches the call of a FuncOp named `bar` to `foo` and folds.
    ```
    func.call @bar() : () -> i32
    // Gets transformed to:
    func.call @foo() : () -> i32
    ```
  }];
}

def BoningSwitchBarFooOp: Pass<"boning-switch-bar-foo-op", "::mlir::ModuleOp"> {
  let summary = "Switches the call of a FuncOp named `bar` to `foo` and folds.";
  let description = [{
    Switches the call of a FuncOp named `bar` to `foo` and folds.
    ```
    func.call @bar() : () -> i32
    // Gets transformed to:
    func.call @foo() : () -> i32
    ```
  }];
}

#endif // BONING_PASS
