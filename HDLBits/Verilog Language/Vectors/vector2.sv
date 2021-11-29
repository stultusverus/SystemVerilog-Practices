module top_module (
    input  [31:0] in,
    output [31:0] out
);

    genvar i;
    generate
        for (i = 0; i < 4; i++) begin: out_in
            assign out[i*8+:8] = in[(3-i)*8+:8];
        end
    endgenerate

endmodule
