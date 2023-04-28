//===- BoningDialect.td - Boning dialect -----------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef BONING_DIALECT
#define BONING_DIALECT

include "mlir/IR/OpBase.td"

//===----------------------------------------------------------------------===//
// Boning dialect definition.
//===----------------------------------------------------------------------===//

def Boning_Dialect : Dialect {
    let name = "boning";
    let summary = "A boning out-of-tree MLIR dialect.";
    let description = [{
        This dialect is an example of an out-of-tree MLIR dialect designed to
        illustrate the basic setup required to develop MLIR-based tools without
        working inside of the LLVM source tree.
    }];
    let cppNamespace = "::mlir::boning";

    let useDefaultTypePrinterParser = 1;
    let extraClassDeclaration = [{
        void registerTypes();
    }];
}

//===----------------------------------------------------------------------===//
// Base boning operation definition.
//===----------------------------------------------------------------------===//

class Boning_Op<string mnemonic, list<Trait> traits = []> :
        Op<Boning_Dialect, mnemonic, traits>;

#endif // BONING_DIALECT
