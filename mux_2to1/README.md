# 2-to-1 MUX (Verilog)

## Overview

This project implements a 2-to-1 multiplexer (MUX) in Verilog.

A MUX selects between two inputs based on a select signal.

---

## Module Description

### File: `mux.v`

| Port | Width | Description  |
| ---- | ----- | ------------ |
| a    | 1-bit | First input  |
| b    | 1-bit | Second input |
| sel  | 1-bit | Select line  |
| out  | 1-bit | Output       |

---

## Behavior

| sel | out |
| --- | --- |
| 0   | a   |
| 1   | b   |

---

## Testbench

The testbench applies test vectors and verifies the MUX output for all select conditions.

Simulate using:

```bash
iverilog -o mux_tb testbench.v mux.v
vvp mux_tb
```
