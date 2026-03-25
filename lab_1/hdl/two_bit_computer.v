module two_bit_computer(
	input wire[1:0] A,
	input wire[1:0] B,
	input wire[1:0] I,
	output wire[1:0] F
);

assign F[1] = (~I[1] & ~I[0])&(A[1]&B[1]) || (I[1] & ~I[0]) & (A[1] | B[1]) || (~I[1] & I[0]) & (A[1] ~^ B[1]) || (I[1] & I[0]) & (~A[1]);
assign F[0] = (~I[1] & ~I[0])&(A[0]&B[0]) || (I[1] & ~I[0]) & (A[0] | B[0]) || (~I[1] & I[0]) & (A[0] ~^ B[0]) || (I[1] & I[0]) & (~A[0]);

endmodule