//2 input and gate test bench
`timescale 1s/100ms
`include "and_gate.v"

module and2_TB();
    reg a;
    reg b;
   

    and2 iand2(a,b,y);

    initial 
    begin
        $monitor("a=%b, b=%b, y=%b", a, b, y);
        $dumpfile("and_gate.vcd");
        $dumpvars(0, and2_TB);
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        $finish;
        
    end

 endmodule