`timescale 1ns/1ps

module testbench;

    reg clk, load;
    reg [3:0] d;
    wire [3:0] q;
    reg [1023:0] vcdfile;

    register uut(
        .clk(clk),
        .load(load),
        .d(d),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        if (!$value$plusargs("vcd=%s", vcdfile)) begin
            vcdfile = "wave.vcd";
        end
        $dumpfile(vcdfile);
        $dumpvars(0,testbench);
    end

    initial begin

        load = 0; d = 4'd0; #10;

        load = 1; d = 4'd5; #10; // Load 5 into register
        $display("Register: %d", q); // 5

        load = 0; d = 4'd9; #10; // Should not load
        $display("Register: %d", q); // 5

        load = 1; d = 4'd12; #10; // Loads 12
        $display("Register: %d", q); // 12

        $finish;

    end

endmodule