module program_counter (
    input clk,
    input rstn,
    output reg [2:0] out
);

    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            out <= 3'b000;   // Asynchronous active-low reset
        else
            out <= out + 1;  // Increment by 1 on each clock
    end

endmodule
