`timescale 1ns/1ps

module alu_tb;

    reg [3:0] a, b;
    reg [1:0] sel;
    wire [3:0] out;
    wire carry_out;
    wire zero_flag;
    wire overflow_flag;
    reg [1023:0] vcdfile;

    alu uut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out),
        .carry_out(carry_out),
        .zero_flag(zero_flag),
        .overflow_flag(overflow_flag)
    );

    initial begin
        if (!$value$plusargs("vcd=%s", vcdfile))
            vcdfile = "wave.vcd";
        $dumpfile(vcdfile);
        $dumpvars(0, alu_tb);
    end

    task display_op;
        input [1:0] sel;
        begin
            case (sel)
                2'b00: $write("AND\t");
                2'b01: $write("OR\t");
                2'b10: $write("XOR\t");
                2'b11: $write("ADD\t");
                default: $write("UNK\t");
            endcase
        end
    endtask

    initial begin
        $display("---------------------------------------------------------");
        $display("Op\tTime\ta\tb\tsel\tout\tcarry\tzero\toverflow");
        $display("---------------------------------------------------------");

        sel = 2'b00; a = 4'b0000; b = 4'b0000; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);
        a = 4'b1111; b = 4'b1111; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);
        a = 4'b1010; b = 4'b0101; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);

        sel = 2'b01; a = 4'b0000; b = 4'b0000; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);
        a = 4'b1010; b = 4'b0101; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);
        a = 4'b1100; b = 4'b1010; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);

        sel = 2'b10; a = 4'b0000; b = 4'b0000; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);
        a = 4'b1010; b = 4'b0101; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);
        a = 4'b1111; b = 4'b1111; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);

        sel = 2'b11; a = 4'b0000; b = 4'b0000; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);
        a = 4'b0111; b = 4'b0001; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);
        a = 4'b1000; b = 4'b1000; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);
        a = 4'b1111; b = 4'b0001; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);
        a = 4'b1111; b = 4'b1111; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);
        a = 4'b0111; b = 4'b0111; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);
        a = 4'b1001; b = 4'b0001; #10; display_op(sel); $display("%0t\t%b\t%b\t%b\t%b\t%b\t%b\t%b", $time, a, b, sel, out, carry_out, zero_flag, overflow_flag);

        $display("---------------------------------------------------------");
        $finish;
    end

endmodule
