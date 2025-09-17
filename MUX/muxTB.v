module mux_2_1tb();
    reg select, i0, i1;
    wire y;
    integer i;

        mux_2_1 dut (.select(select),.i0(i0),.i1(i1),.y(y));

    initial begin
        $dumpfile("mux.vcd");
        $dumpvars(0, mux_2_1tb);
        select = 0; i0 = 0; i1 = 0; 
        
        for(i=0; i<8; i=i+1) begin
            {select, i0, i1} = i;
            #10;
        end
    end

    initial 
    begin
    $monitor ("Time=%4t | select = %b | i0 = %b | i1 = %b | y = %b", $time, select, i0, i1, y);
    end
endmodule