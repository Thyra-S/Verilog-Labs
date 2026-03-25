// Copyright (C) 2025  Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus Prime License Agreement,
// the Altera IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Altera and sold by Altera or its authorized distributors.  Please
// refer to the Altera Software License Subscription Agreements 
// on the Quartus Prime software download page.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 25.1std.0 Build 1129 10/21/2025 SC Lite Edition"
// CREATED		"Wed Jan 28 09:31:33 2026"

module TinyTechSchem(
	A,
	B,
	I,
	F
);


input wire	[1:0] A;
input wire	[1:0] B;
input wire	[1:0] I;
output wire	[1:0] F;

wire	SYNTHESIZED_WIRE_0, SYNTHESIZED_WIRE_1, SYNTHESIZED_WIRE_2, SYNTHESIZED_WIRE_3, SYNTHESIZED_WIRE_4, SYNTHESIZED_WIRE_5, SYNTHESIZED_WIRE_6, 
SYNTHESIZED_WIRE_7, SYNTHESIZED_WIRE_8, SYNTHESIZED_WIRE_9, SYNTHESIZED_WIRE_10, SYNTHESIZED_WIRE_11, SYNTHESIZED_WIRE_12, SYNTHESIZED_WIRE_13, 
SYNTHESIZED_WIRE_14, SYNTHESIZED_WIRE_15, SYNTHESIZED_WIRE_16, SYNTHESIZED_WIRE_17, SYNTHESIZED_WIRE_18, SYNTHESIZED_WIRE_19, SYNTHESIZED_WIRE_20,
SYNTHESIZED_WIRE_21, SYNTHESIZED_WIRE_22, SYNTHESIZED_WIRE_23;

assign	SYNTHESIZED_WIRE_5 = A[1] & B[1];

assign	SYNTHESIZED_WIRE_17 = A[0] ~^ B[0];

assign	SYNTHESIZED_WIRE_19 =  ~A[0];

assign	F[1] = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2 | SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_4 & SYNTHESIZED_WIRE_5 & SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_7 & SYNTHESIZED_WIRE_8 & I[1];

assign	SYNTHESIZED_WIRE_1 = I[0] & SYNTHESIZED_WIRE_9 & SYNTHESIZED_WIRE_10;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_11 & I[0] & I[1];

assign	SYNTHESIZED_WIRE_6 =  ~I[1];

assign	SYNTHESIZED_WIRE_8 = B[1] | A[1];

assign	SYNTHESIZED_WIRE_4 =  ~I[0];

assign	SYNTHESIZED_WIRE_7 =  ~I[0];

assign	SYNTHESIZED_WIRE_10 =  ~I[1];

assign	SYNTHESIZED_WIRE_13 = A[0] & B[0];

assign	SYNTHESIZED_WIRE_20 = SYNTHESIZED_WIRE_12 & SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_14;

assign	SYNTHESIZED_WIRE_23 = SYNTHESIZED_WIRE_15 & SYNTHESIZED_WIRE_16 & I[1];

assign	SYNTHESIZED_WIRE_21 = I[0] & SYNTHESIZED_WIRE_17 & SYNTHESIZED_WIRE_18;

assign	SYNTHESIZED_WIRE_22 = SYNTHESIZED_WIRE_19 & I[0] & I[1];

assign	SYNTHESIZED_WIRE_14 =  ~I[1];

assign	SYNTHESIZED_WIRE_12 =  ~I[0];

assign	SYNTHESIZED_WIRE_9 = A[1] ~^ B[1];

assign	SYNTHESIZED_WIRE_15 =  ~I[0];

assign	SYNTHESIZED_WIRE_18 =  ~I[1];

assign	F[0] = SYNTHESIZED_WIRE_20 | SYNTHESIZED_WIRE_21 | SYNTHESIZED_WIRE_22 | SYNTHESIZED_WIRE_23;

assign	SYNTHESIZED_WIRE_11 =  ~A[1];

assign	SYNTHESIZED_WIRE_16 = B[0] | A[0];


endmodule
