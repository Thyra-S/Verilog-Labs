module fulladder(
    input wire a, 
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);

wire s, c1, c2;

halfadder ha1(
    .a(b),
    .b(cin),
    .sum(s),
    .cout(c1)
);

halfadder ha2(
    .a(a),
    .b(s),
    .sum(sum),
    .cout(c2)
);

assign cout = c1 | c2;

endmodule