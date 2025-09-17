module mux_2_1(
    input select,i0,i1,
    output y);

    assign y = select? i1 : i0;
    
endmodule
