module shift_register(
    input clock, input reset, input serial_in,
    output reg [3:0] q
);
    always @(posedge clock) begin
        if (reset)
            q <= 4'b0000;
        else
            q <= {q[2:0], serial_in};
    end
endmodule