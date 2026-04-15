module alu_4b(
    input wire [3:0] r1,
    input wire [3:0] r2,
    input wire [1:0] ctrl,
    output wire [3:0] r_out
);

wire [3:0] sum, or_out, xor_out, not_out;
wire carry_out;

cla4bitadd adder(
    .a(r1),
    .b(r2),
    .cin(0),
    .cout(carry_out),
    .sum(sum)
);

assign or_out[3:0]  = (r1 | r2);
assign xor_out[3:0] = (r1 ^ r2);
assign not_out[3:0] = (~r1);

/*  Multiplexer logic:
 11 = add
 10 = or_out
 01 = xor_out
 00 = not_out 
*/
assign r_out = (ctrl == 2'b11) ? sum    :
               (ctrl == 2'b10) ? or_out :
               (ctrl == 2'b01) ? xor_out: 
                                 not_out;

endmodule