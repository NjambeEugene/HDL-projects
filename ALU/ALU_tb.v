`timescale 1ns/1ps
module alu_4bit_tb();
    reg [3:0] a, b;
    reg [2:0] select;
    wire [3:0] y;
    wire cout;

    alu_4bit uut(
        .a(a),
        .b(b),
        .select(select),
        .y(y),
        .cout(cout)
    );

    initial begin
        $dumpfile("alu_4bit.vcd");
        $dumpvars(0, alu_4bit_tb);
        $monitor("time=%t | a=%b | b=%b | sel=%b | y=%b | cout=%b", $time, a, b, select, y,cout);

        a = 4'b0101; b = 4'b0011;

        select = 3'b000; #10; // addition
        select = 3'b001; #10; // subtraction
        select = 3'b010; #10; // and
        select = 3'b011; #10; // or
        select = 3'b100; #10; // xor
        select = 3'b101; #10; // not
        select = 3'b110; #10; // increment
        select = 3'b111; #10; // decrement

        #10 $finish;
    end
endmodule
