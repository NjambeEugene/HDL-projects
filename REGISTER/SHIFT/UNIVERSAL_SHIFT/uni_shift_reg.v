module universal_shift_reg (
    input  wire        clk,
    input  wire        rst,
    input  wire [1:0]  mode,      // control signal
    input  wire        s_left,    // serial input for left shift
    input  wire        s_right,   // serial input for right shift
    input  wire [3:0]  par_in,    // parallel data input
    output reg  [3:0]  q          // register output
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 4'b0000;
        else begin
            case (mode)
                2'b00: q <= q;                     // Hold
                2'b01: q <= {s_right, q[3:1]};    // Shift Right (bring in s_right)
                2'b10: q <= {q[2:0], s_left};     // Shift Left (bring in s_left)
                2'b11: q <= par_in;                // Parallel Load
                default: q <= q;
            endcase
        end
    end

endmodule