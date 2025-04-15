`timescale 1ns/1ps

module alu_tb;

    reg [3:0] a, b;
    reg [1:0] sel;
    wire [3:0] out;
    wire carry_out;

    alu uut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out),
        .carry_out(carry_out)
    );

    initial begin
        a = 0; b = 0; sel = 2'b00;
        // Display Header
        $display("Time\ta\tb\tsel\tout\tcarry_out");

        // Monitor Changes
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out);

        // Test Cases
        a = 4'b0011; b = 4'b0001; sel = 2'b00; #10; // a + b = 4
        a = 4'b0100; b = 4'b0010; sel = 2'b01; #10; // a - b = 2
        a = 4'b1100; b = 4'b1010; sel = 2'b10; #10; // a & b
        a = 4'b1100; b = 4'b1010; sel = 2'b11; #10; // a | b

        $finish;
    end

endmodule
