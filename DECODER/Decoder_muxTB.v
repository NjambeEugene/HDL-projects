`timescale 1ns / 1ps
module tb_decoder_mux;
    reg a0, a1;
    wire y0, y1, y2, y3;

    decoder_mux uut (
        .a0(a0),
        .a1(a1),
        .y0(y0),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    );

    integer i;

    initial begin
        $dumpfile("decoder_mux_tb.vcd"); 
        $dumpvars(0, tb_decoder_mux);   
        $display("a1 a0 | y0 y1 y2 y3");
        $display("-------------------");

        for (i = 0; i < 4; i = i + 1) begin
            {a1, a0} = i; 
            #10;           
            $display("%b  %b |  %b  %b  %b  %b", a1, a0, y0, y1, y2, y3);
        end
    end
endmodule