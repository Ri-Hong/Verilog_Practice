// 3 types of assignments

// 1. assign
// Used in continous assignments. Used to assign values to wires
// Example:
assign out = in1 & in2;

// 2. = (Blocking assignment)
// Used in always blocks. 
// They are called blocking assignments because it must complete before the code moves on
// Used for combinational logic

// Example:
always @(*) begin
  y = a & b;
  z = y | a;
end

// 3. <= (Non-blocking assignment)
// Used in always blocks. 
// These do no block the next statement from executing.
// Mainly used for sequential logic

// Example:
always @(posedge clk) begin
  q <= d;
end

