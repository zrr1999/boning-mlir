from __future__ import annotations
import ast
import dis
import sys
import inspect
import types
import rich
from pydantic import BaseModel
from typing import (
    List,
    Dict,
    Any,
    Union,
    Optional,
    Callable,
    TypeVar,
    Generic,
    Type,
    Tuple,
)
from copy import deepcopy


class IRNode(BaseModel):
    name: str | None

class LowIRNode(IRNode):
    pass

class LoadNode(LowIRNode):
    pass

class StoreNode(LowIRNode):
    pass

class ReturnNode(LowIRNode):
    pass

class HighIRNode(IRNode):
    pass


class CallFunction(HighIRNode):
    fn: str
    args: list[IRNode]


class Placeholder(HighIRNode):
    pass


class Constant(HighIRNode):
    pass


class IRGraph(BaseModel):
    nodes: list[IRNode]

    def add_nodes(self, *nodes: IRNode):
        self.nodes.extend(nodes)

    def code_gen(self):
        source = ["def demo_fn({{args}}):"]
        for node in self.nodes:
            node.name
            

def fn(a, b):
    x = a + b
    x = x + a
    x = x / 2.0
    # if x.sum() < 0:
    #     return x * -1.0
    return x


def compile(
    code,
):
    pass


class InstructionTranslator:
    # def __init__(
    #     self,
    #     instructions,
    #     f_code,
    #     f_locals,
    #     f_globals,
    #     f_builtinst,
    #     code_options,
    #     compiler_fn,
    #     one_graph,
    #     export,
    # ):
    #     pass
    
    def LOAD_FAST(self, inst):
        if inst.argval not in name2node:
            var = Placeholder(name=inst.argval)
            name2node.update({inst.argval: var})
            stack.append(var)
            graph.add_nodes(var)
        else:
            stack.append(name2node[inst.argval])
    def LOAD_CONST(self, inst):
        if inst.argval not in name2node:
            var = Constant(name=None)
            name2node.update({inst.argval: var})
            stack.append(var)
            graph.add_nodes(var)
        else:
            stack.append(name2node[inst.argval])
    def BINARY_ADD(self, inst):
        rv, lv = stack.pop(), stack.pop()
        call_fn = CallFunction(name=None, fn="add", args=[lv, rv])
        stack.append(call_fn)
    def BINARY_TRUE_DIVIDE(self, inst):
        rv, lv = stack.pop(), stack.pop()
        call_fn = CallFunction(name=None, fn="divide", args=[lv, rv])
        stack.append(call_fn)
    def STORE_FAST(self, inst):
        value = stack.pop()
        name2node.update({inst.argval: value})
        # TODO: unique name
        # if inst.argval not in name2node:
        #     name2node.update({
        #         inst.argval: value
        #     })
        if value.name is None:
            value.name = inst.argval
            graph.add_nodes(value)
    def RETURN_VALUE(self, inst):
        value = stack.pop()
        name2node.update({inst.argval: value})
        # TODO: unique name
        # if inst.argval not in name2node:
        #     name2node.update({
        #         inst.argval: value
        #     })
        if value.name is None:
            value.name = inst.argval
            graph.add_nodes(value)
    

graph = IRGraph(nodes=[])


stack: list[IRNode] = []
name2node: dict[str, IRNode] = {}
translator = InstructionTranslator()
for inst in dis.get_instructions(fn):
    rich.print(inst)
    getattr(translator, inst.opname)(inst)

rich.print(graph)
