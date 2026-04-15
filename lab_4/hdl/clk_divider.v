module clk_divider(
input wire clk,
output reg slw_clk
);

reg [26:0] dividing_num;

initial begin
	slw_clk = 0;
	dividing_num = 0;
end

always @(posedge clk) begin
    if(dividing_num == 5) begin // divides the clock from 50MHz - 1Hz
        dividing_num <= 0; //reset the count
        slw_clk <= ~slw_clk; //flip the clock
    end else begin
        dividing_num <= dividing_num + 1;
    end
end

endmodule

