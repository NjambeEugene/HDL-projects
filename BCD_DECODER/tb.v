`timescale 1ns/1ps

module tb_bcd_to_7seg;

    reg  [3:0] bcd;
    wire [6:0] seg;
    // Instantiate the DUT
    bcd_to_7seg dut (
        .bcd(bcd),
        .seg(seg)
    );
    integer i;
    initial begin
        // Create waveform dump
        $dumpfile("BCDdecode.vcd");
        $dumpvars(0, tb_bcd_to_7seg);

        
        $display("Time\tBCD\tabcdefg");
        $monitor("%0dns\t%0d\t%b", $time, bcd, seg);

       
        for (i = 0; i < 16; i = i + 1) begin
            bcd = i[3:0];
            #10;
        end
        $finish;
    end
endmodule