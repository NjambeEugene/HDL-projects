module sync_fifo #(
    parameter DATA_WIDTH = 4,   // 4-bit data
    parameter FIFO_DEPTH = 4    // 4 elements
)(
    input wire clk, rst,wr_en, rd_en,
    input wire [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out
);

    // FIFO memory
    reg [DATA_WIDTH-1:0] fifo_mem [0:FIFO_DEPTH-1];

    // Pointers
    reg [1:0] write_pointer;   
    reg [1:0] read_pointer;   
    reg [2:0] fifo_count;     

    always @(posedge clk) begin
        if (rst) begin
            write_pointer <= 0;
            read_pointer <= 0;
            fifo_count <= 0;
            data_out <= 0;
        end else begin
            // Write operation
            if (wr_en && (fifo_count < FIFO_DEPTH)) begin
                fifo_mem[write_pointer] <= data_in;
                write_pointer <= write_pointer + 1; 
            end

            // Read operation
            if (rd_en && (fifo_count > 0)) begin
                data_out <= fifo_mem[read_pointer];
                read_pointer <= read_pointer + 1; 
            end

            // Update fifo_count
            case ({wr_en && (fifo_count < FIFO_DEPTH), rd_en && (fifo_count > 0)})
                2'b10: fifo_count <= fifo_count + 1;  // write only
                2'b01: fifo_count <= fifo_count - 1;  // read only
                default: fifo_count <= fifo_count;  
            endcase
        end
    end

endmodule