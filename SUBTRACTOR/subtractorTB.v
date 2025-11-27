// Testbench for Full Subtractor
module full_subtractorTB();
    reg a, b, bin;           // Test inputs
    wire difference, borrow; // Outputs from DUT
    integer i;               

    // Instantiate the Device Under Test (DUT)
    full_subtractor dut(
        .a(a),
        .b(b),
        .bin(bin),
        .difference(difference),
        .borrow(borrow)
    );

    initial begin      
        $dumpfile("subtractor.vcd");
        $dumpvars(0, full_subtractorTB);

        // Apply all input combinations (a, b, bin)
        for(i=0; i<8; i=i+1) begin
            {a, b, bin} = i; 
            #10;            
       
            $display("time = %0t | a=%b | b=%b | bin=%b | difference=%b | borrow=%b", $time, a, b, bin, difference, borrow);
        end
        $finish;
    end
endmodule