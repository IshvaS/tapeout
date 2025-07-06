module register (
    input [3:0] d,
    input clk, load, rstn,
    output reg [3:0] q
);

    initial begin
        q = 4'b0000;
    end

    always @(posedge clk or negedge rstn) begin
        if (!rstn)
            q <= 4'b0000;      // Reset takes highest priority
        else if (load)
            q <= d;            // Load when load=1
    end

endmodule
