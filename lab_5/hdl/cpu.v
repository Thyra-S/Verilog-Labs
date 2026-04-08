module cpu(
    input wire [3:0] switches, 
    input wire [2:0]regs_en,
    input wire [1:0] bufs_en,
    input wire [1:0] alu_ctrl,
    input wire reset,
    input wire clk,
    output wire [6:0] seven_seg
);

tri [3:0] bus;
wire [3:0] r1_w, r2_w, r_out_iw, r_out_ow;

tristate_4b in_tri(
    .in(switches),
    .ctrl(bufs_en[0]),
    .out(bus)
);

register_4b r1 (
    .in(bus),
    .clk(clk),
    .enable(regs_en[0]),
    .reset(reset),
    .out(r1_w)
);

register_4b r2 (
    .in(bus),
    .clk(clk),
    .enable(regs_en[1]),
    .reset(reset),
    .out(r2_w)
);

alu_4b alu (
    .r1(r1_w),
    .r2(r2_w),
    .ctrl(alu_ctrl),
    .r_out(r_out_iw)
);

register_4b r_out (
    .in(r_out_iw),
    .clk(clk),
    .enable(regs_en[2]),
    .reset(reset),
    .out(r_out_ow)
);

tristate_4b out_tri(
    .in(r_out_ow),
    .ctrl(bufs_en[1]),
    .out(bus)
);

bcd_to_sev_seg num_to_sev_seg (
    .bcd(r_out_ow),
    .seven_seg(seven_seg)
);


endmodule