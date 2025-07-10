//2:1 mux - 4 bit data
module mux (
    input [3:0] a, b,
    input sel,
    output [3:0] out
);

    assign out = (sel) ? b : a;

endmodule