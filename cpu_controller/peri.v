module tt_um_4bit_cpu (
    input [7:0] ui_in,
    output [7:0] uo_out,
    input [7:0] uio_in,
    output [7:0] uio_out,
    output [7:0] uio_oe,
    input clk,
    input rst_n
);

    wire [3:0] mux_in_data = ui_in[3:0];
    wire [3:0] alu_in_data = ui_in[7:4];

    wire [3:0] rom_out, alu_out, reg_out;
    wire [2:0] pc_out;
    wire carry_out, zero_flag, overflow_flag;

    cpu cpu_inst (
        .mux_in_data(mux_in_data),
        .alu_in_data(alu_in_data),
        .clk(clk),
        .rstn(rst_n),
        .carry_out(carry_out),
        .zero_flag(zero_flag),
        .overflow_flag(overflow_flag),
        .rom_out(rom_out),
        .alu_out(alu_out),
        .reg_out(reg_out),
        .pc_out(pc_out)
    );

    assign uo_out = {carry_out, zero_flag, overflow_flag, alu_out};  // example format
    assign uio_out = 8'b0;
    assign uio_oe = 8'b0;

endmodule
