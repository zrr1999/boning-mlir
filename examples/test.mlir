llvm.mlir.global internal constant @str_global("String to print\0A")
llvm.func @printCString(!llvm.ptr<i8>)

func.func @foo(%0: !boning.tensor<10, 10>) -> !boning.tensor<10, 10>{
  // %1 = boning.bar2 %0 : !boning.tuple<i8>
  return %0 : !boning.tensor<10, 10>
}

func.func @bar() -> i32{
  %0 = arith.constant 2 : i32
  // Apply the foo operation to %0
  %1 = boning.foo %0 : i32
  return %1 : i32
}

func.func @main() {
  %4 = func.call @bar() : () -> i32
  %11 = boning.foo %4 : i32
  %21 = boning.bar %4 : i32

  %0 = llvm.mlir.addressof @str_global : !llvm.ptr<array<16 x i8>>
  %1 = llvm.mlir.constant(0 : index) : i64
  %2 = llvm.getelementptr %0[%1, %1]
    : (!llvm.ptr<array<16 x i8>>, i64, i64) -> !llvm.ptr<i8>
  llvm.call @printCString(%2) : (!llvm.ptr<i8>) -> ()
  return
}
