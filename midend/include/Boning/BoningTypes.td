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

def Boning_CustomType : Boning_Type<"Custom", "custom"> {
    let summary = "Boning custom type";
    let description = "Custom type in boning dialect";
    let parameters = (ins StringRefParameter<"the custom value">:$value);
    let assemblyFormat = "`<` $value `>`";
}

#endif // BONING_TYPES
