module decoder2_4TB();

    reg en,a,b;
    wire [3:0]y;
    integer i;

    decoder2_4 dut (.en(en),.a(a),.b(b),.y(y));

    initial
    begin
        $dumpfile("decoder.vcd");
        $dumpvars(0,decoder2_4TB);
    en=0; a=0; b=0;
 

        for(i=0; i<8; i=i+1)
        begin
           {en,a,b}=i;
            #10;
        end
    end

    initial $monitor(" time=%4t|en=%b |a=%b |b=%b |y=%b",$time,en,a,b,y);
    initial #100 $finish();
 
endmodule