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