`timescale 1ns / 1ps
module MUX_Half_adder_tb;
    reg I0, I1, S;
    wire Y;

 mux_halfadder uut (
        .I0(I0),
        .I1(I1),
        .S(S),
        .Y(Y)
    );
    integer i;
    initial begin
        $dumpfile("MUX_Half_adder.vcd");
        $dumpvars(0, MUX_Half_adder_tb);

        $display(" S | I0 | I1 | Y ");
        $display("---------------");

        for (i = 0; i < 8; i = i + 1) begin
            {S, I1, I0} = i[2:0];
            #5;
            $display(" %b |  %b |  %b | %b", S, I0, I1, Y);
        end
        $finish;
    end
endmodule