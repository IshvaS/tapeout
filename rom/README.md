# 4-Bit ROM Module (Verilog)

## Overview ##  
This project implements a small 4-bit ROM (Read-Only Memory) in Verilog.

The ROM outputs predefined 4-bit control signals based on a 3-bit address input.

---

## Module Description ##

### File: rom.v

Port      | Width | Description  
----------|--------|-----------------------------  
addr      | [2:0]  | 3-bit address input to select ROM content  
out       | [3:0]  | 4-bit data output representing control signals  

---

## Behavior ##

- The output `out` is determined combinationally based on the `addr` input.  
- Each address corresponds to a specific 4-bit control code used for CPU control signals.  
- Default output is `0000` representing a no-operation or reset state.

---

## ROM Content (Address vs Output) ##

Address | Output | Meaning (control signals)  
--------|---------|----------------------------  
000     | 0001    | AND operation, mux_sel=0, load=1  
001     | 0101    | OR operation, mux_sel=0, load=1  
010     | 1001    | XOR operation, mux_sel=0, load=1  
011     | 1101    | ADD operation, mux_sel=0, load=1  
100     | 1111    | ADD operation, mux_sel=1 (feedback), load=1  
101     | 1111    | ADD operation, mux_sel=1 (feedback), load=1  
110     | 1111    | ADD operation, mux_sel=1 (feedback), load=1  
Other   | 0000    | Default: no operation (NOP)  

---

## Usage ##

This ROM module can be used as a simple instruction or control lookup table in small CPU designs or FSMs.

---

## Notes ##

- Outputs control signals for ALU selection, multiplexer select, and register load enable.  
- Designed for combinational read access (no clock).  
- Extensible by modifying case statements for additional control signals.

---
