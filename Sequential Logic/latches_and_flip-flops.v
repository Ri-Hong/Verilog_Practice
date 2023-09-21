module d_flip_flop(
	input clk,
	input d,
	output reg q);
	
	// Use non-blocking assignment for edge-triggered always blocks
	always @(posedge clk)
		q <= d;
endmodule
