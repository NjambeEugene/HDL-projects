`timescale 1ns / 1ps

module moore_fsm_tb;
    reg clk;reg reset;
    reg in;    wire out;

    moore_fsm uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
    clk = 0;    reset = 1; in = 0;
    #10 reset = 0;

        //Test pattern: 1 0 1 1 0 1
        #10 in = 1;
        #10 in = 0;
        #10 in = 1; 
        #10 in = 1;
        #10 in = 0;
        #10 in = 1; 
        #20;

        $finish;
    end

    initial begin
         $dumpfile("moore_fsm_tb.vcd");
        $dumpvars(0, moore_fsm_tb);
        $monitor("T=%t | reset=%b | in=%b | out=%b", $time, reset, in, out);
    end

endmodule
