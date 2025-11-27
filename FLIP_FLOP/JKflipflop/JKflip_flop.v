module JKflip_flop (
  input clk, J, K,  
  output reg q,
  output q_bar
);

  assign q_bar = ~q;

  always @(posedge clk) begin
    case ({J, K})
      2'b00: q = q;      // No change
      2'b01: q = 1'b0;   // Reset
      2'b10: q = 1'b1;   // Set
      2'b11: q = ~q;     // Toggle
    endcase
  end
endmodule