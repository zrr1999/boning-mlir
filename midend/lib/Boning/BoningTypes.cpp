//===- BoningTypes.cpp - Boning dialect types -----------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "Boning/BoningTypes.h"

#include "Boning/BoningDialect.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/DialectImplementation.h"
#include "llvm/ADT/TypeSwitch.h"

using namespace mlir::boning;

#define GET_TYPEDEF_CLASSES
#include "Boning/BoningOpsTypes.cpp.inc"

void BoningDialect::registerTypes() {
  addTypes<
#define GET_TYPEDEF_LIST
#include "Boning/BoningOpsTypes.cpp.inc"
      >();
}
