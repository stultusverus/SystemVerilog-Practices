module top_module (
    input  [99:0] in,
    output [99:0] out
);

    genvar i;
    generate
        for (i = 0; i < 100; i++) begin: out_in
            assign out[i] = in[99-i];
        end // out_in
    endgenerate

endmodule
