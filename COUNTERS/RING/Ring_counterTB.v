module ring_counter_tb();
    reg clock , reset;
    wire [3:0] q;

    ring_counter uut(
        .clock(clock),
        .reset(reset),
        .q(q)
    );

    initial begin
          clock = 0;
        forever #5 clock = ~clock;
    end

    initial begin
        $dumpfile("Ring_counter.vcd");
        $dumpvars(0, ring_counter_tb);
        
        $monitor("Time=%t,q=%b", $time,q);

        reset = 1;
        #10 reset = 0;
        #100;
        $finish;
    end
endmodule
