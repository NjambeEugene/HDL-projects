module JKflip_flopTB;
    reg clk, J, K;
    wire q, q_bar;

    JKflip_flop uut (.clk(clk), .J(J), .K(K), .q(q), .q_bar(q_bar));

    integer i;

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("JKflip_flop.vcd");
        $dumpvars(0, JKflip_flopTB);
    $monitor("t=%0t | clk=%b | J=%b K=%b | q=%b qb=%b", $time, clk, J, K, q, q_bar);

        for (i = 0; i < 4; i = i + 1) begin
            {J,K}=i;
            #40; 
        end
        $finish;
    end
endmodule
