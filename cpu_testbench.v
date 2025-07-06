// `timescale 1ns/1ps
// `default_nettype none

// module testbench;

//     reg clk, rstn;
//     reg [3:0] mux_in_data, alu_in_data;
//     wire carry_out;
//     wire [3:0] rom_out, alu_out, reg_out;
//     wire [2:0] pc_out;

//     reg [1023:0] vcdfile;

//     cpu uut(
//         .mux_in_data(mux_in_data),
//         .alu_in_data(alu_in_data),
//         .clk(clk),
//         .rstn(rstn),
//         .carry_out(carry_out),
//         .rom_out(rom_out),
//         .alu_out(alu_out),
//         .reg_out(reg_out),
//         .pc_out(pc_out)
//     );

//     localparam CLK_PERIOD = 10;

//     // Clock generation
//     initial begin
//         clk = 0;
//         forever #(CLK_PERIOD/2) clk = ~clk;
//     end

//     // VCD file generation
//     initial begin
//         if (!$value$plusargs("vcd=%s", vcdfile)) begin
//             vcdfile = "cpu_wave.vcd";
//         end
//         $dumpfile(vcdfile);
//         $dumpvars(0, testbench);
//     end

//     // Test sequence
//     initial begin
//         rstn = 0;
//         mux_in_data = 4'b0010;
//         alu_in_data = 4'b0001;
//         #10;  // Apply reset
//         rstn = 1; #5; // Release reset

//         // Instruction execution cycles
//         repeat (10) begin
//             #(CLK_PERIOD);
//             $display("PC: %0d | ROM: %b | Reg: %0d | ALU: %0d | Carry: %b", 
//                       pc_out, rom_out, reg_out, alu_out, carry_out);
//         end

//         $finish;
//     end

// endmodule
// `default_nettype wire


`timescale 1ns/1ps
`default_nettype none

module testbench;

    reg clk, rstn;
    reg [3:0] mux_in_data, alu_in_data;
    wire carry_out;
    wire [3:0] rom_out, alu_out, reg_out;
    wire [2:0] pc_out;

    reg [1023:0] vcdfile;

    cpu uut(
        .mux_in_data(mux_in_data),
        .alu_in_data(alu_in_data),
        .clk(clk),
        .rstn(rstn),
        .carry_out(carry_out),
        .rom_out(rom_out),
        .alu_out(alu_out),
        .reg_out(reg_out),
        .pc_out(pc_out)
    );

    localparam CLK_PERIOD = 10;

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // VCD file generation
    initial begin
        if (!$value$plusargs("vcd=%s", vcdfile)) begin
            vcdfile = "cpu_wave.vcd";
        end
        $dumpfile(vcdfile);
        $dumpvars(0, testbench);
    end

    // Test sequence
    initial begin
        // Initial values
        rstn = 0;
        mux_in_data = 4'b0010;
        alu_in_data = 4'b0001;

        #10;        // Hold reset low
        rstn = 1;   // Release reset
        #5;

        $display("----- Starting CPU Test -----");

        // Initial instruction cycles
        repeat (5) begin
            #(CLK_PERIOD);
            $display("Time: %0t | PC: %0d | ROM: %b | Reg: %0d | ALU: %0d | Carry: %b", 
                     $time, pc_out, rom_out, reg_out, alu_out, carry_out);
        end

        // Change external inputs
        $display("----- Changing Inputs -----");
        mux_in_data = 4'b1111;
        alu_in_data = 4'b0011;

        // More instruction cycles after input change
        repeat (5) begin
            #(CLK_PERIOD);
            $display("Time: %0t | PC: %0d | ROM: %b | Reg: %0d | ALU: %0d | Carry: %b", 
                     $time, pc_out, rom_out, reg_out, alu_out, carry_out);
        end

        $display("----- Test Completed -----");

        $stop;    // Pause simulation (useful in interactive runs)
        $finish;  // End simulation
    end

endmodule

`default_nettype wire
