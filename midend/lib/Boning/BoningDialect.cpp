#include "Boning/BoningDialect.h"
#include "Boning/BoningOps.h"

using namespace mlir;
using namespace mlir::boning;

#include "Boning/BoningOpsDialect.cpp.inc"

//===----------------------------------------------------------------------===//
// Boning dialect.
//===----------------------------------------------------------------------===//

void BoningDialect::initialize() {
  addOperations<
#define GET_OP_LIST
#include "Boning/BoningOps.cpp.inc"
      >();
}
