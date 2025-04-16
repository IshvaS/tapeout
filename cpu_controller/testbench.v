`timescale 1ns/1ps
`default_nettype none

module testbench;

reg [3:0] mux_in_data, alu_in_data;
reg clk, rstn;

wire carry_out;
wire [3:0] rom_out, reg_out, alu_out;
wire [2:0] pc_out;

cpu uut (
    .mux_in_data(mux_in_data),
    .alu_in_data(alu_in_data),
    .clk(clk),
    .rstn(rstn),
    .pc_out(pc_out),
    .rom_out(rom_out),
    .carry_out(carry_out),
    .reg_out(reg_out),
    .alu_out(alu_out)
);

localparam CLK_PERIOD = 10;

// Clock generation
always #(CLK_PERIOD/2) clk = ~clk;

initial begin
    $dumpfile("cpu_tb.vcd");
    $dumpvars(0, testbench);
end

initial begin
    // --- Initial Reset Phase ---
    clk = 0;
    rstn = 0;
    mux_in_data = 4'b0000;
    alu_in_data = 4'b0000;
    #(CLK_PERIOD);  // Apply reset for 1 cycle

    $display("Count: %d | Reg: %b | ALU: %b | ROM: %b", pc_out, reg_out, alu_out, rom_out);

    // --- Begin execution ---
    mux_in_data = 4'b0101;
    alu_in_data = 4'b0001;
    rstn = 1;
    #(CLK_PERIOD);  // Register loads 0101

    $display("Count: %d | Reg: %b | ALU: %b | ROM: %b", pc_out, reg_out, alu_out, rom_out);

    #(CLK_PERIOD);
    $display("Count: %d | Reg: %b | ALU: %b | ROM: %b", pc_out, reg_out, alu_out, rom_out);

    #(CLK_PERIOD);
    $display("Count: %d | Reg: %b | ALU: %b | ROM: %b", pc_out, reg_out, alu_out, rom_out);

    #(CLK_PERIOD);
    $display("Count: %d | Reg: %b | ALU: %b | ROM: %b", pc_out, reg_out, alu_out, rom_out);

    alu_in_data = 4'b1000;
    #(CLK_PERIOD);
    $display("Count: %d | Reg: %b | ALU: %b | ROM: %b", pc_out, reg_out, alu_out, rom_out);

    $finish;
end

endmodule
`default_nettype wire
