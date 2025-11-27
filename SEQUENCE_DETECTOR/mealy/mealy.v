
module mealy_fsm (
    input clk,
    input reset,
    input in,
    output reg out,
    output [1:0] state   
);

  
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;

    reg [1:0] current_state, next_state;
    assign state = current_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    always @(*) begin
    next_state = S0;
        out = 1'b0;

        case (current_state)
            S0: begin
                if (in) begin
                    next_state = S1;
                    out = 1'b0;
                end 
                else begin
                    next_state = S0;
                    out = 1'b0;
                end
            end

            S1: begin
                if (in) begin
                    next_state = S1;
                    out = 1'b0;
                end
                 else begin
                    next_state = S2;
                    out = 1'b0;
                end
            end

            S2: begin
                if (in) begin
                    // matched 101 = output immediately
                    next_state = S1;
                    out = 1'b1;
                end 
                else begin
                    next_state = S0;
                    out = 1'b0;
                end
            end

            default: begin
                next_state = S0;
                out = 1'b0;
            end
        endcase
    end

endmodule