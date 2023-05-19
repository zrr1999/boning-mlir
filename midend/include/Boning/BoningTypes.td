#ifndef BONING_TYPES
#define BONING_TYPES

include "BoningDialect.td"
include "mlir/IR/AttrTypeBase.td"

//===----------------------------------------------------------------------===//
// Boning type definitions
//===----------------------------------------------------------------------===//

class Boning_Type<string name, string typeMnemonic, list<Trait> traits = []>
    : TypeDef<Boning_Dialect, name, traits> {
  let mnemonic = typeMnemonic;
}

def Boning_TupleType : Boning_Type<"Tuple", "tuple"> {
  let summary = "!torch.tuple<T1, T2, T3>";
  let description = [{
    Tuple type with 0-N ordered contained types.
  }];
  let parameters = (ins
    ArrayRefParameter<"::mlir::Type", "contained types">:$containedTypes
  );
  let assemblyFormat = "`<` $containedTypes `>`";
}

// def Boning_TensorType : Boning_Type<"Tensor", "tensor"> {
//   let summary = "!torch.tensor<T1>";
//   let description = [{
//     Tuple type with 0-N ordered contained types.
//   }];
//   let parameters = (ins
//     ArrayRefParameter<"::mlir::Type", "contained types">:$containedTypes
//   );
//   let assemblyFormat = "`<` $containedTypes `>`";
// }

def Boning_TensorType : Boning_Type<"Tensor", "tensor"> {
  let summary = "!torch.tensor<element_type, shape>";
  let description = [{
    Tensor type with element type and shape.
  }];
  let parameters = (ins
    // TypeParameter<>:$element_type,
    ArrayRefParameter<"unsigned", "shape">:$shape
  );
  let assemblyFormat = "`<` $shape `>`";
  // let assemblyFormat = "`<` $element_type `,` $shape `>`";

}

#endif // BONING_TYPES
