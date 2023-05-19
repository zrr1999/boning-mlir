#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/Dialect.h"
#include "mlir/IR/MLIRContext.h"
#include "mlir/InitAllDialects.h"
#include "mlir/InitAllPasses.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Support/FileUtilities.h"
#include "mlir/Tools/mlir-opt/MlirOptMain.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/ToolOutputFile.h"

#include "Boning/BoningDialect.h"
#include "Boning/BoningPasses.h"

int main(int argc, char **argv) {
  mlir::DialectRegistry registry;
  registerAllDialects(registry);
  registry.insert<mlir::boning::BoningDialect>();

  mlir::registerAllPasses();
  mlir::boning::registerPasses();

  return mlir::asMainReturnCode(
      mlir::MlirOptMain(argc, argv, "Boning optimizer driver\n", registry));
  return 0;
}
