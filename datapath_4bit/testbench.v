`timescale 1ns/1ps
`default_nettype none

module testbench;

reg clk, load, mux_sel_data;
reg [3:0] mux_in_data, alu_in_data;
reg [1:0] alu_sel_data;
wire carry_out;
wire [3:0] reg_out, alu_out;

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

localparam CLK_PERIOD = 10;

// Clock generation
always #(CLK_PERIOD/2) clk = ~clk;

initial begin
    $dumpfile("tb_datapath.vcd");
    $dumpvars(0, testbench);
end

initial begin
    clk = 0;
    mux_in_data = 0;
    alu_in_data = 0;
    alu_sel_data = 0;
    load = 0;
    mux_sel_data = 0;
    #(CLK_PERIOD);

    mux_in_data = 4'b0101;
    alu_in_data = 4'b0001;
    alu_sel_data = 2'b11;
    mux_sel_data = 0;
    load = 1;
    #(CLK_PERIOD);
    $display("%b, %b", reg_out, alu_out); // 0101 0110

    mux_sel_data = 1;
    load = 0;
    #(CLK_PERIOD);
    $display("%b, %b", reg_out, alu_out); // 0101 0110

    load = 1;
    #(CLK_PERIOD);
    $display("%b, %b", reg_out, alu_out); // 0110 0111

    load = 1;
    #(CLK_PERIOD);
    $display("%b, %b", reg_out, alu_out); // 0111 1000

    alu_sel_data = 2'b00;
    alu_in_data = 4'b1000;
    load = 0;
    #(CLK_PERIOD);
    $display("%b, %b", reg_out, alu_out); // 0111 0000

    $finish;
end

endmodule
`default_nettype wire
