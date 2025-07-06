`timescale 1ns/1ps

module testbench;

    reg [2:0] addr;
    wire [3:0] out;
    reg [1023:0] vcdfile;

    rom uut(
        .addr(addr),
        .out(out)
    );

    // VCD file dump
    initial begin
        if (!$value$plusargs("vcd=%s", vcdfile))
            vcdfile = "wave.vcd";

        $dumpfile(vcdfile);
        $dumpvars(0, testbench);
    end

    // Test sequence
    initial begin
        $display("Testing ROM contents:");

        addr = 3'b000; #10;
        $display("Addr: %b | Out: %b", addr, out);

        addr = 3'b001; #10;
        $display("Addr: %b | Out: %b", addr, out);

        addr = 3'b010; #10;
        $display("Addr: %b | Out: %b", addr, out);

        addr = 3'b011; #10;
        $display("Addr: %b | Out: %b", addr, out);

        addr = 3'b100; #10;
        $display("Addr: %b | Out: %b", addr, out);

        addr = 3'b101; #10;
        $display("Addr: %b | Out: %b", addr, out);

        addr = 3'b110; #10;
        $display("Addr: %b | Out: %b", addr, out);

        addr = 3'b111; #10;
        $display("Addr: %b | Out: %b", addr, out);

        $finish;
    end

endmodule
