module mux_2to1 (
    input wire i0,
    input wire i1,
    input wire s,
    output wire y
);
    assign y = (~s & i0) | (s & i1);
endmodule

module decoder_mux (
    input wire a1, a0,
    output wire y0, y1, y2, y3
);

    wire m0, m1, m2, m3;

    mux_2to1 M0 (.i0(1'b1), .i1(1'b0), .s(a0), .y(m0));
    mux_2to1 M1 (.i0(1'b0), .i1(1'b1), .s(a0), .y(m1));
    mux_2to1 M2 (.i0(1'b1), .i1(1'b0), .s(a0), .y(m2));
    mux_2to1 M3 (.i0(1'b0), .i1(1'b1), .s(a0), .y(m3));

    assign y0 = m0 & ~a1;
    assign y1 = m1 & ~a1;
    assign y2 = m2 & a1;
    assign y3 = m3 & a1;

endmodule