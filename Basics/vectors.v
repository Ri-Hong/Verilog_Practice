// Endianness
// The endianness ("direction") of a vector is whether the LSB has a lower index (little-endian, e.g., [3:0]) or a higher index (big-endian, e.g., [0:3]).
// Once a vector is declared, its endianness cannot be changed. 

// Declaring vectors
wire [99:0] my_vector; // Declare a 100-bit vector

wire part, portion;

assign part = my_vector[10]; // Part-select the 11th bit of my_vector
assign portion = my_vector[9:0]; // Part-select the first 10 bits of my_vector


// Implicit Nets
// Implicit nets are one-bit wires that are assigned before they are declared.

wire [2:0] a, c;   // Two vectors
assign a = 3'b101;  // a = 101
assign b = a;       // b =   1  implicitly-created wire
assign c = b;       // c = 001  <-- bug

// Concatenation
// Concatenation needs to know the width of every component

// The concatenation operator can be used on both sides of the assignment operator.
input [15:0] in;
output [23:0] out;
assign {out[7:0], out[15:8]} = in; // Swap two bytes
assign out[15:0] = {in[7:0], in[15:8]}; // Does the same thing
assign out = {in[7:0], in[15:8]}; // 16-bit vector on the right is 0-extended to match the 24-bit vector on the left, so out[23:16] are zero

// Replication operator
// {num{vector}} replicates vector num times
Examples:
{5{1'b1}}           // 5'b11111 (or 5'd31 or 5'h1f)
{2{a,b,c}}          // The same as {a,b,c,a,b,c}
{3'd5, {2{3'd6}}}   // 9'b101_110_110. It's a concatenation of 101 with
                    // the second vector, which is two copies of 3'b110.
