module async_counterTB();
    reg clock, reset;
    wire [3:0]q;

    async_counter dut (
    .clock(clock),    
    .reset(reset),
    .q(q)    
    );

    initial begin 
        clock = 1'b0;
        forever #5 clock = ~clock;
    end

    initial
    begin
        $dumpfile("Async_counter.vcd");
        $dumpvars(0, async_counterTB);
        #10;
        reset=1'b1;
        #10;
        reset = 1'b0;
        #150; $finish();
    end

    initial
    begin
        $monitor("Time =%t, clock=%b, reset=%b, q=%b",$time,clock,reset,q);
    end

endmodule