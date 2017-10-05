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
    input [31:0] dato_A,
    input [31:0] dato_B,
    input [4:0] shampt,
    input [4:0] rd,
    input [4:0] rt,
    input [31:0] SignExtImm,

    input [3:0] alu_function,
    input [1:0] Mux_1_flag,
    input Mux_2_flag,
    input Mux_3_flag,
    input flag_mem_rd,
    input flag_mem_wr,
    input flag_banco_wr,

    output reg EX_MEM_enable_out,
    output reg MEM_WB_enable_out,
    output reg [31:0] dato_A_out,
    output reg [31:0] dato_B_out,
    output reg [4:0] shampt_out,
    output reg [4:0] rd_out,
    output reg [4:0] rt_out,
    output reg [31:0] SignExtImm_out,

    output reg [3:0] alu_function_out,
    output reg [1:0] Mux_1_flag_out,
    output reg Mux_2_flag_out,
    output reg Mux_3_flag_out,
    output reg flag_mem_wr_out,
    output reg flag_mem_rd_out,
    output reg flag_banco_wr_out

    );

     always@(posedge clk)
     begin
        case(ID_EX_enable)

        1'b0:
        begin
        dato_A_out <= dato_A;
        dato_B_out <= dato_B;
        shampt_out <= shampt;
        rd_out <= rd;
        rt_out <= rt;
        SignExtImm_out <= SignExtImm;
        alu_function_out <= alu_function;
        Mux_1_flag_out <= Mux_1_flag;
        Mux_2_flag_out <= Mux_2_flag;
        Mux_3_flag_out <= Mux_3_flag;
        flag_mem_wr_out <= flag_mem_wr;
        flag_mem_rd_out <= flag_mem_rd;
        flag_banco_wr_out <= flag_banco_wr;
        EX_MEM_enable_out <= EX_MEM_enable;
        MEM_WB_enable_out <= MEM_WB_enable;
        end

        default:
        begin
        dato_A_out <= 32'hZZZZZZZZ;
        dato_B_out <= 32'hZZZZZZZZ;
        shampt_out <=  32'hZZZZZZZZ;
        rd_out <= 32'hZZZZZZZZ;
        rt_out <= 32'hZZZZZZZZ;
        SignExtImm_out <= 32'hZZZZZZZZ;
        alu_function_out <= 4'hz;;
        Mux_1_flag_out <= 1'bz;
        Mux_2_flag_out <= 1'bz;
        Mux_3_flag_out <= 1'bz;
        flag_mem_wr_out <= 1'bz;
        flag_banco_wr_out <= 1'bz;
        EX_MEM_enable_out <= 1'bz;
        MEM_WB_enable_out <= 1'bz;
        end

        endcase
     end
endmodule
