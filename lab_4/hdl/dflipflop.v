module dflipflop(
    input  wire clk, r,
    input  wire [3:0] d, 
    output reg [3:0] q
);

always @(posedge clk) begin
    if(r) begin
        q <= 0;
    end else begin
        q <= d;
    end
end

endmodule