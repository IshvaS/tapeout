# 4-Bit Datapath (Verilog)

## Overview

This project implements a 4-bit datapath in Verilog that combines a multiplexer, register, and arithmetic logic unit (ALU). The datapath supports selective input loading and computation, enabling basic register-based data manipulation and ALU feedback loops.

---

## Module Description

### File: `datapath.v`

| Port         | Width | Description                                  |
| ------------ | ----- | -------------------------------------------- |
| clk          | 1-bit | Clock signal for register                    |
| load         | 1-bit | Enables loading new data into the register   |
| mux_sel_data | 1-bit | Selects input to register: 0 = data, 1 = ALU |
| mux_in_data  | [3:0] | External data input to the datapath          |
| alu_in_data  | [3:0] | Second operand to the ALU                    |
| alu_sel_data | [1:0] | ALU operation selector                       |
| carry_out    | 1-bit | Carry-out from the ALU ADD operation         |
| reg_out      | [3:0] | Current value stored in the register         |
| alu_out      | [3:0] | Result of the ALU operation                  |

---

## Internal Modules

- **MUX**: Selects between `mux_in_data` and ALU output for input to the register.
- **Register**: Stores a 4-bit value on the rising edge of `clk` if `load` is high.
- **ALU**: Performs logical and arithmetic operations based on `alu_sel_data`.

---

## ALU Operations

| alu_sel_data | Operation |
| ------------ | --------- |
| 00           | AND       |
| 01           | OR        |
| 10           | XOR       |
| 11           | ADD       |

---

## Notes

This project demonstrates how multiple reusable modules can be connected to build a basic datapath with control and feedback. It lays the foundation for more complex designs such as instruction-driven execution, program counters, and full CPU architectures.
