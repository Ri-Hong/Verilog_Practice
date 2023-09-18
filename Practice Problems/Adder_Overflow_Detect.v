// Assume that you have two 8-bit 2's complement numbers, a[7:0] and b[7:0]. These numbers are added to produce s[7:0]. Also compute whether a (signed) overflow has occurred.

module top_module (
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] s,
    output reg overflow
); //
    
    wire [7:0] carry;
    
    always @(*) begin
        
        for (int i = 0; i < 8; i = i+1) begin
            s[i] = a[i] ^ b[i] ^ (i == 0 ? 0 : carry[i-1]);
            carry[i] = (a[i] & b[i]) | (a[i] & (i == 0 ? 0 : carry[i-1])) | (b[i] & (i == 0 ? 0 : carry[i-1]));
        end
        
        // Two ways to compute overflow:
        // If the two inputs are +ve but sum is -ve
        overflow = (a[7] & b[7] & ~s[7]) | (~a[7] & ~b[7] & s[7]);
        
        // If the carry out of the MSB is different from the carry out of the second MSB
        // overflow = carry[7] ^ carry[6];
        
    end

endmodule
