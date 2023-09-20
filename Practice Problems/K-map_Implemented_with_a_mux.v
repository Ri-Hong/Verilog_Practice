// See problem at: https://hdlbits.01xz.net/wiki/Exams/ece241_2014_q3

module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 

    assign mux_in[0] = d | c;
    assign mux_in[1] = 0;
    assign mux_in[3] = c & d;
    assign mux_in[2] = ~d;

    
endmodule
