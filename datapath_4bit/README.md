# 4-Bit Datapath (Verilog)

## Overview
This project implements a 4-bit datapath in Verilog that combines a multiplexer, register, and arithmetic logic unit (ALU). The datapath supports selective input loading and computation, enabling basic register-based data manipulation and ALU feedback loops.

---

## Module Description

| Port         | Width | Direction | Description                                         |
|--------------|-------|-----------|-----------------------------------------------------|
| clk          | 1-bit | input     | Clock signal for the register                        |
| load         | 1-bit | input     | Load enable signal for the register                  |
| mux_sel_data | 1-bit | input     | Select input for mux: 0 = external data, 1 = ALU out|
| mux_in_data  | 4-bit | input     | External data input                                  |
| alu_in_data  | 4-bit | input     | Second operand for ALU                               |
| alu_sel_data | 2-bit | input     | ALU operation selector                               |
| carry_out    | 1-bit | output    | Carry-out from ALU addition                          |
| reg_out      | 4-bit | output    | Current value stored in the register                 |
| alu_out      | 4-bit | output    | Result output from ALU                               |

---

## Internal Modules

- mux: 4-bit 2-to-1 multiplexer selecting between mux_in_data and alu_out
- register: 4-bit register that loads data on clk rising edge when load is high
- alu: 4-bit ALU performing AND, OR, XOR, and ADD operations based on alu_sel_data

---

## ALU Operations

alu_sel_data | Operation
-------------|-----------
00           | AND
01           | OR
10           | XOR
11           | ADD

---

## Notes
This datapath module demonstrates connecting multiple reusable modules to build a simple register-ALU system with input selection and feedback. It forms a basic building block for CPU datapaths and further system design.
