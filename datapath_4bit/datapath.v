module datapath (
    input [3:0] mux_in_data, alu_in_data,
    input mux_sel_data, clk, load,
    input [1:0] alu_sel_data,
    output carry_out,
    output [3:0] reg_out, alu_out
);

wire [3:0] mux_out_reg_in, reg_out_alu_in, mux_in_alu_out;

mux m1 (
    .a(mux_in_data),
    .b(mux_in_alu_out),
    .sel(mux_sel_data),
    .out(mux_out_reg_in)
);

register r1 (
    .d(mux_out_reg_in),
    .load(load),
    .clk(clk),
    .q(reg_out_alu_in)
);

alu a1 (
    .a(reg_out_alu_in),
    .b(alu_in_data),
    .sel(alu_sel_data),
    .out(mux_in_alu_out),
    .carry_out(carry_out)
);

assign reg_out = reg_out_alu_in;
assign alu_out = mux_in_alu_out;

endmodule