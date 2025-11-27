`timescale 1ns / 1ps

// ---------------------------
// Half Adder Module
// ---------------------------
module half_adder (
    input wire A,
    input wire B,
    output wire SUM,
    output wire CARRY
);
    assign SUM   = A ^ B;   // XOR gate
    assign CARRY = A & B;   // AND gate
endmodule

// ---------------------------
// 2-to-1 MUX Using Half Adder
// ---------------------------
module mux_using_halfadder (
    input wire I0,
    input wire I1,
    input wire S,
    output wire Y
);
    wire sum1, carry1, sum2, carry2;

    // Half Adders
    half_adder HA1 (.A(I0), .B(S), .SUM(sum1), .CARRY(carry1));
    half_adder HA2 (.A(I1), .B(S), .SUM(sum2), .CARRY(carry2));

    // MUX logic reconstruction
    assign Y = (carry2 | (sum1 & ~S));

endmodule