# 4-Bit ALU (Verilog)

## Overview

This project implements a 4-bit Arithmetic Logic Unit (ALU) in Verilog.

The ALU performs logic and arithmetic operations based on a 2-bit select signal. This module demonstrates multi-operation combinational logic design using Verilog.

---

## Module Description

### File: `alu.v`

| Port      | Width | Description                       |
| --------- | ----- | --------------------------------- |
| a         | [3:0] | First input operand               |
| b         | [3:0] | Second input operand              |
| sel       | [1:0] | Operation select                  |
| out       | [3:0] | Operation result                  |
| carry_out | 1-bit | Carry-out from ADD operation only |

---

## Operations

| sel | Operation | Description                   |
| --- | --------- | ----------------------------- |
| 00  | AND       | Bitwise AND                   |
| 01  | OR        | Bitwise OR                    |
| 10  | XOR       | Bitwise XOR                   |
| 11  | ADD       | 4-bit Addition with Carry Out |

---

## Testbench

### File: `testbench.v`

The testbench applies a sequence of test cases to verify all ALU operations.

Example test cases:

| a       | b       | sel | Expected out | Expected carry_out |
| ------- | ------- | --- | ------------ | ------------------ |
| 4'b1010 | 4'b1100 | 00  | 4'b1000      | 0                  |
| 4'b1010 | 4'b1100 | 01  | 4'b1110      | 0                  |
| 4'b1010 | 4'b1100 | 10  | 4'b0110      | 0                  |
| 4'b0111 | 4'b1001 | 11  | 4'b0000      | 1                  |

---

## Notes

This project demonstrates multi-operation combinational design in Verilog and shows how to implement basic ALU functionality for a CPU datapath.

It builds on previous Verilog skills and prepares for larger system-level designs.
