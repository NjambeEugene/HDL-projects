`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 01:18:56 PM
// Design Name: 
// Module Name: UART
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


module UART(
    input wire clk,
    input wire rst,
    output reg tx_line,
    input wire tx_start,
    input wire [7:0] tx_data_in
    );

reg [12:0] baud_counter;
reg baud_tick;

always @(posedge clk) begin
    if (rst) begin 
        baud_counter <=0;
        baud_tick <=0;
    end 
    
    else begin 
        if(baud_counter == 5207)begin
            baud_counter <=0;
            baud_tick <=1;
        end
        
        else begin
            baud_counter <=baud_counter+1;
            baud_tick <=0;
        end
            
    end
end    
parameter IDLE  = 2'b00;
parameter START = 2'b01;
parameter DATA  = 2'b10;
parameter STOP  = 2'b11;

reg [1:0] tx_state;
reg [2:0] bit_index;
reg [7:0] tx_shift_reg;

always @(posedge clk) begin
    if (rst) begin
        tx_state <= IDLE;
        tx_line <= 1;
        bit_index <= 0;
          if (tx_start) begin
                tx_shift_reg <= tx_data_in;
                tx_state <= START;
        
    end
    end else if (baud_tick) begin
        case (tx_state)
            IDLE: begin
                tx_line <=1;
                tx_state <=START;
            end
            START: begin
                tx_line <=0;
                bit_index <=0;
                tx_state <=DATA;
            end
            DATA: begin
                tx_line <= tx_shift_reg[0];
                tx_shift_reg <= tx_shift_reg >> 1;
                
                if (bit_index == 7) begin
                tx_state <=STOP;    
                end 
                else begin
                bit_index <= bit_index +1;
                end
            end
            STOP: begin
                tx_line <=1;
                tx_state <= IDLE;
                
            end
        endcase
    end
end
endmodule
