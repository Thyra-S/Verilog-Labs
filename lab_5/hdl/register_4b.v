module register_4b (
    input reg [3:0] data_in,
    input reg clk,
    input reg reset,
    input reg enable,
    output reg [3:0] data_out
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin 
            data_out <= 4'b0000;
        end else if (enable) begin
            data_out <= data_in;
        end else begin
            data_out <= data_out;
        end 
    end

endmodule