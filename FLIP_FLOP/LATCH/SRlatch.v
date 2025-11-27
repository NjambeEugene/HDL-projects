module srLatch(
    input  s,      // Set input (active high)
    input  r,      // Reset input (active high)
    output q,      // Output Q (latch state)
    output q_bar   // Output Q-bar (complement of Q)
);
    // Internal wires for feedback
    wire q_int, q_bar_int;

    // NAND gate implementations for SR latch
    assign q     = ~(r & q_bar_int);    
    assign q_bar = ~(s & q_int);        
    assign q_int    = q;                // Feedback for Q
    assign q_bar_int= q_bar;            // Feedback for Q-bar
endmodule