# Simple 4-Bit CPU (Verilog)

## Overview  
This project implements a basic 4-bit CPU in Verilog that combines a program counter, instruction ROM, and a datapath with a register and ALU. The CPU executes hardcoded 4-bit instructions stored in ROM and supports basic logic and arithmetic operations using a register-based datapath.

---

## Module Description

| Port        | Width | Description                              |
| ----------- | ----- | ---------------------------------------- |
| clk         | 1-bit | Clock signal                             |
| rstn        | 1-bit | Active-low reset for the program counter |
| mux_in_data | 4-bit | External data input to the datapath      |
| alu_in_data | 4-bit | Second operand to the ALU                |
| carry_out   | 1-bit | Carry-out from the ALU ADD operation     |
| zero_flag   | 1-bit | High when ALU output is zero             |
| overflow_flag | 1-bit | Overflow flag from signed ALU addition |
| rom_out     | 4-bit | Current instruction fetched from ROM     |
| reg_out     | 4-bit | Current value stored in the register     |
| alu_out     | 4-bit | Result of the ALU operation              |
| pc_out      | 3-bit | Current program counter value            |

---

## Internal Modules

- **Program Counter (`program_counter`)**  
  3-bit counter that increments each clock cycle unless reset.

- **Instruction ROM (`rom`)**  
  Outputs a 4-bit instruction based on the PC address.

- **Datapath components:**  
  - **MUX:** Selects between external input and ALU output  
  - **Register:** Stores 4-bit data on load  
  - **ALU:** Performs AND, OR, XOR, and ADD operations with carry, zero, and overflow flags

---

## Instruction Format

Each instruction from ROM is 4 bits:

| Bits  | Field       | Description                           |
| ----- | ----------- | ------------------------------------- |
| [3:2] | ALU select  | 00 = AND, 01 = OR, 10 = XOR, 11 = ADD |
| [1]   | MUX select  | 0 = External input, 1 = ALU feedback  |
| [0]   | Load enable | 1 = Load register, 0 = Hold           |

---

## Notes  
This top-level CPU module orchestrates the program counter, ROM, and datapath modules to simulate a minimal instruction-driven processor. It demonstrates fundamental CPU concepts such as instruction fetching, decoding, execution, and sequential control flow.


# 4-Bit CPU Top-Level Wrapper (Verilog)

## Overview

This module `tt_um_4bit_cpu` is a top-level wrapper around a simple 4-bit CPU core.  
It connects the CPU core to external 8-bit input/output buses and provides CPU status flags on output bits.

---

## Module Description

### File: `tt_um_4bit_cpu.v`

| Port    | Width  | Description                                           |
|---------|--------|-------------------------------------------------------|
| ui_in   | [7:0]  | 8-bit input bus:                                      |
|         |        | &nbsp;&nbsp;&nbsp;&nbsp;lower 4 bits connect to `mux_in_data`  |
|         |        | &nbsp;&nbsp;&nbsp;&nbsp;upper 4 bits connect to `alu_in_data`  |
| uo_out  | [7:0]  | 8-bit output bus:                                    |
|         |        | &nbsp;&nbsp;&nbsp;&nbsp;bit 7 = `carry_out`          |
|         |        | &nbsp;&nbsp;&nbsp;&nbsp;bit 6 = `zero_flag`          |
|         |        | &nbsp;&nbsp;&nbsp;&nbsp;bit 5 = `overflow_flag`      |
|         |        | &nbsp;&nbsp;&nbsp;&nbsp;bit 4 = unused (0)            |
|         |        | &nbsp;&nbsp;&nbsp;&nbsp;bits [3:0] = ALU output      |
| uio_in  | [7:0]  | Unused input bus (tied to zero)                      |
| uio_out | [7:0]  | Unused output bus (driven low)                        |
| uio_oe  | [7:0]  | Output enable (driven low)                            |
| clk     | 1-bit  | Clock signal                                         |
| rst_n   | 1-bit  | Active-low reset signal                              |


---

## Internal Connections

- `ui_in[3:0]` connected to CPU input `mux_in_data`
- `ui_in[7:4]` connected to CPU input `alu_in_data`
- CPU outputs `carry_out`, `zero_flag`, `overflow_flag`, and `alu_out` mapped to bits in `uo_out`
- `uio_in` tied to 0
- `uio_out`, `uio_oe` driven low

---

## Notes

- This wrapper interfaces the internal 4-bit CPU to 8-bit external buses.
- Status flags `overflow`, `zero`, and `carry_out` are exposed as individual bits on `uo_out`.
- The ALU output is provided on the lower 4 bits of `uo_out`.
- Unused I/O ports are tied off to prevent floating signals.
