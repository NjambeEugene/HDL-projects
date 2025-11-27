
module half_subtractor(
    input a,         // Minuend bit
    input b,         // Subtrahend bit
    output difference, 
    output borrow      
);

    assign difference = a ^ b;
    assign borrow = (~a) & b;
endmodule


module full_subtractor(
    input a,         // Minuend bit
    input b,         // Subtrahend bit
    input bin,       // Borrow in
    output difference, /
    output borrow      
);
    wire w1, w2, w3; // Internal wires
    // First half subtractor: a - b
    half_subtractor h1( a, b, w1, w2 );
    // Second half subtractor: (a-b) - bin
    half_subtractor h2( w1, bin, difference, w3 );
    assign borrow = w2 | w3;
endmodule