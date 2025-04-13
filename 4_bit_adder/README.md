# 4-Bit Adder (Verilog)

## Overview

This project implements a 4-bit adder in Verilog.

The adder takes two 4-bit inputs and produces a 4-bit sum and a carry-out bit. This module demonstrates basic combinational logic design using Verilog.

---

## Module Description

### File: `adder.v`

| Port      | Width | Description                        |
| --------- | ----- | ---------------------------------- |
| a         | [3:0] | First input operand                |
| b         | [3:0] | Second input operand               |
| sum       | [3:0] | 4-bit output sum                   |
| carry_out | 1-bit | Carry-out (overflow) from addition |

---

## Testbench

### File: `testbench.v`

The testbench applies test vectors to the adder module and prints the outputs.

Example test cases:

| a   | b   | sum | carry_out |
| --- | --- | --- | --------- |
| 5   | 3   | 8   | 0         |
| 7   | 9   | 0   | 1         |
| 15  | 1   | 0   | 1         |

---

## Notes

This project was the first Verilog module implemented after transitioning from circuit simulation to HDL design. The project focuses on basic Verilog syntax, module instantiation, and testbench-driven simulation.
