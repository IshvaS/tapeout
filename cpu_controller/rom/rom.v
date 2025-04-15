module rom (
    input [2:0] addr,
    output reg [3:0] out
);
always @(*) begin
    case (addr)
        (3'b000): out = 4'b0000;
        (3'b001): out = 4'b1101;
        (3'b010): out = 4'b1110;
        (3'b011): out = 4'b1111;
        (3'b100): out = 4'b1111;
        (3'b101): out = 4'b0010;
        default: out = 4'b0000;
    endcase
end
endmodule