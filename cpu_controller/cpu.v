module cpu (
    input [3:0] mux_in_data, alu_in_data,
    input clk, rstn,
    output carry_out,
    output [3:0] rom_out, alu_out, reg_out,
    output [2:0] pc_out
);

    wire [3:0] rom_instruction;
    wire [3:0] reg_data, alu_result, mux_out;
    wire [2:0] pc_addr;

    wire [1:0] alu_sel;
    wire mux_sel, load;

    // Program Counter
    program_counter pc_inst (
        .clk(clk),
        .rstn(rstn),
        .out(pc_addr)
    );

    // ROM providing control signals
    rom rom_inst (
        .addr(pc_addr),
        .out(rom_instruction)
    );

    assign alu_sel = rom_instruction[3:2];
    assign mux_sel = rom_instruction[1];
    assign load    = rom_instruction[0];

    // Datapath (Register + MUX + ALU)
    mux mux_inst (
        .a(mux_in_data),
        .b(alu_result),
        .sel(mux_sel),
        .out(mux_out)
    );

    register reg_inst (
        .clk(clk),
        .load(load),
        .rstn(rstn),
        .d(mux_out),
        .q(reg_data)
    );

    alu alu_inst (
        .a(reg_data),
        .b(alu_in_data),
        .sel(alu_sel),
        .out(alu_result),
        .carry_out(carry_out)
    );

    // Outputs for observation
    assign reg_out = reg_data;
    assign alu_out = alu_result;
    assign rom_out = rom_instruction;
    assign pc_out  = pc_addr;

endmodule
