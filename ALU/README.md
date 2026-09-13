4-bit ALU with multiple operations and a testbench.

Module

- `alu_4bit`: performs arithmetic and logic operations selected by a 3-bit select input.

Ports

- `input [3:0] a, b`: 4-bit operands
- `input [2:0] select`: operation selector
- `output [3:0] y`: 4-bit result
- `output cout`: carry-out (for add/sub operations)

Operations (select)

- 000: a + b
- 001: a - b
- 010: a & b
- 011: a | b
- 100: a ^ b
- 101: ~a
- 110: a + 1
- 111: a - 1

Simulation

Using Icarus Verilog:

1. iverilog -o alu.vvp ALU/ALU.v ALU/ALU_tb.v
2. vvp alu.vvp
3. gtkwave ALU/alu_4bit.vcd
