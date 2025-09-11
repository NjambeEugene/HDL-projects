`timescale 1ns/1ps
`include "Half_adder.v"

module half_adderTB();
    //inputs
    reg a,b;
    

    //outputs
    wire sum;
    wire carry;
//Instantiate unit under test
    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // VCD dump
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adderTB);
        //Initialise inputs
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        $finish;
    end

    initial begin
        $monitor(" time=%g, a=%b, b=%b, sum=%b, carry=%b", $time, a, b, sum, carry);
    end

endmodule
            

