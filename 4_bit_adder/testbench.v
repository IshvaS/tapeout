`timescale 1ns/1ps

module testbench;

reg [3:0] a, b;
wire [3:0] sum;
wire carry_out;

adder uut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry_out(carry_out)
);

initial begin
    $dumpfile("wave.vcd");          // For GTKWave viewing
    $dumpvars(0, testbench);        // Dump all variables

    a = 4'd5; b = 4'd3; #10;
    $display("a=%d b=%d sum=%d carry_out=%d", a, b, sum, carry_out);

    a = 4'd7; b = 4'd9; #10;
    $display("a=%d b=%d sum=%d carry_out=%d", a, b, sum, carry_out);

    a = 4'd15; b = 4'd1; #10;
    $display("a=%d b=%d sum=%d carry_out=%d", a, b, sum, carry_out);

    $finish;
end

endmodule
