`timescale 1ns/1ps
module parity_tb();
    reg [3:0] data_in;
    wire parity_bit;
    wire error;


    parity_generator pg(.data_in(data_in), .parity_bit(parity_bit));
    parity_checker pc(.data_in(data_in), .parity_bit(parity_bit), .error(error));

    initial begin
        $dumpfile("parity_generator_checker.vcd");
        $dumpvars(0, parity_tb);
        $monitor("time=%t | data_in=%b | parity_bit=%b | error=%b",$time, data_in, parity_bit, error);

        data_in = 4'b0000; #10;
        data_in = 4'b0001; #10;
        data_in = 4'b0011; #10;
        data_in = 4'b0111; #10;
        data_in = 4'b1111; #10;

        #10 $finish;
    end
endmodule
