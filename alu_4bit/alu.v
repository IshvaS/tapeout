module alu (
    input [3:0] a, b,
    input [1:0] sel,
    output reg [3:0] out,
    output reg carry_out
);

always @(*) begin
    case (sel)
        2'b00: {carry_out, out} = a + b; // Addition
        2'b01: {carry_out, out} = a - b; // Subtraction
        2'b10: {carry_out, out} = {1'b0, a & b}; // AND
        2'b11: {carry_out, out} = {1'b0, a | b}; // OR
        default: {carry_out, out} = 5'b0;
    endcase
end

endmodule
