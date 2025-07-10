`timescale 1ns/1ps

module alu_tb;

    reg [3:0] a, b;
    reg [1:0] sel;
    wire [3:0] out;
    wire carry_out, zero_flag;
    reg [1023:0] vcdfile;

    // Instantiate ALU
    alu uut(
        .a(a),
        .b(b),
        .sel(sel),
        .out(out),
        .carry_out(carry_out),
        .zero_flag(zero_flag)
    );

    // Task for testing a case
    task test_case;
        input [3:0] a_in, b_in;
        input [1:0] sel_in;
        begin
            a = a_in;
            b = b_in;
            sel = sel_in;
            #10; // Delay to observe output
        end
    endtask

    // Dump to VCD file
    initial begin
        if (!$value$plusargs("vcd=%s", vcdfile)) begin
            vcdfile = "wave.vcd";
        end
        $dumpfile(vcdfile);
        $dumpvars(0, alu_tb);
    end

    // Test sequence
    initial begin
        $display("Time\ta\tb\tsel\tout\tc_out\tzero_flag");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag);

        // ADD cases
        $display("----------ADD CASES---------");
        test_case(4'b0000, 4'b0000, 2'b11);
        test_case(4'b0001, 4'b0001, 2'b11);
        test_case(4'b0101, 4'b0011, 2'b11);
        test_case(4'b1111, 4'b0001, 2'b11);
        test_case(4'b1111, 4'b1111, 2'b11);
        test_case(4'b1000, 4'b1000, 2'b11);

        // AND cases
        $display("----------AND CASES---------");
        test_case(4'b0000, 4'b0000, 2'b00);
        test_case(4'b1111, 4'b0000, 2'b00);
        test_case(4'b1010, 4'b1100, 2'b00);
        test_case(4'b1111, 4'b1111, 2'b00);

        // OR cases
        $display("----------OR CASES---------");
        test_case(4'b0000, 4'b0000, 2'b01);
        test_case(4'b1000, 4'b0001, 2'b01);
        test_case(4'b1010, 4'b0101, 2'b01);
        test_case(4'b1111, 4'b0000, 2'b01);
        test_case(4'b1111, 4'b1111, 2'b01);

        // XOR cases
        $display("----------XOR CASES---------");
        test_case(4'b0000, 4'b0000, 2'b10);
        test_case(4'b1010, 4'b1010, 2'b10);
        test_case(4'b1111, 4'b0000, 2'b10);
        test_case(4'b1111, 4'b1111, 2'b10);
        test_case(4'b1010, 4'b0101, 2'b10);
        test_case(4'b1100, 4'b1010, 2'b10);

        // Mixed cases
        $display("----------ALL CASES---------");
        test_case(4'b0001, 4'b0010, 2'b00);
        test_case(4'b0001, 4'b0010, 2'b01);
        test_case(4'b0001, 4'b0010, 2'b10);
        test_case(4'b0001, 4'b0010, 2'b11);

        test_case(4'b0111, 4'b0001, 2'b11);
        test_case(4'b0111, 4'b0001, 2'b00);
        test_case(4'b0111, 4'b0001, 2'b01);
        test_case(4'b0111, 4'b0001, 2'b10);

        test_case(4'b1110, 4'b0001, 2'b11);
        test_case(4'b1110, 4'b0001, 2'b00);
        test_case(4'b1110, 4'b0001, 2'b01);
        test_case(4'b1110, 4'b0001, 2'b10);

        test_case(4'b0000, 4'b1111, 2'b11);
        test_case(4'b0000, 4'b1111, 2'b00);
        test_case(4'b0000, 4'b1111, 2'b01);
        test_case(4'b0000, 4'b1111, 2'b10);

        // Zero result checks
        $display("---------zero CASES---------");
        test_case(4'b0000, 4'b0000, 2'b01); // OR = 0
        test_case(4'b1010, 4'b0101, 2'b00); // AND = 0
        test_case(4'b1010, 4'b1010, 2'b01); // OR != 0

        $finish;
    end

endmodule
