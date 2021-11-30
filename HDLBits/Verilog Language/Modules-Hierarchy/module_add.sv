module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);

    wire carry;

    add16 add16_i0 (.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .cout(carry), .sum(sum[15:0]));
    add16 add16_i1 (.a(a[31:16]), .b(b[31:16]), .cin(carry), .cout(), .sum(sum[31:16]));

endmodule

