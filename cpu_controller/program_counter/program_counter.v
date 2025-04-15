module program_counter(
    input clk, rstn,
    output reg [2:0] out
);
always @(posedge clk) begin
    if (!rstn)
        out <= 0;
    else
        out <= out + 1;
end

endmodule