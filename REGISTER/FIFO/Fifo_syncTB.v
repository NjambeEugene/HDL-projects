module tb_sync_fifo;
    reg clk; rst;write_enable; read_enable;
    reg [3:0] data_input;   
    wire [3:0] data_output;

    sync_fifo #(4, 4) fifo_inst (
        .clk(clk),
        .rst(rst),
        .wr_en(write_enable),
        .rd_en(read_enable),
        .data_in(data_input),
        .data_out(data_output)
    );
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        write_enable = 0;
        read_enable = 0;
        data_input = 4'b0000;
          #10 rst = 0;  

        repeat (4) begin
            data_input = data_input + 1;  // 0001, 0010, 0011, 0100
            write_enable = 1;
            read_enable = 0;
            #10;
        end

        write_enable = 0;
        data_input = 4'b0101;
        write_enable = 1;
        #10; d
        write_enable = 0;

        repeat (2) begin
            read_enable = 1;
            #10;
        end

        read_enable = 0;
        data_input = 4'b0101;
        write_enable = 1;
        #10;
        write_enable = 0;
    
        read_enable = 1;
        repeat (3) #10;
        read_enable = 0;

        #20 $finish;
    end
    initial begin
        $monitor("Time=%t | CLK=%b RST=%b WR_EN=%b RD_EN=%b | DATA_IN=%b DATA_OUT=%b",
                  $time, clk, rst, write_enable, read_enable, data_input, data_output);
    end
    initial begin
        $dumpfile("sync_fifo_tb.vcd");
        $dumpvars(0, tb_sync_fifo);
    end

endmodule