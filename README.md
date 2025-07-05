# Verilog Projects

This repository contains modular Verilog designs focused on constructing a complete 4-bit CPU from the ground up. Each project builds upon the last, demonstrating key digital design concepts such as combinational logic, sequential logic, and datapath control.

---

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
