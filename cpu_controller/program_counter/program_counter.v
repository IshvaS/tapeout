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

//output
//0 - 000
//1 - 001
//2 - 010
//3 - 011
//4 - 100
//...