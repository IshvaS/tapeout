module alu (
    input [3:0] a, b,
    input [1:0] sel,
    output reg [3:0] out,
    output reg carry_out,
    output zero_flag,
    output reg overflow_flag
);

    reg [4:0] sum;

    always @(*) begin
        carry_out = 0;
        overflow_flag = 0;
        sum = 5'b0;
        out = 4'b0;

        case (sel)
            2'b00: begin
                out = a & b;
            end
            2'b01: begin
                out = a | b;
            end
            2'b10: begin
                out = a ^ b;
            end
            2'b11: begin
                sum = a + b;
                out = sum[3:0];
                carry_out = sum[4];
                // Overflow for signed 4-bit add: carry into MSB differs from carry out of MSB
                overflow_flag = (~a[3] & ~b[3] & out[3]) | (a[3] & b[3] & ~out[3]);
            end
            default: begin
                out = 4'b0;
                carry_out = 0;
                overflow_flag = 0;
            end
        endcase
    end

    assign zero_flag = (out == 4'b0000);

endmodule
