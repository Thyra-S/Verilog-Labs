module halfadder(
	input wire a,
	input wire b,
	output wire cout,
	output wire sum
);

	assign cout = a&b;
	assign sum = a^b;

endmodule