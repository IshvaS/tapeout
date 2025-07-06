`timescale 1ns/1ps

module testbench;

    reg clk, load, mux_sel_data;
    reg [3:0] mux_in_data, alu_in_data;
    reg [1:0] alu_sel_data;
    wire [3:0] reg_out, alu_out;
    wire carry_out;
    reg [1023:0] vcdfile;

    // Instantiate the datapath
    datapath uut (
        .clk(clk),
        .load(load),
        .mux_sel_data(mux_sel_data),
        .mux_in_data(mux_in_data),
        .alu_in_data(alu_in_data),
        .alu_sel_data(alu_sel_data),
        .carry_out(carry_out),
        .reg_out(reg_out),
        .alu_out(alu_out)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Dump waveform for GTKWave
    initial begin
        if (!$value$plusargs("vcd=%s", vcdfile)) begin
            vcdfile = "wave.vcd";
        end
        $dumpfile(vcdfile);
        $dumpvars(0, testbench);
    end

    initial begin
        // Initialize
        mux_in_data = 0;
        alu_in_data = 0;
        alu_sel_data = 2'b11;  // ADD
        mux_sel_data = 0;      // Select external input
        load = 0;

        #10;

        // Step 1: Load 2 into register
        mux_in_data = 4'd2;
        mux_sel_data = 0; // Select mux_in_data
        load = 1;
        #10;
        load = 0;
        $display("After loading 2: reg_out=%0d, alu_out=%0d", reg_out, alu_out);

        // Step 2: Add 3
        alu_in_data = 4'd3;
        mux_sel_data = 1; // Select ALU output
        load = 1;
        #10;
        load = 0;
        $display("After adding 3: reg_out=%0d, alu_out=%0d", reg_out, alu_out);

        // Step 3: Add 4
        alu_in_data = 4'd4;
        mux_sel_data = 1; // Still select ALU output
        load = 1;
        #10;
        load = 0;
        $display("After adding 4: reg_out=%0d, alu_out=%0d", reg_out, alu_out);

        $finish;
    end

endmodule
