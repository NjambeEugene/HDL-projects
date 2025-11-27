module synchronous_counter(
    input clock,
    input reset,
    input load_enable,
    input [3:0] data_in,
    output reg [3:0] counter_value
);

always @(posedge clock)
begin
    if (reset)
        counter_value <= 4'b0000;
    else if (load_enable)
        counter_value <= data_in;
    else 
        counter_value <= counter_value - 1;
end
endmodule