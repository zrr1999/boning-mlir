get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)
set(LIBS
        ${dialect_libs}
        ${conversion_libs}
        MLIRArithDialect
        MLIROptLib
        MLIRBoning
)
add_llvm_executable(boning-opt boning-opt.cpp)

llvm_update_compile_flags(boning-opt)
target_link_libraries(boning-opt PRIVATE ${LIBS})
mlir_check_all_link_libraries(boning-opt)

install(TARGETS boning-opt DESTINATION /usr/local/bin)
