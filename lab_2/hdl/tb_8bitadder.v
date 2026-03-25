module tb_8bitadder;

`define STEP 10

reg [7:0] a,b;
wire [7:0] sum;
wire cout;

carrylookahead8bit eightbitadder(
	.a(a),
	.b(b),
	.cin(0),
	.sum(sum),
	.cout(cout)
);

reg [15:0] test_vector;
reg [7:0] expected_sum;
reg expected_carry;
integer i;
integer errors = 0;


// 5. Initial block with for loop
initial begin
// Print header
$display("Time(ns)\ta\tb\tsum\tcarry\tExpected\tStatus");
$display("--------\t-\t-\t---\t-----\t--------\t------");

// Test all combinations using a for loop
for (i = 0; i < 65536; i = i + 1) begin
    // Convert loop index to test inputs
    test_vector = i[15:0];

    a = test_vector[15:8];
    b = test_vector[7:0];
    // Calculate expected results
    expected_sum = a + b;
	
    // Wait for circuit to settle
    #(`STEP);
    // Check and display results
    if ((sum === expected_sum) ) //&& (cout === expected_carry)
        $display("%0d\t%b\t%b\t%b\t%b\t%b%b\t\tPASS",
        $time, a, b, sum, cout, expected_sum, expected_carry);
    else begin
        $display("%0d\t%b\t%b\t%b\t%b\t%b%b\t\tFAIL",
        $time, a, b, sum, cout, expected_sum, expected_carry);
    errors = errors + 1;
    end
end
// Display final test results
    $display("\nSimulation completed with %0d errors", errors);
    $finish;
    
end
endmodule

