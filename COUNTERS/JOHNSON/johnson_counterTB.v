module johnson_counter_tb();
    reg clock;
    reg reset;
    wire [3:0] out;
    johnson_counter uut(
        .clock(clock),
        .reset(reset),
        .out(out)
    );

    initial begin
        clock =0;
        forever #5 clock= ~clock;
        $finish;
        end

        initial begin
        $dumpfile("johnson_counter.vcd");
        $dumpvars(0, johnson_counter_tb);
            reset =1;#10;
            reset = 0;
            #100
        $finish;
        end

        initial begin
            $monitor("Time=%t, clock=%b,Reset=%b, Output=%b",$time, clock, reset, out);
        end
    endmodule