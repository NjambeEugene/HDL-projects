module sync_counter_tb;
    reg clock, reset;  reg [3:0] data_in; wire [3:0] counter_value; integer i;
    
    synchronous_counter uut (
        .clock(clock),
        .reset(reset),
        .data_in(data_in),
        .counter_value(counter_value)
    );
    initial begin
        clock = 0;
        forever #5 clock = ~clock;
    end

    task reset_input;
        begin
            reset = 1'b1; #10
            reset = 1'b0;
        end        
    endtask 

    task input_dut(input [3:0] j);
        begin
            data_in = j;
        end
   
    endtask
 
 initial begin
        $dumpfile("sync_counter.vcd");
        $dumpvars(0, sync_counter_tb);
       
        reset = 0;
        data_in = 4'b0000;
       
        reset_input();
        for(i=0; i<4; i=i+1)begin
            @(negedge clock);
            input_dut(1 <<i);
    end
       #50 $finish;
    end
    initial $monitor("time=%t clock=%b | reset=%b  data_in=%b | counter_value=%b", $time,clock, reset,data_in, counter_value);
endmodule
 