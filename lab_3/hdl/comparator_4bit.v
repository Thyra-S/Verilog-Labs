module comparator_4bit(
    input wire [3:0] A, 
    input wire [3:0] B,
    input wire C,
    output reg F1,
    output reg F2,
    output reg F3
);
wire [4:0] diff_un, diff_s;

// Subtraction unsigned and signed
assign diff_un =  {1'b0,A}-{1'b0,B};
assign diff_s =  {A[3],A}-{B[3],B};


always @(*) begin
    F1 = 0;
    F2 = 0;
    F3 = 0;
    if(C == 1) begin // signed case 
        if(diff_s[4] == 0)begin
            if (diff_s == 0) begin // equal
                F2 = 1;
            end else begin // A > B
                F1 = 1;
            end
        end else begin // A < B
            F3 = 1;
        end
    end else begin // unsigned case
        if(diff_un[4] == 0)begin
            if (diff_un == 0) begin // equal
                 F2 = 1;
            end else begin // A > B
                F1 = 1;
            end
        end else begin // A < B
            F3 = 1;
        end
    end
end

endmodule