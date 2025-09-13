
// Testbench for Full Subtractor
module full_subtractorTB();
    reg a, b, bin;           // Test inputs
    wire difference, borrow; // Outputs from DUT
    integer i;               // Loop variable

    // Instantiate the Device Under Test (DUT)
    full_subtractor dut(
        .a(a),
        .b(b),
        .bin(bin),
        .difference(difference),
        .borrow(borrow)
    );

    initial begin
        // Set up VCD file for waveform viewing
        $dumpfile("subtractor.vcd");
        $dumpvars(0, full_subtractorTB);

        // Apply all input combinations (a, b, bin)
        for(i=0; i<8; i=i+1) begin
            {a, b, bin} = i; // Assign bits of i to a, b, bin
            #10;            // Wait 10 time units
            // Display current values and outputs
            $display("time = %0t | a=%b | b=%b | bin=%b | difference=%b | borrow=%b", $time, a, b, bin, difference, borrow);
        end
        $finish; // End simulation
    end
endmodule