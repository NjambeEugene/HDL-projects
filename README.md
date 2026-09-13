# HDL-projects

A collection of HDL (Verilog) projects exploring basic digital logic, finite-state machines, registers, counters, and small system experiments. Each folder contains one or more Verilog modules and accompanying testbenches or simulation artifacts to help you study and simulate the designs.

## Projects

- **ADDER** — Full-adder implementation and testbench (single-bit adder with carry-in/out).
- **ALU** — 4-bit ALU supporting arithmetic and logic operations with a testbench.
- **BCD_DECODER** — BCD (4-bit) to 7-segment decoder and testbench.
- **BUFFER** — Buffer / tri-state examples and testbenches.
- **CLUB** — Basic gate examples (AND gate) with a testbench.
- **COUNTERS** — A collection of counter designs (asynchronous, synchronous, ring, Johnson, up/down) with testbenches.
- **DECODER** — Decoder and multiplexer examples with testbenches.
- **ENCODER** — Encoder example and testbench.
- **FLIP_FLOP** — Flip-flop and latch examples (SR, JK, etc.) with testbenches.
- **HALF_ADDER** — Half-adder example and testbench.
- **MUX** — Multiplexer examples and related testbenches.
- **PARITY_GENERATION** — Parity generator/checker and testbench.
- **REGISTER** — FIFO, shift-registers (PISO/PIPO), and related register designs with testbenches.
- **RIPPLE_ADDER** — Ripple-carry adder built from full adders and testbench.
- **SEQUENCE_DETECTOR** — Moore and Mealy FSM sequence detector examples with testbenches.
- **SUBTRACTOR** — Subtractor implementation and testbench.
- **UART** — Vivado UART project and simulation artifacts (contains generated project files; see folder for usage).

## Notes

- Most projects include simple testbenches and `.vcd` waveform files. Use a Verilog simulator and GTKWave to compile, run, and inspect waveforms unless otherwise noted (UART contains Vivado-generated project files).
- The `GATES` entry at the repository root is a git submodule and is not modified by these READMEs.
- Many folders contain generated simulation artifacts (e.g., `.vcd`, `.out`, Vivado cache). Consider cleaning or adding entries to `.gitignore` if you prefer not to track these files.

## License

This repository does not include a license file. If you want to reuse code from here, please contact the repository owner or add a LICENSE file to clarify reuse terms.
