module attributes {llvm.data_layout = ""} {
  llvm.mlir.global internal constant @str_global("String to print\0A") {addr_space = 0 : i32}
  // llvm.func @printCString(!llvm.ptr<i8>)
  llvm.func @main() {
    %0 = llvm.mlir.addressof @str_global : !llvm.ptr<array<16 x i8>>
    %1 = llvm.mlir.constant(0 : index) : i64
    %2 = llvm.getelementptr %0[0, 0] : (!llvm.ptr<array<16 x i8>>) -> !llvm.ptr<i8>
    // llvm.call @printCString(%2) : (!llvm.ptr<i8>) -> ()
    llvm.return
  }
}
