`timescale 1ns/ 1ps
module tb_full_adder;

reg a, b, c_in;
wire sum, carry_out;
full_adder dut(a, b, c_in, sum, carry_out);

initial begin 
$dumpfile("fullAdderTB.vcd");
$dumpvars(0, tb_full_adder);
end


initial begin
$display("Testing full adder");
$monitor( "a = %b, b =%b, c_in = %b, sum = %b, carry_out = %b", a,b,c_in, sum, carry_out);

a = 0; b = 0; c_in = 0; #10;
a = 0; b = 0; c_in = 1; #10;
a = 0; b = 1; c_in = 0; #10;
a = 0; b = 1; c_in = 1; #10;
a = 1; b = 0; c_in = 0; #10;

$finish;
end
endmodule