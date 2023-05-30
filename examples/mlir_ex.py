import mlir.builder

builder = mlir.builder.IRBuilder()
mlirfile = builder.make_mlir_file()
module = mlirfile.default_module

with builder.goto_block(builder.make_block(module.region)):
    hello = builder.function("hello_world")
    block = builder.make_block(hello.region)
    builder.position_at_entry(block)

    x, y = builder.add_function_args(hello, [builder.F64, builder.F64], ['a', 'b'])

    adder = builder.addf(x, y, builder.F64)
    builder.ret([adder], [builder.F64])

print(mlirfile.dump())
