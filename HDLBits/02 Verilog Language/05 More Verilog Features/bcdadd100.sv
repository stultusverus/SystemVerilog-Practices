module top_module (
    input  [399:0] a, b,
    input          cin,
    output         cout,
    output [399:0] sum
);

    wire [99:0] bcd_fadd_cout;

    assign cout = bcd_fadd_cout[99];

    genvar i;
    generate
        for (i=0;i<100;i++) begin: gen_bcd_fadd
            if (i==0) begin
                bcd_fadd bcd_fadd_i (
                    .a(a[i*4+:4]),
                    .b(b[i*4+:4]),
                    .cin(cin),
                    .cout(bcd_fadd_cout[i]),
                    .sum(sum[i*4+:4])
                );
            end else begin
                bcd_fadd bcd_fadd_i (
                    .a(a[i*4+:4]),
                    .b(b[i*4+:4]),
                    .cin(bcd_fadd_cout[i-1]),
                    .cout(bcd_fadd_cout[i]),
                    .sum(sum[i*4+:4])
                );
            end
        end // gen_bcd_fadd
    endgenerate

endmodule

