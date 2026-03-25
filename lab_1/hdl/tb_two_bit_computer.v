module tb_two_bit_computer;

reg[1:0] A,B,I;
wire[1:0] F;
integer i,j,k;

two_bit_computer comp(
	.A(A),
	.B(B),
	.I(I),
	.F(F)
);

initial begin
//test
for(i = 0; i < 4; i =i+1) begin
	for(j = 0; j < 4; j =j+1) begin
		for(k = 0; k < 4; k =k+1) begin
			A=k;
			B=j;
			I=i;
			
			#1;
			
			$display("A1: %b, A0: %b, B1: %b, B0: %b, I1: %b, I0: %b, F1: %b, F0: %b",A[1],A[0],B[1],B[0],I[1],I[0],F[1],F[0]);
			end
		end
	end 
end
endmodule

