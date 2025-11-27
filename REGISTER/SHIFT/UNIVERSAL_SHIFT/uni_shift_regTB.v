module tb_universal_shift_reg;
    // Signals
    reg clk = 0, rst, s_left, s_right;
    reg [1:0] mode;
    reg [3:0] par_in;
    wire [3:0] q;

    // DUT instantiation
    universal_shift_reg dut (
        .clk(clk), .rst(rst), .mode(mode),
        .s_left(s_left), .s_right(s_right),
        .par_in(par_in), .q(q)
    );

    // Clock generation: 10 time units period
    always #5 clk = ~clk;

    initial begin
        // 1. RESET
        rst = 1; mode = 2'b00; s_left = 0; s_right = 0; par_in = 4'b0000; 
        #10 rst = 0;

        // 2. PARALLEL LOAD
        par_in = 4'b1101; mode = 2'b11; s_left = 0; s_right = 0; #10;

        // 3. CLEAR par_in explicitly while HOLDing value in register
        mode = 2'b00; par_in = 4'b0000; s_left = 0; s_right = 0; #10;

        // 4. HOLD (register keeps value)
        mode = 2'b00; s_left = 0; s_right = 0; #10;

        // 5. SHIFT RIGHT
        mode = 2'b01; s_left = 0; s_right = 1; #10;

        // 6. SHIFT LEFT
        mode = 2'b10; s_left = 1; s_right = 0; #10;

        $finish;
    end

    // Monitor signals
    initial $monitor("T=%t | clk=%b rst=%b | mode=%b | s_left=%b s_right=%b | par_in=%b | q=%b",
                     $time, clk, rst, mode, s_left, s_right, par_in, q);
endmodule