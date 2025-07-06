# 4-Bit ALU (Verilog)

## Overview ##  
This project implements a 4-bit Arithmetic Logic Unit (ALU) in Verilog.

The ALU performs logic and arithmetic operations based on a 2-bit select signal.  
This module demonstrates multi-operation combinational logic design using Verilog.

---

## Module Description ##

### File: alu.v

Port      | Width | Description  
----------|--------|-------------------------  
a         | [3:0]  | First input operand  
b         | [3:0]  | Second input operand  
sel       | [1:0]  | Operation select  
out       | [3:0]  | Operation result  
carry_out | 1-bit  | Carry-out from ADD operation only  
zero_flag | 1-bit  | High when output is zero  
overflow_flag | 1-bit | Overflow flag for signed addition  

---

## Operations ##

sel | Operation | Description  
----|-----------|------------------------------  
00  | AND       | Bitwise AND  
01  | OR        | Bitwise OR  
10  | XOR       | Bitwise XOR  
11  | ADD       | 4-bit Addition with Carry Out, Zero and Overflow flags  

---

## Example Test Cases ##

a      | b      | sel | Expected out | Expected carry_out | zero_flag | overflow_flag  
-------|--------|-----|--------------|--------------------|-----------|--------------  
1010   | 1100   | 00  | 1000         | 0                  | 0         | 0  
1010   | 1100   | 01  | 1110         | 0                  | 0         | 0  
1010   | 1100   | 10  | 0110         | 0                  | 0         | 0  
0111   | 0001   | 11  | 1000         | 0                  | 0         | 1  
1000   | 1000   | 11  | 0000         | 1                  | 1         | 1  
1111   | 0001   | 11  | 0000         | 1                  | 1         | 0  

---

## Notes ##  
- Overflow flag indicates signed addition overflow.  
- Zero flag is set when output is zero.  
- Carry out indicates unsigned addition carry.  
- Inputs are 4-bit values; for signed operations, inputs can be treated as 2’s complement.  
- This ALU can be used as a basic building block in CPU datapaths.
