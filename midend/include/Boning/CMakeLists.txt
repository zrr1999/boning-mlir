add_mlir_dialect(BoningOps boning)
add_mlir_doc(BoningDialect BoningDialect boning/ -gen-dialect-doc)
add_mlir_doc(BoningOps BoningOps boning/ -gen-op-doc)

set(LLVM_TARGET_DEFINITIONS BoningPasses.td)
mlir_tablegen(BoningPasses.h.inc --gen-pass-decls)
add_public_tablegen_target(MLIRBoningPassesIncGen)
