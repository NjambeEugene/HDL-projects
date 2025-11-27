module tristate_buffer_tb;
reg A;
reg EN;
wire Y;

tristate_buffer uut (
    .A(A),
    .EN(EN),
    .Y(Y)
);

initial begin
    $dumpfile("TS_buffer.vcd");
    $dumpvars(0,tristate_buffer_tb);
    $monitor("Time=%t| A=%b | EN=%b | Y=%b", $time, A, EN, Y);
    
    // Test sequence
    A = 0; EN = 0; #10;
    A = 1; EN = 0; #10;
    A = 0; EN = 1; #10;
    A = 1; EN = 1; #10;
    
    $finish;
end
endmodule