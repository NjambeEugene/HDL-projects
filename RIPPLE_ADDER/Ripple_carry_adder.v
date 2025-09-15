
module full_adder(input a, b, c, output sum, carry);
    assign sum = a ^ b ^ c;
    assign carry = (a & b) | (a & c) | (b & c); 
endmodule


module ripple_carry_adder(
     input [3:0] a, b,
     input c, 
     output [3:0] sum, 
     output carry);
     wire c1, c2, c3;
    full_adder fa0(   .a(a[0]), .b(b[0]), .c(c),    .sum(sum[0]), .carry(c1)
    );
    full_adder fa1(
        .a(a[1]), .b(b[1]), .c(c1),   .sum(sum[1]), .carry(c2)
    );
    full_adder fa2(
        .a(a[2]), .b(b[2]), .c(c2),   .sum(sum[2]), .carry(c3)
    );
    full_adder fa3(
        .a(a[3]), .b(b[3]), .c(c3),   .sum(sum[3]), .carry(carry)
    );
endmodule