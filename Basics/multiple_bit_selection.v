// Create a 4-bit wide, 256-to-1 multiplexer. The 256 4-bit inputs are all packed into a single 1024-bit input vector. sel=0 should select bits in[3:0], sel=1 selects bits in[7:4], sel=2 selects bits in[11:8], etc.

module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

    // Niave Solution:
    // This doesn't work because verilog doesn't accept the part selection of multiple bits
    assign out = in[sel * 4 + 3: sel *4];
    
    // Solution 1: Concatenating multiple single-bit selections
    assign out = {in[sel*4+3], in[sel*4+2], in[sel*4+1], in[sel*4+0]};

    // Solution 2: Indexed vector part select
	assign out = in[sel*4 +: 4];		// Select starting at index "sel*4", then select a total width of 4 bits with increasing (+:) index number.
	assign out = in[sel*4+3 -: 4];	// Select starting at index "sel*4+3", then select a total width of 4 bits with decreasing (-:) index number.
	// Note: The width (4 in this case) must be constant.

endmodule



