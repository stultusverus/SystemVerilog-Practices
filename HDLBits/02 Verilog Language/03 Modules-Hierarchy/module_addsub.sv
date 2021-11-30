module top_module (
    input  [31:0] a,
    input  [31:0] b,
    input         sub,
    output [31:0] sum
);

    wire        carry;
    wire [31:0] bb;

    assign bb = sub ? ~b : b;

    add16 add16_i0 (.a(a[15:0]), .b(bb[15:0]), .cin(sub), .cout(carry), .sum(sum[15:0]));
    add16 add16_i1 (.a(a[31:16]), .b(bb[31:16]), .cin(carry), .cout(), .sum(sum[31:16]));

endmodule 

