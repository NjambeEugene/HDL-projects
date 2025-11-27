`timescale 1ns/1ps
module shift_register_tb();
    reg clock, reset, serial_in;
    wire [3:0] q;

    shift_register uut(
        .clock(clock),
        .reset(reset),
        .serial_in(serial_in),
        .q(q)
    );

    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    initial begin
        $dumpfile("shift_register.vcd");
        $dumpvars(0, shift_register_tb);

        $monitor("Time= %0t| Reset=%b | Serial_in=%b | Output=%b", $time, reset, serial_in, q);

        reset = 1; serial_in = 0; #10 reset = 0;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;
        #20;
        $finish;
    end
endmodule