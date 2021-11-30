module top_module (
    input  [99:0] a, b,
    input         cin,
    output [99:0] cout,
    output [99:0] sum
);

    wire [99:0] add1_cin;

    genvar i;
    generate
        for (i = 0; i < 100; i++) begin: assign_add1_cin
            assign add1_cin[i] = i==0?cin:cout[i-1];
        end // assign_add1_cin
    endgenerate

    add1 add1_i[100] (.a(a), .b(b), .cin(add1_cin), .cout(cout), .sum(sum));

endmodule


module add1 (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

    assign sum  = a^b^cin;
    assign cout = a & b | a & cin | b & cin;

endmodule
