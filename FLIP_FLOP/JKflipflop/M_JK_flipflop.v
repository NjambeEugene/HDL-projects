module master_JK_FLIPFLOP( 
input j,k,clk,rst,
output reg q,q_bar
);
reg master_q;

always @(posedge clk or posedge rst) begin
    if(rst)
    master_q <=0;
    else begin
        case({j,k})
            2'b00: master_q <= master_q;   2'b01:master_q <= 0;  
            2'b10 :master_q <= 1;          2'b11: master_q <= ~master_q;           
        endcase 
end
end

always @(negedge clk or posedge rst)
begin
    if(rst)begin
        q<=0;
        q_bar<=1;
    end else begin
        q <= master_q;
        q_bar <= ~master_q;
    end
end

endmodule