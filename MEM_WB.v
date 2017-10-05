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


module MEM_WB(
    input clk,
    input MEM_WB_enable,
    input [31:0] dato_mem,
    input [31:0] ALU,
    input [4:0] rd,
    input [4:0] rt,
    input Mux_flag_2_M,
    input Mux_flag_3_M,
    input banco_flag_wr_M,

    output reg [31:0] dato_mem_out,
    output reg [4:0] rd_out,
    output reg [4:0] rt_out,
    output reg [31:0] ALU_out,
    output reg Mux_flag_2_MOUT,
    output reg Mux_flag_3_MOUT,
    output reg banco_flag_wr_MOUT
    );

    always@(posedge clk)
    begin
       case (MEM_WB_enable)

        1'b0:
          begin
              dato_mem_out <= dato_mem;
              rd_out <= rd;
              rt_out <= rt;
              ALU_out <= ALU;
              Mux_flag_2_MOUT <= Mux_flag_2_M;
              Mux_flag_3_MOUT <= Mux_flag_3_M;
              banco_flag_wr_MOUT <= banco_flag_wr_M;
          end

        default: begin
                 dato_mem_out <= 32'hZZZZZZZZ;
                 rd_out <= 32'hZZZZZZZZ;
                 rt_out <= 32'hZZZZZZZZ;
                 ALU_out <= 32'hZZZZZZZZ;
                 Mux_flag_2_MOUT <= 1'bz;
                 Mux_flag_3_MOUT <= 1'bz;
                 banco_flag_wr_MOUT <= 1'bz;
                 end
        endcase
    end
endmodule
