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

module register (
    input [3:0] d,
    input clk, load,
    output reg [3:0] q
);

always @(posedge clk) begin
    if (load) begin
        q <= d;
    end
end

endmodule

module mux (
    input [3:0] a, b,
    input sel,
    output [3:0] out
);

assign out = (sel) ? b : a;

endmodule

module alu (
    input [3:0] a, b,
    input [1:0] sel,
    output reg [3:0] out,
    output reg carry_out
);

always @(*) begin
    case (sel)
        2'b00: {carry_out, out} = {1'b0, a & b}; // AND
        2'b01: {carry_out, out} = {1'b0, a | b}; // OR
        2'b10: {carry_out, out} = {1'b0, a ^ b}; // XOR
        2'b11: {carry_out, out} = a + b; // ADD
        default: {carry_out, out} = 5'b0;
    endcase
end

endmodule
