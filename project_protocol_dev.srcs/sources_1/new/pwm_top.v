`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2023 05:50:17 PM
// Design Name: 
// Module Name: pwm_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pwm_top(
        input wire pio1,
        input clk,
        output wire pio2
    );
    wire slow_clock;
    slow_clk_gen clockMod(
    .clk_in(clk),
    .slw_clk(slow_clock)
    );
    wire d1,d2,d3,d4;
    input_handler input_mod(
    .data(pio1),
    .clk_in(slow_clock),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .d4(d4)
    );
    
    pwm_gen pwm_mod(
    .bit1(d1),
    .bit2(d2),
    .bit3(d3),
    .bit4(d4),
    .clk_in(clk),
    .pwm_out(pio2)
    );
endmodule
