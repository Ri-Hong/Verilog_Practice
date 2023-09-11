// A module is a circuit that interacts with its outside through input and output ports.
// Kinda like a function in python

module mod_a ( input in1, input in2, output out );
    // Module body
endmodule

// Two ways to connect signals to module ports:
// 1. By position
mod_a instance1 ( wa, wb, wc );
// First port (in1) is wa, second port (in2) is wb, third port (out) is wc
// Pros: easy to write
// Cons: if the module's port list changes, all instantiations of the module must be updated 

// 2. By name
mod_a instance2 ( .in2(wb), .out(wc), .in1(wa) );
// Pros: if the module's port list changes, the instantiation is still valid
// Cons: more typing

// Warning: wire and module instance names must be unique
