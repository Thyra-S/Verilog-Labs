module top (
	input wire [1:0] s,
	input wire [3:0] d,
	output wire y
);

	// modules go here

	 Mux41Structural mux_instance1(
	 .s(s),
	 .d(d),
	 .y(y)
	 );
	
	// Mux41Dataflow mux_instance2(
	// .s(s),
	// .d(d),
	// .y(y)
	// );
	
	//Mux41Behavioral mux_instance3(
	//.s(s),
	//.d(d),
	//.y(y)
	//);
	
endmodule

