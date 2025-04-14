# 4-Bit Register (Verilog)

## Overview

This project implements a 4-bit register in Verilog.

The register stores a 4-bit input value on the rising edge of the clock when the `load` signal is high. Otherwise, the stored value remains unchanged.

This project demonstrates basic sequential logic design using Verilog.

---

## Module Description

### File: `register.v`

| Port | Width | Description                           |
| ---- | ----- | ------------------------------------- |
| d    | [3:0] | Data input to be stored               |
| clk  | 1-bit | Clock input (positive edge triggered) |
| load | 1-bit | Load enable signal                    |
| q    | [3:0] | Stored output value                   |

---

## Behavior

| On `posedge clk` | load | Behavior     |
| ---------------- | ---- | ------------ |
| Rising Edge      | 1    | q <= d       |
| Rising Edge      | 0    | Hold q value |

---

## Testbench

### File: `testbench.v`

The testbench applies a sequence of inputs to the register, testing both loading new values and holding the previous value.

---

## Notes

This project demonstrates the first sequential logic design in Verilog after working with combinational logic. It introduces clock-driven behavior and conditional data storage using non-blocking assignments.
