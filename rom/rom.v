module rom (
    input [2:0] addr,
    output reg [3:0] out
);

    always @(*) begin
        case (addr)
            3'b000: out = 4'b0001; // AND   alu_sel=00, mux_sel=0, load=1
            3'b001: out = 4'b0101; // OR    alu_sel=01, mux_sel=0, load=1
            3'b010: out = 4'b1001; // XOR   alu_sel=10, mux_sel=0, load=1
            3'b011: out = 4'b1101; // ADD   alu_sel=11, mux_sel=0, load=1
            3'b100: out = 4'b1111; // ADD   alu_sel=11, mux_sel=1, load=1 (feedback ALU result)
            3'b101: out = 4'b1111; // ADD   alu_sel=11, mux_sel=1, load=1
            3'b110: out = 4'b1111; // ADD   alu_sel=11, mux_sel=1, load=1
            default: out = 4'b0000; // Default: AND, mux_sel=0, load=0 (NOP)
        endcase
    end

endmodule
