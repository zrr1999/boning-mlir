//===- BoningPasses.h - Boning passes  ------------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
#ifndef STANDALONE_STANDALONEPASSES_H
#define STANDALONE_STANDALONEPASSES_H

#include "Boning/BoningDialect.h"
#include "Boning/BoningOps.h"
#include "mlir/Pass/Pass.h"
#include <memory>

namespace mlir {
namespace boning {
#define GEN_PASS_DECL
#include "Boning/BoningPasses.h.inc"

#define GEN_PASS_REGISTRATION
#include "Boning/BoningPasses.h.inc"
} // namespace boning
} // namespace mlir

#endif
