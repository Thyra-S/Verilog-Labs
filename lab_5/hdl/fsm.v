module fsm(
    input wire reset,
    input wire clk,
    input wire [3:0] input_switches,
	 output wire [3:0] bcd,
    output wire [0:6] seven_seg
);

reg [3:0] current_state;
wire [3:0] dummy;

always@(posedge clk) begin
    if(~reset) begin
        current_state <= 4'b0000;
    end else if (current_state < 4'b1001) begin
    current_state <= current_state + 4'b0001;
    end else begin
    current_state <= current_state; // Halt at state 9
    end
end

reg[3:0] cpu_input;
reg [2:0] regs_en;
reg [1:0] bufs_en;
reg [1:0] alu_ctrl;

cpu my_cpu (
    .switches(cpu_input), 
    .regs_en(regs_en), 
    .bufs_en(bufs_en), 
    .alu_ctrl(alu_ctrl), 
    .reset(~reset),
    .clk(clk),
	.bcd(bcd),
    .seven_seg(seven_seg)
);

always@(*) begin
    case(current_state)
        4'b0000: begin // 0
            bufs_en = 2'b00; // enable input buffer
            regs_en = 3'b000; // enable r1
            alu_ctrl = 2'b00; // ALU control signals (not used in this example)
            cpu_input = 4'b0000; // connect input switches to CPU
        end
        4'b0001: begin // 1
            bufs_en = 2'b01; // enable output buffer
            regs_en = 3'b001; // enable r1
            cpu_input = input_switches; // disconnect input switches from CPU
        end
        4'b0010: begin // 2
            bufs_en = 2'b01; // enable output buffer
            regs_en = 3'b010; // enable r2
            cpu_input = 4'b0011; // disconnect input switches from CPU
        end
        4'b0011: begin // 3
            bufs_en = 2'b00; // disable both buffers
            regs_en = 3'b100; // enable r_out
            alu_ctrl = 2'b11; // ALU control signals for addition
            cpu_input = 4'b0000; // disconnect input switches from CPU
        end
        4'b0100: begin // 4
            bufs_en = 2'b10; // enable output buffer
            regs_en = 3'b010; // enable r_2
            alu_ctrl = 2'b00; // ALU doesn't matter for this state
            cpu_input = 4'b0000; // disconnect input switches from CPU
        end
        4'b0101: begin // 5
            bufs_en = 2'b00; // disable both buffers
            regs_en = 3'b100; // enable r_out
            alu_ctrl = 2'b10; // ALU control signals for bitwise OR
            cpu_input = 4'b0000; // disconnect input switches from CPU
        end
        4'b0110: begin // 6
            bufs_en = 2'b10; // enable output buffer
            regs_en = 3'b001; // enable r_1
            alu_ctrl = 2'b00; // ALU doesn't matter for this state
            cpu_input = 4'b0000; // disconnect input switches from CPU
        end
        4'b0111: begin // 7 
            bufs_en = 2'b00; // disable both buffers
            regs_en = 3'b100; // enable r_out
            alu_ctrl = 2'b00; // ALU control signals for bitwise NOT
            cpu_input = 4'b0000; // disconnect input switches from CPU
        end
        4'b1000: begin // 8
            bufs_en = 2'b10; // enable output buffer
            regs_en = 3'b001; // enable r_1
            alu_ctrl = 2'b00; // ALU doesn't matter for this state
            cpu_input = 4'b0000; // disconnect input switches from CPU
        end
        4'b1001: begin // 9
            bufs_en = 2'b00; // disable both buffers
            regs_en = 3'b100; // enable r_out
            alu_ctrl = 2'b01; // ALU control signals for bitwise XOR
            cpu_input = 4'b0000; // disconnect input switches from CPU
        end
        default:begin
				bufs_en = 2'b00;
				regs_en = 3'b000;
				alu_ctrl = 2'b00;
				cpu_input = 4'b0000;
		  end
endcase
end

endmodule