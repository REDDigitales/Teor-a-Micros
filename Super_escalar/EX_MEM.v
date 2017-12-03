`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 09/25/2017 07:34:16 PM
// Design Name:
// Module Name: ID_EX
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


module EX_MEM(
    input clk,
    input EX_MEM_enable,
    input MEM_WB_enable,
////////////////////////////////////////////////
    input [31:0] ALU_1,
    input [4:0] rd_1,
    input [4:0] rt_1,
    input [31:0] dato_B_1,
    input Mux_2_flag_1,
    input Mux_3_flag_1,
    input mem_flag_rd_1,
    input mem_flag_wr_1,
    input banco_flag_wr_1,

    output reg [31:0] ALU_out_1,
    output reg [4:0] rd_out_1,
    output reg [4:0] rt_out_1,
    output reg [31:0] dato_B_out_1,
    output reg Mux_2_flag_MEM_1,
    output reg Mux_3_flag_MEM_1,
    output reg mem_flag_rd_MEM_1,
    output reg mem_flag_wr_MEM_1,
    output reg banco_flag_wr_MEM_1,
////////////////////////////////////////////////
    input [31:0] ALU_2,
    input [4:0] rd_2,
    input [4:0] rt_2,
    input [31:0] dato_B_2,
    input Mux_2_flag_2,
    input Mux_3_flag_2,
    input mem_flag_rd_2,
    input mem_flag_wr_2,
    input banco_flag_wr_2,

    output reg [31:0] ALU_out_2,
    output reg [4:0] rd_out_2,
    output reg [4:0] rt_out_2,
    output reg [31:0] dato_B_out_2,
    output reg Mux_2_flag_MEM_2,
    output reg Mux_3_flag_MEM_2,
    output reg mem_flag_rd_MEM_2,
    output reg mem_flag_wr_MEM_2,
    output reg banco_flag_wr_MEM_2,
////////////////////////////////////////////////
    output reg MEM_WB_enable_out
    );

    always@(posedge clk)
    begin
        case(EX_MEM_enable)
        1'b0:
            begin
            ALU_out_1 <= ALU_1;
            rd_out_1 <= rd_1;
            rt_out_1 <= rt_1;
            dato_B_out_1 <= dato_B_1;
            Mux_2_flag_MEM_1 <= Mux_2_flag_1;
            Mux_3_flag_MEM_1 <= Mux_3_flag_1;
            mem_flag_rd_MEM_1 <= mem_flag_rd_1;
            mem_flag_wr_MEM_1 <= mem_flag_wr_1;
            banco_flag_wr_MEM_1 <= banco_flag_wr_1;
///////////////////////////////////////////////////////////////
            ALU_out_2 <= ALU_2;
            rd_out_2 <= rd_2;
            rt_out_2 <= rt_2;
            dato_B_out_2 <= dato_B_2;
            Mux_2_flag_MEM_2 <= Mux_2_flag_2;
            Mux_3_flag_MEM_2 <= Mux_3_flag_2;
            mem_flag_rd_MEM_2 <= mem_flag_rd_2;
            mem_flag_wr_MEM_2 <= mem_flag_wr_2;
            banco_flag_wr_MEM_2 <= banco_flag_wr_2;
///////////////////////////////////////////////////////////////
            MEM_WB_enable_out <= MEM_WB_enable;
            end
        default:
            begin
            ALU_out_1 <= 32'hZZZZZZZZ;
            rd_out_1 <= 32'hZZZZZZZZ;
            rt_out_1 <= 32'hZZZZZZZZ;
            dato_B_out_1 <= 32'hZZZZZZZZ;
            Mux_2_flag_MEM_1 <= 1'bz;
            Mux_3_flag_MEM_1 <= 1'bz;
            mem_flag_rd_MEM_1 <= 1'bz;
            mem_flag_wr_MEM_1 <= 1'bz;
            banco_flag_wr_MEM_1 <= 1'bz;
///////////////////////////////////////////////////////////////
            ALU_out_2 <= 32'hZZZZZZZZ;
            rd_out_2 <= 32'hZZZZZZZZ;
            rt_out_2 <= 32'hZZZZZZZZ;
            dato_B_out_2 <= 32'hZZZZZZZZ;
            Mux_2_flag_MEM_2 <= 1'bz;
            Mux_3_flag_MEM_2 <= 1'bz;
            mem_flag_rd_MEM_2 <= 1'bz;
            mem_flag_wr_MEM_2 <= 1'bz;
            banco_flag_wr_MEM_2 <= 1'bz;
///////////////////////////////////////////////////////////////
            MEM_WB_enable_out <= 1'bz;
            end
        endcase
     end

endmodule
