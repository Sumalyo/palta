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


module slow_clk_gen(
input clk_in,
output slw_clk
    );
reg [23:0] clk_counter = 0 ;
reg clk_reg = 0;
parameter pressure = 220000;
always @ (posedge clk_in)
begin
   clk_counter = clk_counter + 1;
    if(clk_counter == pressure)
    begin
    clk_counter <= 0;
    end
    clk_reg <= (clk_counter < (pressure / 2)  ) ? 1 : 0;
end


assign slw_clk = clk_reg;

endmodule
