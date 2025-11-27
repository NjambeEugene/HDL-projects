
    module srLatchTB;
        reg s, r;
        wire q, q_bar;
        integer i;

        srLatch uut (
            .s(s),
            .r(r),
            .q(q),
            .q_bar(q_bar)
        );

        initial begin
            $dumpfile("SRlatch.vcd");
            $dumpvars(0, srLatchTB);
            for (i = 0; i < 4; i = i + 1) begin
                {s, r} = i;
                #10;
                if (s == 0 && r == 0)
                    $display("time=%0t | s=%b r=%b | q=x q_bar=x (INVALID)", $time, s, r);
                else
                    $display("time=%0t | s=%b r=%b | q=%b q_bar=%b", $time, s, r, q, q_bar);
            end
            $finish;
        end
    endmodule