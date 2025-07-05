# ===== Universal Verilog Makefile =====
# Usage: make DIR=folder [run | gtkwave | clean]

# Default project directory
DIR ?= .

# Automatically find Verilog source files in the folder
SRC := $(wildcard $(DIR)/*.v)

# Output files
OUT := $(DIR)/out.vvp
VCD := $(DIR)/wave.vcd

# Default target
all: run

# Compile Verilog source files
compile:
	@echo "Compiling Verilog files in $(DIR)"
	iverilog -o $(OUT) $(SRC)

# Run simulation
run: compile
	@echo "Running simulation for $(DIR)"
	vvp $(OUT) +vcd=$(VCD)

# Open waveform in GTKWave
gtkwave: run
	@echo "Opening GTKWave"
	gtkwave $(VCD) &

# Clean generated files
clean:
	@echo "Cleaning build files in $(DIR)"
	rm -f "$(OUT)" "$(VCD)"
