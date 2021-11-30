module top_module (
    input        clk,
    input  [7:0] d,
    input  [1:0] sel,
    output [7:0] q
);

    wire [7:0] dd[3];
    wire [7:0] qq[3];

    assign dd[2] = d;
    assign dd[1] = qq[2];
    assign dd[0] = qq[1];

    always_comb begin
        unique case (sel)
            2'b00 : q = d;
            2'b01 : q = qq[2];
            2'b10 : q = qq[1];
            2'b11 : q = qq[0];
        endcase // sel
    end

    my_dff8 my_dff8_i[3]( .clk(clk), .d(dd), .q(qq));

endmodule

