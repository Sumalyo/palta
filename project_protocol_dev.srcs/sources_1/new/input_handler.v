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
    //reg [3:0] data_store;
    reg  data_store_1 = 0;
    reg  data_store_2 = 0;
    reg  data_store_3 = 0;
    reg  data_store_4 = 0;
    always @ (posedge clk_in)
    begin
    if (data == 1)
    //data_store = {data_store[1],data_store[2],data_store[3],1'b1};
    begin
    data_store_1 <= data_store_2;
    data_store_2 <= data_store_3;
    data_store_3 <= data_store_4;
    data_store_4 <= 1'b1;
    end
    else
    begin
    data_store_1 <= data_store_2;
    data_store_2 <= data_store_3;
    data_store_3 <= data_store_4;
    data_store_4 <= 1'b0;
    end
    //data_store = {data_store[1],data_store[2],data_store[3],1'b0};
    //data_store = {data_store[2:0],data};
    //data_store[
//    data_store_1 <= data_store_2;
//    data_store_2 <= data_store_3;
//    data_store_3 <= data_store_4;
//    data_store_4 <= data;
    end
    assign d1 = data_store_1;
    assign d2 = data_store_2;
    assign d3 = data_store_3;
    assign d4 = data_store_4;
//    assign d1 = data_store[0];
//    assign d2 = data_store[1];
//    assign d3 = data_store[2];
//    assign d4 = data_store[3];
endmodule