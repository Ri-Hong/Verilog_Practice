// Ternary Operator

// Similar to C
// (condition ? if_true : if_false)

// Code to find the smallest of 4 unsigned integers:
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0] small1;
    wire [7:0] small2;
    
    always @(*) begin
        small2 = (c < d) ? c : d;
        small1 = (a < b) ? a : b;

        min = (small1 < small2) ? small1 : small2;
    end
        
endmodule


// Reduction Operators
& a[3:0]     // AND: a[3]&a[2]&a[1]&a[0]. Equivalent to (a[3:0] == 4'hf)
| b[3:0]     // OR:  b[3]|b[2]|b[1]|b[0]. Equivalent to (b[3:0] != 4'h0)
^ c[2:0]     // XOR: c[2]^c[1]^c[0]

// Can also invert the outputs of these operators to create NAND, NOR, XNOR gates e.g., (~& d[7:0])


// For loop
// This code reverse the order of the bits in in and stores the result in out
for (int i = 0; i < $bits(out); i++) begin // $bits(out) returns the number of bits in out
    out[i] = in[$bits(out)-i-1];
end


// Example: 100 bit carry-ripple adder:
module top_module( 
    input [99:0] a, b,
    input cin,
    output reg [99:0] cout,
    output reg [99:0] sum );

    always @(*) begin
        sum[0] = a[0] ^ b[0] ^ cin;
        cout[0] = (a[0] & b[0]) | (a[0] & cin) | (b[0] & cin); 
        for (int i = 1; i < $bits(a); i++) begin
            sum[i] = a[i] ^ b[i] ^ cout[i-1];
            cout[i] = (a[i] & b[i]) | (a[i] & cout[i-1]) | (b[i] & cout[i-1]); 
        end
    
    end
    
endmodule


// Generate
// Used to create multiple instances of a module
// The following code creates 4 instances of the module my_module
module top_module (
    input [3:0] in,
    output [3:0] out
);

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            my_module my_module_inst (
                .in(in),
                .out(out[i])
            );
        end
    endgenerate
endmodule

