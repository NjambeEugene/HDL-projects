module tb_and_gate;
    reg A, B;
    wire Y;
      integer i;

    // Instantiate design module
    and_gate uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    // Monitor to print values whenever they change
    initial begin
        $monitor("Time=%t | A=%b B=%b Y=%b", $time, A, B, Y);
    end

    initial begin
        // Create dumpfile for waveform viewing
        $dumpfile("and_gate.vcd");
        $dumpvars(0, tb_and_gate);

        // Iterate through all binary combinations for A and B
      
        for (i = 0; i < 4; i = i + 1) begin
            {A, B} = i; #10;
        end

        $finish;
    end
endmodule
