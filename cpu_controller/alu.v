module alu (
    input [3:0] a, b,
    input [1:0] sel,
    output reg [3:0] out,
    output reg carry_out,
    output reg zero_flag   // Make zero_flag reg
);

    always @(*) begin
        case (sel)
            2'b00: {carry_out, out} = {1'b0, a & b}; // AND
            2'b01: {carry_out, out} = {1'b0, a | b}; // OR
            2'b10: {carry_out, out} = {1'b0, a ^ b}; // XOR
            2'b11: {carry_out, out} = a + b;         // ADD
            default: {carry_out, out} = 5'b0;
        endcase

        // Zero flag calculation inside the always block
        if (out == 4'b0000)
            zero_flag = 1'b1;
        else
            zero_flag = 1'b0;
    end

endmodule
