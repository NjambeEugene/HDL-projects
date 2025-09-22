// 2-to-4 Decoder with enable
module decoder2_4(
    input en, // enable
    input a,  // input a (was i0)
    input b,  // input b (was i1)
    output [3:0] y
);
    // Output logic: y[0] to y[3] are active based on enable and inputs
    assign y[0] = (en & ~a & ~b);
    assign y[1] = (en & ~a &  b);
    assign y[2] = (en &  a & ~b);
    assign y[3] = (en &  a &  b);
endmodule