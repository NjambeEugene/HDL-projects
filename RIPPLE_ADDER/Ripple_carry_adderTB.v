module ripple_carry_adderTB();
    reg [3:0] a, b;       reg c;               
    wire [3:0] sum;       wire carry;          
    integer i, j;        

    ripple_carry_adder dut(a, b, c, sum, carry);
    initial begin
    $dumpfile("ripple_carry_adder.vcd");
    $dumpvars(0, ripple_carry_adderTB, a, b, sum, carry);
        // Test with carry-in = 0
        c = 0;
        for(i = 0; i < 16; i = i + 1) begin
            for(j = 0; j < 16; j = j + 1) begin
                a = i; b = j;
                #10;
                $display("time = %t | a=%b | b=%b | c=%b | sum=%b | carry=%b", $time, a, b, c, sum, carry);
            end
        end
        // Test with carry-in = 1
        c = 1;
        for(i = 0; i < 16; i = i + 1) begin
            for(j = 0; j < 16; j = j + 1) begin
                a = i; b = j;
                #10;
                $display("time = %t | a=%b | b=%b | c=%b | sum=%b | carry=%b", $time, a, b, c, sum, carry);
            end
        end
        $finish;
    end
endmodule
