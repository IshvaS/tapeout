module testbench;
    reg clk, rstn;
    wire [2:0] out;
    reg [1023:0] vcdfile;

    program_counter uut(
        .clk (clk),
        .rstn(rstn),
        .out(out)
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) clk=~clk;

    initial begin
        if (!$value$plusargs("vcd=%s", vcdfile)) begin
            vcdfile = "wave.vcd";
        end
        $dumpfile(vcdfile);
        $dumpvars(0,testbench);
    end

    initial begin      
        clk = 0;
        rstn = 0;
        #(CLK_PERIOD);

        rstn = 1;
        $monitor("Count: %d", out);
        #(CLK_PERIOD);
        #(CLK_PERIOD);
        #(CLK_PERIOD);
        #(CLK_PERIOD);
        #(CLK_PERIOD);
        $finish;
    end

endmodule
