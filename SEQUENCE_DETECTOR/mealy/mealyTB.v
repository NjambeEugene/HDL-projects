`timescale 1ns / 1ps
module mealy_fsm_tb;
    reg clk; reg reset; reg in; wire out; wire [1:0] state;
    integer i;
    reg seq_array [0:7]; 

    mealy_fsm uut (.clk(clk), .reset(reset), .in(in), .out(out), .state(state));

    initial begin clk = 0; forever #5 clk = ~clk; end

    initial begin
        $dumpfile("mealy_tb.vcd");
        $dumpvars(0, mealy_fsm_tb);
        reset = 1; in = 0;
        //sequence: 1,0,1,0,1,1,0,1 
        seq_array[0] = 1; seq_array[1] = 0; seq_array[2] = 1; seq_array[3] = 0;
        seq_array[4] = 1; seq_array[5] = 1; seq_array[6] = 0; seq_array[7] = 1;
        #15 reset = 0;

        for (i = 0; i < 8; i = i + 1) begin
            @(posedge clk);
            in = seq_array[i];#1; 
            $display("T=%0t | reset=%b | in=%b | state=%b | out=%b", $time, reset, in, state, out);
        end

        #20; $finish;
    end

endmodule