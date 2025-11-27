module counter4bit_sync(
    input clk,          
    input rst,          // synchronous reset
    input en,           // enable counting
    input up_down,      // 1 = count up, 0 = count down
    output reg [3:0] count
);

always @(posedge clk) begin
    if (rst)            
        count <= 4'b0000;
    else if (en) begin
        if (up_down)
            count <= count + 1;
        else
            count <= count - 1;

    end
end

endmodule