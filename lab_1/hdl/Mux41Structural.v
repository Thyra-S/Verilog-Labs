module Mux41Structural (
	input wire [1:0] s,
	input wire [3:0] d,
	output wire y
);		
wire not_s1, not_s2;
wire and_out1, and_out2, and_out3, and_out4;
// logic goes here
not not1(not_s1, s[1]);
not not2(not_s2, s[0]);

and and1(and_out1, d[0], not_s1, not_s2);
and and2(and_out2, d[1], not_s1, s[0]);
and and3(and_out3, d[2], s[1], not_s2);
and and4(and_out4, d[3], s[1], s[0]);

or or1(y, and_out1, and_out2, and_out3, and_out4);

endmodule
