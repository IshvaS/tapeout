`timescale 1ns/1ps
`default_nettype none

module peri_tb;

    reg clk;
    reg rst_n;
    reg [7:0] ui_in;
    wire [7:0] uo_out;

    tt_um_4bit_cpu uut (
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(8'b0),
        .uio_out(),
        .uio_oe(),
        .clk(clk),
        .rst_n(rst_n)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $display("----- Starting Peripheral Test -----");

        rst_n = 0;
        ui_in = 8'b0001_0010; // alu_in_data = 0001, mux_in_data = 0010
        #20;
        rst_n = 1;

        // First phase
        repeat (6) begin
            #10;
            $display("Time: %0t | mux_in: %0d | alu_in: %0d | ALU Out: %0d | Carry: %0b | Zero: %0b | Overflow: %0b | uo_out: %08b",
                     $time, ui_in[3:0], ui_in[7:4], uo_out[3:0], uo_out[7], uo_out[6], uo_out[5], uo_out);
        end

        $display("----- Changing Inputs -----");
        ui_in = 8'b0011_0100; // alu_in_data = 0011, mux_in_data = 0100

        // Second phase
        repeat (6) begin
            #10;
            $display("Time: %0t | mux_in: %0d | alu_in: %0d | ALU Out: %0d | Carry: %0b | Zero: %0b | Overflow: %0b | uo_out: %08b",
                     $time, ui_in[3:0], ui_in[7:4], uo_out[3:0], uo_out[7], uo_out[6], uo_out[5], uo_out);
        end

        $display("----- Test Completed -----");
        $finish;
    end

endmodule

`default_nettype wire
