
module full_adder(
	a,
	b,
	c_in,
	sum,
	carry_out
);
input a;
input b;
input c_in;
output sum;
output carry_out;

assign sum = a ^ b ^ c_in;
assign carry_out = (a & b) | (a & c_in) | (c_in & b);

endmodule