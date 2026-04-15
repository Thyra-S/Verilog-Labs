`timescale 1ns / 1ps

module tb_cpu;

    // Inputs
    reg [3:0] switches;
    reg [2:0] regs_en;
    reg [1:0] bufs_en;
    reg [1:0] alu_ctrl;
    reg reset;
    reg clk;

    // Outputs
    wire [3:0] bcd;
    wire [6:0] seven_seg;
	 
	 integer i;

    // Instantiate the Unit Under Test (UUT)
    cpu uut (
        .switches(switches), 
        .regs_en(regs_en), 
        .bufs_en(bufs_en), 
        .alu_ctrl(alu_ctrl), 
        .reset(reset), 
        .clk(clk), 
        .bcd(bcd), 
        .seven_seg(seven_seg)
    );

    // Clock generation (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // FSM 10-State Sequence
    initial begin
        // Reset the CPU first
        reset = 1;
        switches = 4'b0000;
        regs_en = 3'b000;
        bufs_en = 2'b00;
        alu_ctrl = 2'b00;
        #10; 
        reset = 0;
		  for (i = 0; i < 16; i = i + 1) begin
            
            $display("========================================");
            $display(" TESTING STARTING INPUT: %0d", i);
            $display("========================================");

            // ---------------------------------------------------------
            // STATE 0: Idle / Initialize
            // ---------------------------------------------------------
            reset = 1;
			   switches = 4'b0000;
			   regs_en = 3'b000;
			   bufs_en = 2'b00;
			   alu_ctrl = 2'b00;
			   #10; 
			   reset = 0;
            #10;

            // ---------------------------------------------------------
            // STATE 1: Load external input into r1
            // ---------------------------------------------------------
            bufs_en = 2'b01;    
            regs_en = 3'b001;   
            switches = i[3:0];  // <--- Assign the loop variable here
            #10;

            // ---------------------------------------------------------
            // STATE 2: Load the constant 3 (4'b0011) into r2
            // ---------------------------------------------------------
            bufs_en = 2'b01;    
            regs_en = 3'b010;   
            switches = 4'b0011; 
            #10;

            // ---------------------------------------------------------
            // STATE 3: ADD r1 and r2
            // ---------------------------------------------------------
            bufs_en = 2'b00;    
            regs_en = 3'b100;   
            alu_ctrl = 2'b11;   
            switches = 4'b0000; 
            #10;

            // ---------------------------------------------------------
            // STATE 4: Move result from r_out back into r2
            // ---------------------------------------------------------
            bufs_en = 2'b10;    
            regs_en = 3'b010;   
            alu_ctrl = 2'b00;   
            #10;

            // ---------------------------------------------------------
            // STATE 5: Bitwise OR r1 and r2
            // ---------------------------------------------------------
            bufs_en = 2'b00;    
            regs_en = 3'b100;   
            alu_ctrl = 2'b10;   
            #10;

            // ---------------------------------------------------------
            // STATE 6: Move result from r_out back into r1
            // ---------------------------------------------------------
            bufs_en = 2'b10;    
            regs_en = 3'b001;   
            alu_ctrl = 2'b00;   
            #10;

            // ---------------------------------------------------------
            // STATE 7: Bitwise NOT r1
            // ---------------------------------------------------------
            bufs_en = 2'b00;    
            regs_en = 3'b100;   
            alu_ctrl = 2'b00;   
            #10;

            // ---------------------------------------------------------
            // STATE 8: Move result from r_out back into r1
            // ---------------------------------------------------------
            bufs_en = 2'b10;    
            regs_en = 3'b001;   
            alu_ctrl = 2'b00;   
            #10;

            // ---------------------------------------------------------
            // STATE 9: Bitwise XOR r1 and r2
            // ---------------------------------------------------------
            bufs_en = 2'b00;    
            regs_en = 3'b100;   
            alu_ctrl = 2'b01;   
            #10; 
            
            // Wait one extra cycle to let the final result settle in r_out
            // Print the final result for this sequence cycle
            $display("--> Final Result (bcd out) for input %0d is: %b\n", i, bcd);
            #10;

        end

        $display("Simulation Complete: Tested all 16 inputs.");
        $finish;
    end

    // Monitor outputs to the console
    initial begin
        $monitor("Time=%0t | switches=%b | b_en=%b | r_en=%b | alu_op=%b | bcd(r_out)=%b", 
                 $time, switches, bufs_en, regs_en, alu_ctrl, bcd);
    end

endmodule