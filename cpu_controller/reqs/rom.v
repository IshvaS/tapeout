module rom (
    input [2:0] addr,
    output reg [3:0] out
);
always @(*) begin
    case (addr)
        (3'b000): out = 4'b0001;
        (3'b001): out = 4'b1111;
        (3'b010): out = 4'b1111;
        (3'b011): out = 4'b1111;
        (3'b100): out = 4'b1111;
        (3'b101): out = 4'b1111;
        default: out = 4'b0000;
    endcase
end
endmodule