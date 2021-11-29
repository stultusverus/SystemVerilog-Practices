module top_module (
    input  a,
    input  b,
    output out
);

    always_comb out = ~(a | b);

endmodule
