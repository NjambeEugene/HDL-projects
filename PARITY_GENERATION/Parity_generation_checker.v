module parity_generator (
    input [3:0] data_in,
    output parity_bit
);
    assign parity_bit = ~(^data_in);
endmodule

module parity_checker (
    input [3:0] data_in,
    input parity_bit,
    output error
);
    
    assign error = ^(data_in) ^parity_bit;
endmodule
