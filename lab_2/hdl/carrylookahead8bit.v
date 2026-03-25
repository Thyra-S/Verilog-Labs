module carrylookahead8bit(
    input wire [7:0] a,
    input wire [7:0] b,
    input wire cin,
    output wire [7:0] sum,
    output wire cout
);

wire [7:0] wc, wp, wg;
wire open;
assign wg = a & b;
assign wp = a | b;

assign wc[0] = cin;
assign wc[1] = wg[0] | (wp[0] & wc[0]);
assign wc[2] = wg[1] | (wp[1] & wc[1]);
assign wc[3] = wg[2] | (wp[2] & wc[2]);
assign wc[4] = wg[3] | (wp[3] & wc[3]);
assign wc[5] = wg[4] | (wp[4] & wc[4]);
assign wc[6] = wg[5] | (wp[5] & wc[5]);
assign wc[7] = wg[6] | (wp[6] & wc[6]);
assign cout = wg[7] | (wp[7] & wc[7]);


fulladder adder0(
    .a(a[0]),
    .b(b[0]),
    .cin(wc[0]),
    .sum(sum[0]),
    .cout(open)
);

fulladder adder1(
    .a(a[1]),
    .b(b[1]),
    .cin(wc[1]),
    .sum(sum[1]),
    .cout(open)
);

fulladder adder2(
    .a(a[2]),
    .b(b[2]),
    .cin(wc[2]),
    .sum(sum[2]),
    .cout(open)
);

fulladder adder3(
    .a(a[3]),
    .b(b[3]),
    .cin(wc[3]),
    .sum(sum[3]),
    .cout(open)
);

fulladder adder4(
    .a(a[4]),
    .b(b[4]),
    .cin(wc[4]),
    .sum(sum[4]),
    .cout(open)
);
fulladder adder5(
    .a(a[5]),
    .b(b[5]),
    .cin(wc[5]),
    .sum(sum[5]),
    .cout(open)
);

fulladder adder6(
    .a(a[6]),
    .b(b[6]),
    .cin(wc[6]),
    .sum(sum[6]),
    .cout(open)
);

fulladder adder7(
    .a(a[7]),
    .b(b[7]),
    .cin(wc[7]),
    .sum(sum[7]),
    .cout(open)
);

endmodule