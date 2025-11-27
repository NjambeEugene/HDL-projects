module alu_4bit(
    input [3:0] a, b,
    input [2:0] select,
    output reg [3:0] y,
    output reg cout
);
    always @(*) begin
        case(select)
            3'b000: {cout, y} = a + b;       // addition
            3'b001: {cout, y} = a - b;       // subtraction
            3'b010: y = a & b;               // and
            3'b011: y = a | b;               // or
            3'b100: y = a ^ b;               // xor
            3'b101: y = ~a;                  // not
            3'b110: y = a + 1;               // increment
            3'b111: y = a - 1;               // decrement
            default: y = 4'b0000;
        endcase
    end
endmodule
