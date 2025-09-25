module encoder8_3TB();
    reg [7:0] i;
    wire [2:0] y;
    integer j;

    encoder8_3 dut (.i(i),.y(y));

    initial begin
        $dumpfile("encoder.vcd");
        $dumpvars(0, encoder8_3TB);
        i = 8'b00000000;

        for(j=0; j<8; j=j+1) begin
            i = 1 << j;
            #10;
        end
    end

    initial
        $monitor("input i=%8b | output y=%3b", i, y);
    initial 
    #100 $finish();
    endmodule
