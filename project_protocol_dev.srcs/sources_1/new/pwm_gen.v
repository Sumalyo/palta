`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2023 06:06:28 PM
// Design Name: 
// Module Name: slow_clk_gen
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


module pwm_gen(
        input bit1,
        input bit2,
        input bit3,
        input bit4,
        input clk_in,
        output pwm_out
    );
    reg [3:0] input_reg;
    reg [23:0] counter=0;
    reg res_freq=0;
    
    always @(posedge clk_in )
    begin
    input_reg = {input_reg[2:0],bit4, bit3, bit2, bit1};
    end
    
    always @(posedge clk_in) 
    begin
    counter = counter + 1;
    if(counter == 240000)
    begin
    counter <= 0;
    end
    res_freq <= (counter < (input_reg * 2400 )) ? 1 : 0;
    end
    assign pwm_out = res_freq;

endmodule