// Create a 100-bit binary adder. The adder adds two 100-bit numbers and a carry-in to produce a 100-bit sum and carry out.


module top_module(
    input [99:0] a, b,
    input cin,
    output cout,
    output reg [99:0] sum
);
	// Niave Solution
    wire [99:0] carry;
    
    always @(*) begin
        
        for (int i = 0; i < 100; i = i + 1) begin
            sum[i] = a[i] ^ b[i] ^ (i == 0 ? cin : carry[i-1]);
            carry[i] = (a[i] & b[i]) | (a[i] & (i == 0 ? cin : carry[i-1])) | (b[i] & (i == 0 ? cin : carry[i-1]));
        end
        
        cout = carry[99];
    end

    // One line solution using concatenation
    // The concatenation {cout, sum} is a 101-bit vector.
	assign {cout, sum} = a+b+cin;
endmodule
