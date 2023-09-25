// For each bit in an 8-bit vector, detect when the input signal changes from 0 in one clock cycle to 1 the next (similar to positive edge detection). The output bit should be set the cycle after a 0 to 1 transition occurs.
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);

    reg [7:0] prev_in;
    
    always @(posedge clk) begin
        for (int i = 0; i < 8; i = i + 1) begin
            pedge[i] <= ~prev_in[i] & in[i];
            prev_in[i] <= in[i];
        end
    end
    
    
endmodule
