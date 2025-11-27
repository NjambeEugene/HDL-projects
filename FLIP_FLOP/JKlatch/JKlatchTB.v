
module JKlatchTB;
    reg J, K;
    wire q, q_bar;

    // Instantiate the JKlatch
    JKlatch uut (
        .J(J),
        .K(K),
        .q(q),
        .q_bar(q_bar)
    );

    integer i;

    initial begin
        $dumpfile("JKlatch.vcd");
        $dumpvars(0, JKlatchTB);
    $monitor("time = %0t, J = %b, K = %b | q = %b, q_bar = %b", $time, J, K, q, q_bar);

        for (i = 0; i < 4; i = i + 1) begin
           {J, K} = i;
            #10;
        end
        $finish;
    end
endmodule
