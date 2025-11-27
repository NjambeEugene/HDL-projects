`timescale 1ns / 1ps
module moore_fsm (
    input clk,
    input reset,
    input in,
    output reg out
);

 
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    reg [1:0] current_state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            S0: if (in) next_state = S1; else next_state = S0;
            S1: if (in) next_state = S1; else next_state = S2;
            S2: if (in) next_state = S3; else next_state = S0;
            S3: if (in) next_state = S1; else next_state = S2;
            default: next_state = S0;
        endcase
    end

    // Output logic 
    always @(*) begin
        case (current_state)
            S3: out = 1'b1;
            default: out = 1'b0;
        endcase
    end

endmodule