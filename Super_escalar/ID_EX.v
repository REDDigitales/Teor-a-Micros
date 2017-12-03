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


module ID_EX(
    input clk,
    input ID_EX_enable,
    input EX_MEM_enable,
    input MEM_WB_enable,
    output reg EX_MEM_enable_out,
    output reg MEM_WB_enable_out,
/////////////////////////////////////////////////

    input [31:0] dato_A_1,
    input [31:0] dato_B_1,
    input [4:0] shampt_1,
    input [4:0] rd_1,
    input [4:0] rt_1,
    input [31:0] SignExtImm_1,

    input [3:0] alu_function_1,
    input [1:0] Mux_1_flag_1,
    input Mux_2_flag_1,
    input Mux_3_flag_1,
    input flag_mem_rd_1,
    input flag_mem_wr_1,
    input flag_banco_wr_1,

    output reg [31:0] dato_A_out_1,
    output reg [31:0] dato_B_out_1,
    output reg [4:0] shampt_out_1,
    output reg [4:0] rd_out_1,
    output reg [4:0] rt_out_1,
    output reg [31:0] SignExtImm_out_1,

    output reg [3:0] alu_function_out_1,
    output reg [1:0] Mux_1_flag_out_1,
    output reg Mux_2_flag_out_1,
    output reg Mux_3_flag_out_1,
    output reg flag_mem_wr_out_1,
    output reg flag_mem_rd_out_1,
    output reg flag_banco_wr_out_1,
///////////////////////////////////////////////////////////
    input [31:0] dato_A_2,
    input [31:0] dato_B_2,
    input [4:0] shampt_2,
    input [4:0] rd_2,
    input [4:0] rt_2,
    input [31:0] SignExtImm_2,

    input [3:0] alu_function_2,
    input [1:0] Mux_1_flag_2,
    input Mux_2_flag_2,
    input Mux_3_flag_2,
    input flag_mem_rd_2,
    input flag_mem_wr_2,
    input flag_banco_wr_2,

    output reg [31:0] dato_A_out_2,
    output reg [31:0] dato_B_out_2,
    output reg [4:0] shampt_out_2,
    output reg [4:0] rd_out_2,
    output reg [4:0] rt_out_2,
    output reg [31:0] SignExtImm_out_2,

    output reg [3:0] alu_function_out_2,
    output reg [1:0] Mux_1_flag_out_2,
    output reg Mux_2_flag_out_2,
    output reg Mux_3_flag_out_2,
    output reg flag_mem_wr_out_2,
    output reg flag_mem_rd_out_2,
    output reg flag_banco_wr_out_2
    );

     always@(posedge clk)
     begin
        case(ID_EX_enable)

        1'b0:
        begin
        dato_A_out_1 <= dato_A_1;
        dato_B_out_1 <= dato_B_1;
        shampt_out_1 <= shampt_1;
        rd_out_1 <= rd_1;
        rt_out_1 <= rt_1;
        SignExtImm_out_1 <= SignExtImm_1;
        alu_function_out_1 <= alu_function_1;
        Mux_1_flag_out_1 <= Mux_1_flag_1;
        Mux_2_flag_out_1 <= Mux_2_flag_1;
        Mux_3_flag_out_1 <= Mux_3_flag_1;
        flag_mem_wr_out_1 <= flag_mem_wr_1;
        flag_mem_rd_out_1 <= flag_mem_rd_1;
        flag_banco_wr_out_1 <= flag_banco_wr_1;
////////////////////////////////////////////////////////
        dato_A_out_2 <= dato_A_2;
        dato_B_out_2 <= dato_B_2;
        shampt_out_2 <= shampt_2;
        rd_out_2 <= rd_2;
        rt_out_2 <= rt_2;
        SignExtImm_out_2 <= SignExtImm_2;
        alu_function_out_2 <= alu_function_2;
        Mux_1_flag_out_2 <= Mux_1_flag_2;
        Mux_2_flag_out_2 <= Mux_2_flag_2;
        Mux_3_flag_out_2 <= Mux_3_flag_2;
        flag_mem_wr_out_2 <= flag_mem_wr_2;
        flag_mem_rd_out_2 <= flag_mem_rd_2;
        flag_banco_wr_out_2 <= flag_banco_wr_2;
///////////////////////////////////////////////////////
        EX_MEM_enable_out <= EX_MEM_enable;
        MEM_WB_enable_out <= MEM_WB_enable;
        end

        default:
        begin
        dato_A_out_1 <= 32'hZZZZZZZZ;
        dato_B_out_1 <= 32'hZZZZZZZZ;
        shampt_out_1 <=  32'hZZZZZZZZ;
        rd_out_1 <= 32'hZZZZZZZZ;
        rt_out_1 <= 32'hZZZZZZZZ;
        SignExtImm_out_1 <= 32'hZZZZZZZZ;
        alu_function_out_1 <= 4'hz;;
        Mux_1_flag_out_1 <= 1'bz;
        Mux_2_flag_out_1 <= 1'bz;
        Mux_3_flag_out_1 <= 1'bz;
        flag_mem_wr_out_1 <= 1'bz;
        flag_banco_wr_out_1 <= 1'bz;
//////////////////////////////////////////////////
        dato_A_out_2 <= 32'hZZZZZZZZ;
        dato_B_out_2 <= 32'hZZZZZZZZ;
        shampt_out_2 <=  32'hZZZZZZZZ;
        rd_out_2 <= 32'hZZZZZZZZ;
        rt_out_2 <= 32'hZZZZZZZZ;
        SignExtImm_out_2 <= 32'hZZZZZZZZ;
        alu_function_out_2 <= 4'hz;;
        Mux_1_flag_out_2 <= 1'bz;
        Mux_2_flag_out_2 <= 1'bz;
        Mux_3_flag_out_2 <= 1'bz;
        flag_mem_wr_out_2 <= 1'bz;
        flag_banco_wr_out_2 <= 1'bz;
///////////////////////////////////////////////////
        EX_MEM_enable_out <= 1'bz;
        MEM_WB_enable_out <= 1'bz;
        end

        endcase
     end
endmodule
