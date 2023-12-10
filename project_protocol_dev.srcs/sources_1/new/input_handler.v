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


module input_handler(
    input wire data,
    input clk_in,
    output wire d1,
    output wire d2,
    output wire d3,
    output wire d4
    );
    reg [3:0] data_store;
    always @ (posedge clk_in)
    begin
    data_store = {data_store[2:0],data};
    end
    assign d1 = data_store[0];
    assign d2 = data_store[1];
    assign d3 = data_store[2];
    assign d4 = data_store[3];
endmodule