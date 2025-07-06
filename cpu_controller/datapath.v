module datapath (
    input [3:0] mux_in_data, alu_in_data,
    input mux_sel_data, clk, load,
    input [1:0] alu_sel_data,
    output carry_out,
    output [3:0] reg_out, alu_out
);

    wire [3:0] mux_out_reg_in, reg_out_alu_in, alu_result;

    // 4-bit MUX: Selects between mux_in_data and alu_out
    mux m1 (
        .a(mux_in_data),
        .b(alu_result),
        .sel(mux_sel_data),
        .out(mux_out_reg_in)
    );

    // Register: Stores the result
    register r1 (
        .d(mux_out_reg_in),
        .clk(clk),
        .load(load),
        .q(reg_out_alu_in)
    );

    // ALU: Computes a+b, a|b, a&b, a^b
    alu a1 (
        .a(reg_out_alu_in),
        .b(alu_in_data),
        .sel(alu_sel_data),
        .out(alu_result),
        .carry_out(carry_out)
    );

    // Outputs
    assign reg_out = reg_out_alu_in;
    assign alu_out = alu_result;

endmodule
