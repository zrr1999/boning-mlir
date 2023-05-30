//===- BoningTypes.h - Boning dialect types -------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef BONING_BONINGTYPES_H
#define BONING_BONINGTYPES_H

#include "mlir/IR/BuiltinTypes.h"

#define GET_TYPEDEF_CLASSES
#include "Boning/BoningOpsTypes.h.inc"

#endif // BONING_BONINGTYPES_H
