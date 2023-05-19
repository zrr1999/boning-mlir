import ast
import dis
import sys
import inspect
import torch
import torch.fx
import torch._dynamo
from torch.fx import symbolic_trace
from torchvision.models import resnet18

tracer = torch.fx.Tracer()

# 使用PyTorch model zoo中的resnet18作为例子
# model = resnet18()
# model.eval()

# # 通过trace的方法生成IR需要一个输入样例
# dummy_input = torch.rand(1, 3, 224, 224)

# # IR生成
# with torch.no_grad():
#     jit_model = torch.jit.trace(model, dummy_input)
# fx_model = symbolic_trace(model)
# graph = tracer.trace(model)


# # print(jit_model)
# jit_layer1 = jit_model.layer1
# print(jit_layer1.graph)
# print(jit_layer1.code)
# print(fx_model.code)
# print(graph)
def fn(a, b):
    x = a + b
    x = x / 2.0
    y = x
    x = y
    # if x.sum() < 0:
    #     return x * -1.0
    return x


graph = tracer.trace(fn)
print(graph)
dis.dis(fn)

# dis.dis(torch.compile(fn))
