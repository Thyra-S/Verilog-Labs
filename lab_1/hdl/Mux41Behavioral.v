module Mux41Behavioral(
	input wire [1:0] s,
	input wire [3:0] d,
	output reg y
);

always @(*)
begin
	if(s[1])
		if(s[0])
			y = d[3];
		else
			y = d[2];
	else
		if(s[0])
			y = d[1];
		else
			y = d[0];
end

endmodule