module top_module (
    input  [254:0] in,
    output [  7:0] out
);

    bit [7:0] cnt;
    always @* begin
        cnt = 0;
        for (int i=0; i < 255; i++)
            if (in[i]) cnt++;
        out = cnt;
    end

endmodule

