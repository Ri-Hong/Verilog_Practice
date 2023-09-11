// Two types of always blocks:
// - Combinational: always @(*)
// equivalent to assign statements
// will recompute whenever any of the signals on the RHS change
// * denotes the sensitivity list. Should always use * to avoid accidently leaving out signals
// Note, the LHS off an assign statement must be a net type (wire), while the LHS of an always block must be a register (reg)


// - Sequential: always @(posedge clk)
// creates a set of flip-flops (or "registers") at the output of the blob of comb. logic. This causes the outputs only being visible only after the next (posedgs clk).

// Types of assignments
// 1. Continuous assignment (assign x = y;) Can only be use outside of a procedure (always blocks)
// 2. Procedural blocking assignments (x = y;) Can only be used inside a procedure
// 3. Procedural non-blocking assignments (x <= y;) Can only be used inside a procedure
// In a combinational always block, using blocking assignments. (x = y;)
// In a clocked/sequential always block, using non-blocking assignments. (x <= y;)

// Always if
// creates a 2-to-1 mux
always @(*) begin
    if (condition) begin
        out = x;
    end
    else begin
        out = y;
    end
end

// which is equivalent to
assign out = (condition) ? x : y;

// Note, similar to C/C++, if you only have one statment in an if/else clause, you can omit the begin/end

// Always If Best Practices
// When designing circuits, think first in terms of circits
// What happens in cases other that those you specified?
// Verilog keeps the outputs unchanged, but in order to do this, a latch will be inferred (which is bad)
// Thus it is good practice to specify an else clause or default value assigned to outputs 

// Always Case
always @(*) begin     // This is a combinational circuit
    case (in)
      1'b1: begin 
               out = 1'b1;  // begin-end if >1 statement
            end
      1'b0: out = 1'b0;
      default: out = 1'bx;
    endcase
end


// Always casez
// Use z to denote "don't care" bits
always @(*) begin
    casez (in[3:0])
        4'bzzz1: out = 0;   // in[3:1] can be anything
        4'bzz1z: out = 1;
        4'bz1zz: out = 2;
        4'b1zzz: out = 3;
        default: out = 0;
    endcase
end


// Avoiding latches
// Sometimes, if we have many wires such that many of them remian unchanged, it is not enough just to use default
// For example, Suppose we have a decoder with one-hot outputs. That is, given 1, out_1 signal will be high but out_0, out_2, and out_3 signals will be low. To ensure that the out_0, out_2, and out_3 are low, we can assign them before our case statment. For example:
module top_module (
    input [2:0] in,
    output reg out_0,
    output reg out_1,
    output reg out_2,
    output reg out_3
);

    always @(*) begin
        out_0 = 0;
        out_1 = 0;
        out_2 = 0;
        out_3 = 0;
        case (in)
            3'b001: out_0 = 1'b1;
            3'b010: out_1 = 1'b1;
            3'b011: out_2 = 1'b1;
            3'b100: out_3 = 1'b1;
        endcase
    end
)