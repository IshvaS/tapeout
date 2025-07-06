# 3-Bit Program Counter (Verilog)

## Overview ##  
This project implements a 3-bit Program Counter in Verilog.

The counter increments its output by 1 on each rising clock edge and supports an asynchronous active-low reset to clear the counter.

---

## Module Description ##

### File: program_counter.v

Port      | Width | Description  
----------|--------|--------------------------  
clk       | 1-bit  | Clock input  
rstn      | 1-bit  | Asynchronous active-low reset input  
out       | [2:0]  | 3-bit output counter value  

---

## Behavior ##

- When `rstn` is low, the counter output is reset to `000`.  
- On every rising edge of `clk`, if `rstn` is high, the counter increments by 1.  
- The counter rolls over from `111` back to `000`.  

---

## Usage ##

This module is suitable as a simple program counter for small CPU designs or any application requiring a 3-bit counting mechanism.

---

## Notes ##

- Reset is asynchronous and active-low.  
- Counter increments on the positive clock edge.  
- Output width is 3 bits, counts from 0 to 7 cyclically.  

---
