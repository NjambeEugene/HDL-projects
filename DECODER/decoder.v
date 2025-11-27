
module decoder2_4(
    input en, // enable
    input a,  
    input b,  
    output [3:0] y
);
  
    assign y[0] = (en & ~a & ~b);
    assign y[1] = (en & ~a &  b);
    assign y[2] = (en &  a & ~b);
    assign y[3] = (en &  a &  b);
endmodule