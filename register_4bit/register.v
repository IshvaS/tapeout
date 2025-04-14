module register (
    input [3:0] d,
    input clk, load,
    output reg [3:0] q
);

always @(posedge clk) begin
    if (load) begin
        q <= d;
    end
end

endmodule   