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
    output wire d1,
    output wire d2,
    output wire d3,
    output wire d4
    );

    // parameter BUFFER_BIT = 5'b01110;
    
    // parameter IDLE_STATE = 4'b0000;
    // parameter READY_STATE = 4'b0001;
    // parameter WRITING_STATE = 4'b0010;
    // reg [3:0] state = 4'b0000;
    // reg [4:0] buffer = 5'b00000;
    //reg [3:0] data_store;
    // reg  data_store_1 = 0;
    // reg  data_store_2 = 0;
    // reg  data_store_3 = 0;
    // reg  data_store_4 = 0;
//    always @ (posedge clk_in)
//    begin
//    if (data == 1)
//    //data_store = {data_store[1],data_store[2],data_store[3],1'b1};
//    begin
//    data_store_1 <= data_store_2;
//    data_store_2 <= data_store_3;
//    data_store_3 <= data_store_4;
//    data_store_4 <= 1'b1;
//    end
//    else
//    begin
//    data_store_1 <= data_store_2;
//    data_store_2 <= data_store_3;
//    data_store_3 <= data_store_4;
//    data_store_4 <= 1'b0;
//    end
//    //data_store = {data_store[1],data_store[2],data_store[3],1'b0};
//    //data_store = {data_store[2:0],data};
//    //data_store[
////    data_store_1 <= data_store_2;
////    data_store_2 <= data_store_3;
////    data_store_3 <= data_store_4;
////    data_store_4 <= data;
//    end
    // always @ (posedge clk_in)
    //     begin
    //     buffer = {buffer[3:0],data};
        
    //     end
    // always @ (posedge clk_in)
    //     begin
    //     case (buffer)
    //     BUFFER_BIT:
    //     begin
    //     state <= READY_STATE;
    //     end
    //     endcase
    // end
    // always @ (*)
    // begin
    // if (state == WRITING_STATE)
    // data_store_1 <= buffer[0];
    // data_store_2 <= buffer[1];
    // data_store_3 <= buffer[3];
    // data_store_4 <= buffer[4];
    // end
    // assign d1 = data_store_1;
    // assign d2 = data_store_2;
    // assign d3 = data_store_3;
    // assign d4 = data_store_4;
//    assign d1 = data_store[0];
//    assign d2 = data_store[1];
//    assign d3 = data_store[2];
//    assign d4 = data_store[3];
// parameter SPLIT_BIT = 4'b0110;

// parameter IDLE = 0;
// parameter RUNNING = 0;
// parameter COUNT_BIT_MIN = 4;


// reg STATE = IDLE; // idle
// reg [3:0] buffer_reg = 4'b000;
// reg [3:0] output_reg = 4'b000;
// reg [5:0] count_bit_reg = 0;


// always @ (posedge clk_in)
//     begin
//     buffer_reg = {buffer_reg[2:0],data};
//     end


// always @ (posedge clk_in)
//     begin

//             case(STATE)
//                 IDLE:
//                     begin
//                         if (buffer_reg == SPLIT_BIT)
//                             begin
//                             STATE <= RUNNING;
//                             count_bit_reg <= 6'b000000;
//                             end
//                     end
//                 RUNNING:
//                     begin
//                     if (count_bit_reg <= COUNT_BIT_MIN && buffer_reg == SPLIT_BIT) begin
//                     STATE <= IDLE;
//                     end
//                     end
//                 default:
//                     begin
//                     STATE <= IDLE;
//                     end
//             endcase
        
//     end

// always @ (*)
//     begin
//         if (STATE == RUNNING) begin
//             output_reg = {output_reg[2:0],data};
//             count_bit_reg = count_bit_reg + 1;
//         end
//    end

assign d1 = buffer_reg[0];
assign d2 = buffer_reg[1];
assign d3 = buffer_reg[2];
assign d4 = buffer_reg[3];
endmodule