`timescale 1ns/1ps
module piso_tb();
    reg clock, reset, load;
    reg [3:0] parallel_in;
    wire serial_out;
    wire [3:0] q;

    piso_shift_register uut(
        .clock(clock),
        .reset(reset),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out),
        .q(q)
    );

    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    initial begin
        $dumpfile("Shift_register.vcd");
        $dumpvars(0, piso_tb);
        $monitor("Time=%0t | Load=%b | Parallel_in=%b | Q=%b | Serial_out=%b", 
                  $time, load, parallel_in, q, serial_out);

      
        reset = 1; load = 0; parallel_in = 4'b1011; #10;
        reset = 0;

        // Parallel load
        load = 1; parallel_in = 4'b1011; #10;
        load = 0;

        #50;

        $finish;
    end
endmodule
