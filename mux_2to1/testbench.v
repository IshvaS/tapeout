`timescale 1ns/1ps

module testbench;

reg a, b, sel;
wire out;

mux uut (
    .a(a),
    .b(b),
    .sel(sel),
    .out(out)
);

initial begin
    $dumpvars(0, testbench);

    a = 1'b0; b = 1'b1; sel = 1'b0; #10;
    $display("a=%d b = %d sel = %d out=%d", a, b, sel, out);

    a = 1'b1; b = 1'b0; sel = 1'b0; #10;
    $display("a=%d b = %d sel = %d out=%d", a, b, sel, out);

    a = 1'b0; b = 1'b1; sel = 1'b1; #10;
    $display("a=%d b = %d sel = %d out=%d", a, b, sel, out);

    a = 1'b1; b = 1'b0; sel = 1'b1; #10;
    $display("a=%d b = %d sel = %d out=%d", a, b, sel, out);

    $finish;
end

endmodule