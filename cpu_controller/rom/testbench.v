module testbench;

    reg [2:0] addr;
    wire [3:0] out;

    rom uut(
        .addr(addr),
        .out(out)
    );

    initial begin
        $monitor("Addr: %b Out: %b", addr, out);
        addr = 0;#10;
        addr = 1;#10;
        addr = 2;#10;
        addr = 3;#10;
        addr = 4;#10;
        addr = 5;#10;
        $finish;
    end
endmodule 