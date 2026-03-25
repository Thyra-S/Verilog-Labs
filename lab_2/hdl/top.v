module top(
	input wire [3:0] a,
   input wire [3:0] b,
   output wire [3:0] sum,
   output wire cout
);

// ripplecarry4bit fourbitadder(
// 	.a(a),
// 	.b(b),
// 	.cin(0),
// 	.sum(sum),
// 	.cout(cout)
// );

carrylookahead4bit fourbitadder(
	.a(a),
	.b(b),
	.cin(0),
	.sum(sum),
	.cout(cout)
);

endmodule