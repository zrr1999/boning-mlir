add_mlir_dialect_library(MLIRBoning
        BoningDialect.cpp
        BoningTypes.cpp
        BoningOps.cpp
        BoningPasses.cpp

        ADDITIONAL_HEADER_DIRS
        ${PROJECT_SOURCE_DIR}/boning

        DEPENDS
        MLIRBoningOpsIncGen
        MLIRBoningPassesIncGen

        LINK_LIBS PUBLIC
        MLIRIR
        MLIRInferTypeOpInterface
        MLIRFuncDialect
        )
