//===- BoningOps.td - Boning dialect ops -----------*- tablegen -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef BONING_OPS
#define BONING_OPS

include "BoningTypes.td"
include "mlir/Interfaces/InferTypeOpInterface.td"
include "mlir/Interfaces/SideEffectInterfaces.td" 

// def Boning_TanhOp : Boning_Op<"tanh", [
//     AllowsTypeRefinement,
//     HasValueSemantics,
//     ReadOnly
//   ]> {
//   let summary = "Generated op for `aten::tanh : (Tensor) -> (Tensor)`";
//   let arguments = (ins
//     AnyTorchTensorType:$self
//   );
//   let results = (outs
//     AnyTorchTensorType:$result
//   );
//   let hasCustomAssemblyFormat = 1;
//   let extraClassDefinition = [{
//     ParseResult AtenTanhOp::parse(OpAsmParser &parser, OperationState &result) {
//       return parseDefaultTorchOp(parser, result, 1, 1);
//     }
//     void AtenTanhOp::print(OpAsmPrinter &printer) {
//       printDefaultTorchOp(printer, *this, 1, 1);
//     }
//   }];
// }


def Boning_FooOp : Boning_Op<"foo", [Pure,
                                     SameOperandsAndResultType]> {
    let summary = "Illustrates how to define an operation.";
    let description = [{
        The `boning.foo` operation illustrates how to define a new
        operation in a dialect. It uses an operation trait to declare that it
        has no side effects.

        This operation takes an integer argument and returns an integer.

        Example:

        ```mlir
        %0 = arith.constant 2 : i32
        // Apply the foo operation to %0
        %1 = boning.foo %0 : i32
        ```
    }];

    let arguments = (ins I32:$input);
    let results = (outs I32:$res);

    let assemblyFormat = [{
        $input attr-dict `:` type($input)
    }];
}

def Boning_BarOp : Boning_Op<"bar", [Pure,
                                     SameOperandsAndResultType]> {
    let summary = "Illustrates how to define an operation.";
    let description = [{
        The `boning.bar` operation illustrates how to define a new
        operation in a dialect. It uses an operation trait to declare that it
        has no side effects.

        This operation takes an integer argument and returns an integer.

        Example:

        ```mlir
        %0 = arith.constant 2 : i32
        // Apply the bar operation to %0
        %1 = boning.bar %0 : i32
        ```
    }];

    let arguments = (ins I32:$input);
    let results = (outs I32:$res);

    let assemblyFormat = [{
        $input attr-dict `:` type($input)
    }];
}

def Boning_Bar2Op : Boning_Op<"bar2", [Pure,
                                     SameOperandsAndResultType]> {
    let summary = "Illustrates how to define an operation.";
    let description = [{
        The `boning.bar` operation illustrates how to define a new
        operation in a dialect. It uses an operation trait to declare that it
        has no side effects.

        This operation takes an integer argument and returns an integer.

        Example:

        ```mlir
        %0 = arith.constant 2 : i32
        // Apply the bar operation to %0
        %1 = boning.bar %0 : i32
        ```
    }];

    let arguments = (ins Boning_TupleType:$input);
    let results = (outs Boning_TupleType:$res);

    let assemblyFormat = [{
        $input attr-dict `:` type($input)
    }];
}

def Boning_ConstantOp : Boning_Op<"constant", [Pure]> {
    let summary = "Illustrates how to define an operation.";
    let description = [{
        The `boning.bar` operation illustrates how to define a new
        operation in a dialect. It uses an operation trait to declare that it
        has no side effects.

        This operation takes an integer argument and returns an integer.

        Example:

        ```mlir
        %0 = arith.constant 2 : i32
        // Apply the bar operation to %0
        %1 = boning.bar %0 : i32
        ```
    }];

    let arguments = (ins I32:$input);
    let results = (outs Boning_TupleType:$res);

    let assemblyFormat = [{
        $input attr-dict `:` type($res)
    }];
}

#endif // BONING_OPS
