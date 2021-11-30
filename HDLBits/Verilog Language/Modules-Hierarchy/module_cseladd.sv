module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);

    wire        carry;
    wire [15:0] sum_tmp[2];

    assign sum[31:16] = sum_tmp[carry];

    add16 add16_i0 (.a(a[15:0]), .b(b[15:0]), .cin(1'b0), .cout(carry), .sum(sum[15:0]));
    add16 add16_i1 (.a(a[31:16]), .b(b[31:16]), .cin(1'b0), .cout(), .sum(sum_tmp[0]));
    add16 add16_i2 (.a(a[31:16]), .b(b[31:16]), .cin(1'b1), .cout(), .sum(sum_tmp[1]));

endmodule

