module testbench 

reg [3:0] a, b;
wire [3:0] sum;
wire carry_out

adder uut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry_out(carry_out)
);

initial begin
    a = 4'd5; b = 4'd3; #10;
    a = 4'd7; b = 4'd9; #10;
    a = 4'd15; b = 4'd1; #10;
    $finish;
end