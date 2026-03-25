module counter(
    input wire [3:0] num_in,
    output reg [3:0] num_out
);

always @(*) begin // Once every clock cycle on the posedge handled by dff

	if(num_in == 9) begin 
		num_out = 4'b0000; // if num is at 9, reset to 0
	end else begin
		num_out = num_in + 1; // increment count by one
   end
end

endmodule