module ring_counter(
    input clock, input reset,
    output [3:0] out,
    output reg [3:0] q);

    always @(posedge clock) begin
        if (reset)
            q <= 4'b0001;
        else begin
            q[3] <= q[2];
            q[2] <= q[1];
            q[1] <= q[0];
            q[0] <= q[3];
        end
    end

    assign out = q;

endmodule
