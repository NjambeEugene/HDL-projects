module tb_fifo_simple;

    reg clk = 0;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [7:0] din;
    wire [7:0] dout;
    wire full;
    wire empty;

    // Instantiate the FIFO
    fifo_simple #(.DATA_WIDTH(8), .FIFO_DEPTH(4)) fifo_inst (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .din(din),
        .dout(dout),
        .full(full),
        .empty(empty)
    );

    // Clock generation
    always #5 clk = ~clk;  // 10ns period

    initial begin
        // Initialize
        rst = 1; wr_en = 0; rd_en = 0; din = 0;
        #12 rst = 0;

        // Write some data
        din = 8'hA1; wr_en = 1; #10;
        din = 8'hB2; wr_en = 1; #10;
        din = 8'hC3; wr_en = 1; #10;
        din = 8'hD4; wr_en = 1; #10;
        wr_en = 0; // stop writing

        // Try reading
        rd_en = 1; #10;
        #10; #10; #10; // read 4 times
        rd_en = 0;

        // Mixed write/read
        din = 8'hE5; wr_en = 1; #10;
        rd_en = 1; #10;
        wr_en = 0; rd_en = 0;

        #20 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%t | din=%h dout=%h | wr=%b rd=%b | full=%b empty=%b", 
                  $time, din, dout, wr_en, rd_en, full, empty);
    end

endmodule