module TB_up_down_counter();
reg clk, rst, en, up_down;
wire [3:0] count;

// instantiate counter
counter4bit_sync uut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .up_down(up_down),
    .count(count)

);

initial clk = 0;
always #5 clk = ~clk;  // 10 time units period

// test sequence
initial begin
    $dumpfile("up_down_counter.vcd");
    $dumpvars(0,TB_up_down_counter);
    rst = 1; en = 0; up_down = 1;
    #10 rst = 0; en = 1;      // start counting up
   #100 up_down = 0;         // count down
   #100 en = 0;              // stop counting
    #20 $finish;
end

// monitor
initial begin
    $monitor("Time=%t | rst=%b en=%b up_down=%b count=%b", 
             $time, rst, en, up_down, count);
end

endmodule