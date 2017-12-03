`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 11:28:02 PM
// Design Name: 
// Module Name: MEM_WB
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
    //////////////////////////////////////////////////////////
    input [31:0] dato_mem_1,
    input [31:0] ALU_1,
    input [4:0] rd_1,
    input [4:0] rt_1,
    input Mux_flag_2_M_1,
    input Mux_flag_3_M_1,
    input banco_flag_wr_M_1,

    output reg [31:0] dato_mem_out_1,
    output reg [4:0] rd_out_1,
    output reg [4:0] rt_out_1,
    output reg [31:0] ALU_out_1,
    output reg Mux_flag_2_MOUT_1,
    output reg Mux_flag_3_MOUT_1,
    output reg banco_flag_wr_MOUT_1,
    ////////////////////////////////////////////////////////////
    input [31:0] dato_mem_2,
    input [31:0] ALU_2,
    input [4:0] rd_2,
    input [4:0] rt_2,
    input Mux_flag_2_M_2,
    input Mux_flag_3_M_2,
    input banco_flag_wr_M_2,

    output reg [31:0] dato_mem_out_2,
    output reg [4:0] rd_out_2,
    output reg [4:0] rt_out_2,
    output reg [31:0] ALU_out_2,
    output reg Mux_flag_2_MOUT_2,
    output reg Mux_flag_3_MOUT_2,
    output reg banco_flag_wr_MOUT_2
    );

    always@(posedge clk)
    begin
       case (MEM_WB_enable)

        1'b0:
          begin
              dato_mem_out_1 <= dato_mem_1;
              rd_out_1 <= rd_1;
              rt_out_1 <= rt_1;
              ALU_out_1 <= ALU_1;
              Mux_flag_2_MOUT_1 <= Mux_flag_2_M_1;
              Mux_flag_3_MOUT_1 <= Mux_flag_3_M_1;
              banco_flag_wr_MOUT_1 <= banco_flag_wr_M_1;
              //////////////////////////////////////////////
              dato_mem_out_2 <= dato_mem_2;
              rd_out_2 <= rd_2;
              rt_out_2 <= rt_2;
              ALU_out_2 <= ALU_2;
              Mux_flag_2_MOUT_2 <= Mux_flag_2_M_2;
              Mux_flag_3_MOUT_2 <= Mux_flag_3_M_2;
              banco_flag_wr_MOUT_2 <= banco_flag_wr_M_2;
          end

        default: begin
                 dato_mem_out_1 <= 32'hZZZZZZZZ;
                 rd_out_1 <= 32'hZZZZZZZZ;
                 rt_out_1 <= 32'hZZZZZZZZ;
                 ALU_out_1 <= 32'hZZZZZZZZ;
                 Mux_flag_2_MOUT_1 <= 1'bz;
                 Mux_flag_3_MOUT_1 <= 1'bz;
                 banco_flag_wr_MOUT_1 <= 1'bz;
                 /////////////////////////////////////////
                  dato_mem_out_2 <= 32'hZZZZZZZZ;
                  rd_out_2 <= 32'hZZZZZZZZ;
                  rt_out_2 <= 32'hZZZZZZZZ;
                  ALU_out_2 <= 32'hZZZZZZZZ;
                  Mux_flag_2_MOUT_2 <= 1'bz;
                  Mux_flag_3_MOUT_2 <= 1'bz;
                  banco_flag_wr_MOUT_2 <= 1'bz;
                 end
        endcase
    end
endmodule