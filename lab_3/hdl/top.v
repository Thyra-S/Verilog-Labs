module top(
    input wire [3:0] A, 
    input wire [3:0] B,
    input wire C,
    output wire F1,
    output wire F2,
    output wire F3
);

comparator_4bit compare(
    .A(A),
    .B(B),
    .C(C),
    .F1(F1),
    .F2(F2),
    .F3(F3)
);

endmodule