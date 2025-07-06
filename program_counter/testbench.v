`timescale 1ns/1ps

module testbench;
    reg clk, rstn;
    wire [2:0] out;
    reg [1023:0] vcdfile;

    // Instantiate Program Counter
    program_counter uut (
        .clk (clk),
        .rstn(rstn),
        .out(out)
    );

    localparam CLK_PERIOD = 10;

    // Clock generation
    always #(CLK_PERIOD/2) clk = ~clk;

    // Waveform dump
    initial begin
        if (!$value$plusargs("vcd=%s", vcdfile)) begin
            vcdfile = "wave.vcd";
        end
        $dumpfile(vcdfile);
        $dumpvars(0, testbench);
    end

    // Test sequence
    initial begin
        clk = 0;
        rstn = 0;
        #15;            // Hold reset low for 15 ns

        rstn = 1;       // Release reset
        $monitor("Time=%0t : Count = %0d", $time, out);

        repeat (10) #(CLK_PERIOD);  // Let it count for 10 clock cycles

        rstn = 0;       // Apply reset again
        #(CLK_PERIOD);
        rstn = 1;       // Release reset and check if it resets to 0
        #(CLK_PERIOD);

        $finish;
    end

endmodule
