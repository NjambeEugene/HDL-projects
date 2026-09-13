`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 08:52:35 PM
// Design Name: 
// Module Name: UART_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module UART_tb;

    reg clk = 0;
    reg rst = 1;
    reg tx_start = 0;
    reg [7:0] tx_data_in = 0;
    wire tx_line;

    UART uut (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data_in(tx_data_in),
        .tx_line(tx_line)
    );

    always #10 clk = ~clk;   // 20ns period = 50MHz clock

    initial begin
        #50 rst = 0;
        #100 tx_data_in = 8'h41;   // ASCII 'A'
        tx_start = 1;
        #20 tx_start = 0;
        #600000 $finish;
    end

endmodule
