
// Half Subtractor Module
// Performs subtraction of two single bits: a - b
// Outputs:
//   difference = a - b
//   borrow = 1 if a < b, else 0
module half_subtractor(
    input a,         // Minuend bit
    input b,         // Subtrahend bit
    output difference, // Difference output
    output borrow      // Borrow output
);
    // Difference is XOR of a and b
    assign difference = a ^ b;
    // Borrow is set if a is 0 and b is 1
    assign borrow = (~a) & b;
endmodule


// Full Subtractor Module
// Performs subtraction of three bits: a - b - bin
// Inputs:
//   a    = Minuend bit
//   b    = Subtrahend bit
//   bin  = Borrow in
// Outputs:
//   difference = a - b - bin
//   borrow     = Borrow out
module full_subtractor(
    input a,         // Minuend bit
    input b,         // Subtrahend bit
    input bin,       // Borrow in
    output difference, // Difference output
    output borrow      // Borrow output
);
    wire w1, w2, w3; // Internal wires
    // First half subtractor: a - b
    half_subtractor h1( a, b, w1, w2 );
    // Second half subtractor: (a-b) - bin
    half_subtractor h2( w1, bin, difference, w3 );
    // Borrow out is OR of both borrows
    assign borrow = w2 | w3;
endmodule