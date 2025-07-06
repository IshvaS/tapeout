`timescale 1ns/1ps

module alu_tb;

    reg [3:0] a, b;
    reg [1:0] sel;
    wire [3:0] out;
    wire carry_out;
    wire zero_flag;
    reg [1023:0] vcdfile;

    // Instantiate the ALU
    alu uut(
        .a(a),
        .b(b),
        .sel(sel),
        .out(out),
        .carry_out(carry_out),
        .zero_flag(zero_flag)  // Include zero_flag
    );

    // VCD setup
    initial begin
        if (!$value$plusargs("vcd=%s", vcdfile)) begin
            vcdfile = "wave.vcd";
        end
        $dumpfile(vcdfile);
        $dumpvars(0, alu_tb);
    end

    // Test stimulus
    initial begin
        a = 0; b = 0; sel = 2'b00;
        
        // Display header
        $display("Time\ta\tb\tsel\tout\tc_out\tzero_flag");

        // Monitor signals
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b", 
            $time, a, b, sel, out, carry_out, zero_flag);

        // Test cases
        a = 4'b0011; b = 4'b0001; sel = 2'b11; #10; // ADD: 3 + 1 = 4
        a = 4'b0100; b = 4'b0010; sel = 2'b00; #10; // AND: 0100 & 0010 = 0000 (zero_flag should be 1)
        a = 4'b1100; b = 4'b1010; sel = 2'b01; #10; // OR: 1100 | 1010 = 1110
        a = 4'b1100; b = 4'b1010; sel = 2'b10; #10; // XOR: 1100 ^ 1010 = 0110

        $finish;
    end

endmodule
