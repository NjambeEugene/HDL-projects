module async_counter(
    input clock,
    input reset,
    output reg [3:0]q
);
    
always @(posedge clock,posedge reset) begin
    
    if(reset)
    q<=4'b0000;
    else
    q<=q-1;
end
endmodule
