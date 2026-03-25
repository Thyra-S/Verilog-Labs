module Mux41Dataflow(
	input wire [1:0] s,
	input wire [3:0] d,
	output wire y
);
	wire and1, and2, and3, and4;
	
	assign and1 = d[0] & ~s[1] & ~s[0];
	assign and2 = d[1] & ~s[1] & s[0];
	assign and3 = d[2] & s[1] & ~s[0];
	assign and4 = d[3] & s[1] & s[0];
	
	assign y = and1 | and2 | and3 | and4;
	
endmodule
