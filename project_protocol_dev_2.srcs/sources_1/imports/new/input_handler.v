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
    input wire clk_in,
    input wire ctrl_in,
    output wire d1,
    output wire d2,
    output wire d3,
    output wire d4
    );
parameter buffer_len = 4;
reg [buffer_len-1:0] buffer_reg = 0;
reg [1:0] STATE = 2'b10;
reg [1:0] guard_bit_count = 2'b00;

localparam READING = 2'b01;
localparam IDLE = 2'b10;

always @ (negedge ctrl_in)
    begin
      case(STATE)
      READING:
            begin
                STATE <= IDLE;
                // guard_bit_count <= guard_bit_count - 1;
                // guard_bit_count <= 2'b00;
            end
      endcase
     end



always @ (posedge ctrl_in)
    begin
      case(STATE)
        IDLE:
            begin
                if (guard_bit_count == 0)
                    begin
                        STATE <= READING;
                    end
            end
        endcase
    end


//always @ (*)
//begin
//    if (guard_bit_count == 0)
//        begin
//            STATE <= IDLE;
//        end
//end

always @ (negedge data)
begin
    if (STATE==READING && guard_bit_count <= 2)
        begin
            guard_bit_count <= guard_bit_count + 1;
        end
    else if (STATE==IDLE && guard_bit_count > 0)
        begin
            guard_bit_count <= guard_bit_count - 1;
        end
end

always @ (posedge clk_in)
    begin
        if (STATE==READING)
            begin
                if (guard_bit_count > 2)
                buffer_reg <= {buffer_reg[buffer_len-2:0],data};
            end
    end


assign d1 = buffer_reg[0];
assign d2 = buffer_reg[1];
assign d3 = buffer_reg[2];
assign d4 = buffer_reg[3];
endmodule