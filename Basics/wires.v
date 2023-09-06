// Wire basics

// Wires are directional
// Use assign to do a "continuous assignment"
// In a continuous assignment, the RHS is evaluated whenever the LHS changes

module top_module( input in, output out );
    assign out = in;
endmodule

// Declaring wires
// Wires are kinda like variables
// Declared with wire keyword

module next_module (
    input in,              // Declare an input wire named "in"
    output out             // Declare an output wire named "out"
);

    wire not_in;           // Declare a wire named "not_in"

    assign out = ~not_in;  // Assign a value to out (create a NOT gate).
    assign not_in = ~in;   // Assign a value to not_in (create another NOT gate).

endmodule   // End of module "top_module"