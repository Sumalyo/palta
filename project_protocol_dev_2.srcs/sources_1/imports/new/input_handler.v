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
    input wire ctrl,
    input clk_in,
    input ctrl_in,
    output wire d1,
    output wire d2,
    output wire d3,
    output wire d4
    );

reg [3:0] buffer_reg = 4'b0000;
reg [1:0] STATE = 2'b10;
localparam READING = 2'b01;
localparam IDLE = 2'b10;

always @ (posedge ctrl_in or negedge ctrl_in)
    begin
      case(STATE)
        IDLE:
            begin
                STATE = READING;
            end
        READING:
            begin
                STATE = IDLE;
            end
        endcase
    end

always @ (*)
    begin
        if (STATE==READING)
            begin
                buffer_reg = {buffer_reg[2:0],data};
            end
    end


assign d1 = buffer_reg[0];
assign d2 = buffer_reg[1];
assign d3 = buffer_reg[2];
assign d4 = buffer_reg[3];
endmodule