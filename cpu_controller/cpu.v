module cpu (
    input [3:0] mux_in_data, alu_in_data,
    input clk, rstn,
    output carry_out,
    output [3:0] rom_out, alu_out, reg_out,
    output [2:0] pc_out
);

wire [3:0] rom_to_datapath;
wire [1:0] alu_sel_rom;
wire [2:0] pc_to_rom;

program_counter pc1 (
    .clk(clk),
    .rstn(rstn),
    .out(pc_to_rom)
);

rom r1 (
    .addr(pc_to_rom),
    .out(rom_to_datapath)
);

datapath d1(
    .mux_in_data(mux_in_data),
    .alu_in_data(alu_in_data),
    .clk(clk),
    .reg_out(reg_out),
    .alu_out(alu_out),
    .carry_out(carry_out),
    .load(rom_to_datapath[0]),
    .mux_sel_data(rom_to_datapath[1]),
    .alu_sel_data(rom_to_datapath[3:2])
);

assign rom_out = rom_to_datapath;
assign pc_out = pc_to_rom;
endmodule