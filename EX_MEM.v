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
    input [31:0] ALU,
    input [4:0] rd,
    input [4:0] rt,
    input [31:0] dato_B,
    input Mux_flag_2,
    input Mux_flag_3,
    input mem_flag_rd,
    input mem_flag_wr,
    input banco_flag_wr,

    output reg [31:0] ALU_out,
    output reg[4:0] rd_out,
    output reg [4:0] rt_out,
    output reg [31:0] dato_B_out,
    output reg Mux_flag_2_MEM,
    output reg Mux_flag_3_MEM,
    output reg mem_flag_rd_MEM,
    output reg mem_flag_wr_MEM,
    output reg banco_flag_wr_MEM
    );

    always@(negedge clk)
    begin
        case(EX_MEM_enable)
        1'b0:
            begin
            ALU_out <= ALU;
            rd_out <= rd;
            rt_out <= rt;
            dato_B_out <= dato_B;
            Mux_flag_2_MEM <= Mux_flag_2;
            Mux_flag_3_MEM <= Mux_flag_3;
            mem_flag_rd_MEM <= mem_flag_rd;
            mem_flag_wr_MEM <= mem_flag_wr;
            banco_flag_wr_MEM <= banco_flag_wr;
            end
        default:
            begin
            ALU_out <= 32'hZZZZZZZZ;
            rd_out <= 32'hZZZZZZZZ;
            rt_out <= 32'hZZZZZZZZ;
            dato_B_out <= 32'hZZZZZZZZ;
            Mux_flag_2_MEM <= 1'bz;
            Mux_flag_3_MEM <= 1'bz;
            mem_flag_rd_MEM <= 1'bz;
            mem_flag_wr_MEM <= 1'bz;
            banco_flag_wr_MEM <= 1'bz;
            end
        endcase
     end

endmodule
