# Verilog Projects

This repository contains modular Verilog designs focused on constructing a complete 4-bit CPU from the ground up. Each project builds upon the last, demonstrating key digital design concepts such as combinational logic, sequential logic, and datapath control.

---
4-bit CPU - Verilog Project
===========================

This project implements a simple 4-bit CPU in Verilog. The CPU contains:
- A 4-bit ALU with AND, OR, XOR, and ADD operations.
- A 4-bit register to store data.
- A 3-bit program counter to fetch instructions.
- A ROM that stores a small set of 4-bit instructions.
- A datapath that connects the ALU, register, and control signals.
- A peripheral wrapper to interface with external inputs and outputs.

--------------------------------------------------
How to Run
--------------------------------------------------

1. Install tools (on Ubuntu/Debian):
   sudo apt install iverilog gtkwave make

2. Organize your files like this:
   cpu_controller/
     alu.v
     cpu.v
     datapath.v
     mux.v
     program_counter.v
     register.v
     rom.v
     peri.v
     peri_tb.v
     Makefile

3. Open a terminal and navigate to the folder containing your files.

4. To compile and run the simulation:
   make DIR=cpu_controller run

5. To view waveforms in GTKWave:
   make DIR=cpu_controller gtkwave

6. To clean generated files:
   make DIR=cpu_controller clean

--------------------------------------------------
Outputs
--------------------------------------------------
- Text output of ALU results, program counter, carry, zero, and overflow flags.
- Optional waveform (`wave.vcd`) to view signals in GTKWave.

--------------------------------------------------


## 🧱 Projects

### 🔹 ALU (4-bit)

Implements AND, OR, XOR, and ADD operations using a 2-bit opcode.

### 🔹 Register (4-bit)

Sequential storage element with load enable and rising-edge clock behavior.

### 🔹 Datapath (4-bit)

Connects the ALU and register via a 2-to-1 MUX to enable feedback and external input loading.

### 🔹 Program Counter

3-bit incrementing counter with active-low reset. Feeds ROM with instruction addresses.

### 🔹 ROM

Stores 4-bit instructions that encode control signals for the datapath.

### 🔹 CPU (Top-Level)

Integrates the program counter, ROM, and datapath. Executes a predefined sequence of instructions.

---

## 🧪 Tooling

- **Simulator**: Icarus Verilog
- **Waveform Viewer**: GTKWave

Each project contains a testbench for functional simulation.

---

## 🛠️ Design Focus

This repository emphasizes:

- Clean, modular Verilog
- Reusable components
- Instruction-driven CPU architecture
- Preparation for ASIC or FPGA synthesis
