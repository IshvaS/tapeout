# Simple 4-Bit CPU (Verilog)

## Overview

This project implements a basic 4-bit CPU in Verilog that combines a program counter, instruction ROM, and a datapath with a register and ALU. The CPU executes hardcoded 4-bit instructions stored in ROM and supports basic logic and arithmetic operations using a register-based datapath.

---

## Module Description

### File: `cpu.v`

| Port        | Width | Description                              |
| ----------- | ----- | ---------------------------------------- |
| clk         | 1-bit | Clock signal                             |
| rstn        | 1-bit | Active-low reset for the program counter |
| mux_in_data | [3:0] | External data input to the datapath      |
| alu_in_data | [3:0] | Second operand to the ALU                |
| carry_out   | 1-bit | Carry-out from the ALU ADD operation     |
| rom_out     | [3:0] | Current instruction fetched from ROM     |
| reg_out     | [3:0] | Current value stored in the register     |
| alu_out     | [3:0] | Result of the ALU operation              |
| pc_out      | [2:0] | Current program counter value            |

---

## Internal Modules

- **Program Counter (`program_counter`)**  
  3-bit counter that increments each clock cycle unless reset.

- **Instruction ROM (`rom`)**  
  Outputs a 4-bit instruction based on the PC address.

- **Datapath (`datapath`)**  
  Contains a 4-bit register, 4-bit ALU, and 2-to-1 MUX. The register can load either external data or ALU output based on control signals.

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

This project combines control logic and datapath design to simulate instruction-driven execution. It forms the foundation of a minimal processor and demonstrates instruction decoding, modular design, and sequential control.

This top-level `cpu.v` module orchestrates all major components and serves as the entry point for simulation and testing.
