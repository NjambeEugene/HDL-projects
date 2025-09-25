module encoder8_3(
    input wire [7:0] i,
    output wire [2:0] y
);
    // Logic operations for 8-to-3 encoder
    assign y[2] = i[4] | i[5] | i[6] | i[7];
    assign y[1] = i[2] | i[3] | i[6] | i[7];
    assign y[0] = i[1] | i[3] | i[5] | i[7];
endmodule
