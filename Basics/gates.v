// Note: since the input signals are 1 bit, we can use either the bitwise or logical operators in the following examples.

// NOT gate
// ~ for bitwise NOT
// ~ for logical NOT

module not_module( input in, output out );
    assign out = ~in; // Inverts the input signal
endmodule

// AND gate
// & for bitwise NOT
// && for logical NOT

module and_module( input a, input b, output out );
    assign out = a & b; // out is the result of a AND b
endmodule

// OR gate
// | for bitwise OR
// || for logical OR

module or_module( input a, input b, output out );
    assign out = a | b; // out is the result of a OR b
endmodule

// XOR gate
// ^ for bitwise XOR
// no logical XOR operator

module xor_module( input a, input b, output out );
    assign out = a ^ b; // out is the result of a XOR b
endmodule

// Bitwise vs. Logical Operators
// A bitwise operation between two N-bit vectors results in an N-bit vector.
// The ith bit of the result is the operation between the ith bit of the first vector and the ith bit of the second vector.
// A logical operation between two N-bit vectors results in a 1-bit vector.
// The logical operation treates en entire vector as a single boolean value (true = non-zero, false = 0).

