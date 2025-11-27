module master_JK_FLIPFLOPTB();

    reg j,k, clk, rst;
    wire q, q_bar;

    master_JK_FLIPFLOP uut(.j(j),.k(k),.clk(clk),.rst(rst),.q(q),.q_bar(q_bar));

    initial begin
        clk =0;
        forever  #5 clk = ~clk;
    end

    initial begin

        $dumpfile("master_JK_FLIPFLOP.vcd");
        $dumpvars(0,master_JK_FLIPFLOPTB );
        $monitor("time=%t,clk=%b| j=%b, k=%b| q=%b, q_bar=%b",$time,clk,j,k,q,q_bar);

        rst=1;j =0;k=0; #10;
        rst =0;

        j=0;k=0; #10;
        j=0;k=1; #10;
        j=1;k=0; #10;
        j=1;k=1; #15;

        $finish;
    end
endmodule