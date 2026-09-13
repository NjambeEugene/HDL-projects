# ADDER

A simple full-adder implementation and testbench.

## Module

- `full_adder`: computes sum and carry-out for single-bit addition with carry-in.

## Ports

- `input a`: single-bit operand
- `input b`: single-bit operand
- `input c_in`: carry-in
- `output sum`: single-bit sum
- `output carry_out`: carry-out

## Simulation

Using Icarus Verilog:

1. From repository root: `iverilog -o fullAdder.vvp ADDER/fullAdder.v ADDER/fullAdderTB.v`
2. Run: `vvp fullAdder.vvp`
3. View waveform (if `.vcd` is produced) in GTKWave: `gtkwave ADDER/fullAdder.vcd`
