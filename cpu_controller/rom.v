// module rom (
//     input [2:0] addr,
//     output reg [3:0] out
// );

//     always @(*) begin
//         case (addr)
//             3'b000: out = 4'b0001; // AND   alu_sel=00, mux_sel=0, load=1
//             3'b001: out = 4'b0101; // OR    alu_sel=01, mux_sel=0, load=1
//             3'b010: out = 4'b1001; // XOR   alu_sel=10, mux_sel=0, load=1
//             3'b011: out = 4'b1101; // ADD   alu_sel=11, mux_sel=0, load=1
//             3'b100: out = 4'b1111; // ADD   alu_sel=11, mux_sel=1, load=1 (feedback ALU result)
//             3'b101: out = 4'b1111; // ADD   alu_sel=11, mux_sel=1, load=1
//             3'b110: out = 4'b1111; // ADD   alu_sel=11, mux_sel=1, load=1
//             default: out = 4'b0000; // Default: AND, mux_sel=0, load=0 (NOP)
//         endcase
//     end

// endmodule

module rom (
    input [2:0] addr,
    output reg [3:0] out
);

    always @(*) begin
        case (addr)
            // Test AND: should clear reg (possible zero)
            3'b000: out = 4'b0001; // alu_sel=00 (AND), mux_sel=0, load=1

            // Test XOR: reg_data ^ alu_in_data; use equal operands to get zero
            3'b001: out = 4'b1001; // alu_sel=10 (XOR), mux_sel=0, load=1

            // Test ADD: initial addition, no overflow
            3'b010: out = 4'b1101; // alu_sel=11 (ADD), mux_sel=0, load=1

            // Test ADD with feedback: reg + alu_in_data, accumulates value
            3'b011: out = 4'b1111; // alu_sel=11 (ADD), mux_sel=1, load=1

            // Another ADD with feedback to try overflow
            3'b100: out = 4'b1111; // alu_sel=11 (ADD), mux_sel=1, load=1

            // Test XOR again: clear reg if operands match (zero flag test)
            3'b101: out = 4'b1001; // alu_sel=10 (XOR), mux_sel=0, load=1

            // Test ADD again
            3'b110: out = 4'b1101; // alu_sel=11 (ADD), mux_sel=0, load=1

            default: out = 4'b0000; // Default: NOP (AND with load=0)
        endcase
    end

endmodule
