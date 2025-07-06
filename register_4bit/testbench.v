`timescale 1ns/1ps

module testbench;

    reg clk, load, rstn;
    reg [3:0] d;
    wire [3:0] q;
    reg [1023:0] vcdfile;

    register uut (
        .clk(clk),
        .load(load),
        .rstn(rstn),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // VCD file generation
    initial begin
        if (!$value$plusargs("vcd=%s", vcdfile)) begin
            vcdfile = "wave.vcd";
        end
        $dumpfile(vcdfile);
        $dumpvars(0, testbench);
    end

    // Test sequence
    initial begin
        rstn = 0; load = 0; d = 4'd0; #10;  // Apply reset
        rstn = 1; #5;                       // Release reset

        load = 1; d = 4'd5; #10;           // Load 5
        load = 0;
        $display("Register: %d", q);       // Should print 5

        load = 0; d = 4'd9; #10;           // Should not load
        $display("Register: %d", q);       // Should still print 5

        load = 1; d = 4'd12; #10;          // Load 12
        load = 0;
        $display("Register: %d", q);       // Should print 12

        rstn = 0; #10;                      // Apply reset
        rstn = 1; #5;
        $display("Register after reset: %d", q); // Should print 0

        $finish;
    end

endmodule
