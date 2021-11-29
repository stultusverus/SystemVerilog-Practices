`timescale 1ns / 1ps

module top (
    input        RST,
    input        SYS_CLK,
    output [0:3] LD
);

    parameter [31:0] LED_MIN_PERIOD = 32'd100_000_000 / 8;

    wire clk;         // 100 MHz
    wire reset = RST;

    logic [31:0] led_period_arr[8];

    logic [31:0] led_period;
    logic [31:0] clk_cnt;
    logic [ 3:0] led_out;
    logic [ 3:0] led_out_next;
    logic [ 2:0] vio_out;

    initial begin
        for (int i = 0; i < 8; i++)
            led_period_arr[i] = (8 - i) * LED_MIN_PERIOD;
    end

    for (genvar i = 0; i < 4; i++)
        assign LD[i] = led_out[3-i];

    assign led_period = led_period_arr[vio_out];

    clk_wiz_top clk_wiz_top_i (
        .reset  (RST    ),
        .sys_clk(SYS_CLK),
        .clk    (clk    )
    );

    vio_top vio_top_i (
        .clk       (clk       ),
        .probe_in0 (led_period),
        .probe_out0(vio_out   )
    );

    always_comb begin
        if (led_out == '0)
            led_out_next = 4'b0001;
        else if (led_out == 4'b0001)
            led_out_next = 4'b1000;
        else
            led_out_next = led_out >> 1;
    end

    always_ff @(posedge clk) begin
        if (reset) begin
            clk_cnt <= '0;
            led_out <= '0;
        end else begin
            if (clk_cnt >= led_period) begin
                clk_cnt <= '0;
                led_out <= led_out_next;
            end else begin
                clk_cnt <= clk_cnt + 'd1;
            end
        end
    end

endmodule
