module register (
    input [3:0] d,
    input clk, load,rst,
    output reg [3:0] q
);

    always @(posedge clk) begin
        if (!rst) begin
            q <= 4'b0000;  // Reset to 0 when rst = 0
        end else if (load) begin
            q <= d;
        end
    end

endmodule