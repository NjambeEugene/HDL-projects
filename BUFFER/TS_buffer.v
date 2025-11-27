module tristate_buffer(
    input wire A,       // data input
    input wire EN,      // enable 
    output wire Y       // tri-state output
);

assign Y = (EN) ? A : 1'bz;  //if EN=1 pass A, else high impedance (z)

endmodule