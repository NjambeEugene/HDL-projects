
module piso_shift_register(
    input clock,
    input reset,
    input load,
    input [3:0] parallel_in,
    output reg serial_out,
    output reg [3:0] q
);

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            q <= 4'b0000;         
            serial_out <= 0;      
        end
        else if (load) begin
            q <= parallel_in;      // load parallel data
            serial_out <= parallel_in[0]; // LSB immediately
        end
        else begin
            serial_out <= q[0];   // output LSB before shift
            q <= q >> 1;          // shift right
        end
    end

endmodule
