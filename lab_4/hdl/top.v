module top(
    input wire start,
    input wire stop,
    input wire reset,
    input wire clk,
    output wire [0:6] seven_seg,
	output wire [3:0] seven_seg_num
);

    wire slw_clk;
    wire [3:0] next_num;

    reg running;
	 reg stopreg;
	 reg startreg;
	 
    always @(posedge clk) begin
		if(reset) begin
			running <= 1'b0;
			stopreg <= 1'b1;
			startreg <= 1'b1;
		end else begin
			stopreg <= stop;
			startreg <= start;
		end
		
		if(startreg & ~stopreg) begin
			running <= 1'b1;
		end else if(stopreg & ~startreg) begin
			running <= 1'b0;
		end else begin
			running <= running;
		end
	 end 


    clk_divider clock_divider(
        .clk(clk),
        .slw_clk(slw_clk)
    );

    counter count(
        .num_in(seven_seg_num),
        .num_out(next_num)
    );

    wire [3:0] dff_in;
    assign dff_in = running ? next_num : seven_seg_num; // if counter running use next num else keep current value

    dflipflop dff4bit(
        .clk(slw_clk),
        .r(reset),
        .d(dff_in),
        .q(seven_seg_num)
    );

    bcd_to_sev_seg numtosevenseg(
        .bcd(seven_seg_num),
        .seven_seg(seven_seg)
    );

endmodule

/*
PIN ASSIGNMENTS
seven_seg[0] Output PIN_C14
seven_seg[1] Output PIN_E15
seven_seg[2] Output PIN_C15
seven_seg[3] Output PIN_C16
seven_seg[4] Output PIN_E16
seven_seg[5] Output PIN_D17
seven_seg[6] Output PIN_C17
*/