module top_module (
    input  clk,
    input  d,
    output q
);

    wire [2:0] dd;
    wire [2:0] qq;

    assign dd[2] = d;
    assign dd[1] = qq[2];
    assign dd[0] = qq[1];

    assign q = qq[0];

    my_dff my_dff_i[3]( .clk(clk), .d(dd), .q(qq));

endmodule

