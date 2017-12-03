banco_wr_2`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 09/25/2017 10:47:02 PM
// Design Name:
// Module Name: Control
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


module Control(
   input clk,
   input [5:0] OpCode_1,
   output reg Sel_pc_mux_1, Sel_pc_reg_1, Mux_2_1, Mux_3_1,
   Mem_inst_rd_1, Mem_RD_1, Mem_WR_1, banco_rd_1, banco_wr_1,
   output reg [1:0] Mux_1_1,
   output reg [3:0] Sel_Alu_1,
   ///////////////////////////////////////////////////////////////
   input [5:0] OpCode_2,
   output reg Sel_pc_mux_2, Sel_pc_reg_2, Mux_2_2, Mux_3_2,
   Mem_inst_rd_2, Mem_RD_2, Mem_WR_2, banco_rd_2, banco_wr_2,
   output reg [1:0] Mux_1_2,
   output reg [3:0] Sel_Alu_2,
   ///////////////////////////////////////////////////////////////
   output reg if_id_enable, id_exe_enable, exe_mem_enable, mem_wr_enable
   );

initial begin
   Sel_pc_mux_1 = 0;
   Sel_pc_reg_1 = 0;
   Mux_1_1 = 0;
   Mux_2_1 = 1;
   Mux_3_1 = 0;
   Mem_inst_rd_1 = 0;
   Mem_RD_1 = 0;
   Mem_WR_1 = 0;
   banco_rd_1 = 1;
   banco_wr_1 = 1;
/////////////////////////////////////////
    Sel_pc_mux_2 = 0;
    Sel_pc_reg_2 = 0;
    Mux_1_2 = 0;
    Mux_2_2 = 1;
    Mux_3_2 = 0;
    Mem_inst_rd_2 = 0;
    Mem_RD_2 = 0;
    Mem_WR_2 = 0;
    banco_rd_2 = 1;
    banco_wr_2 = 1;
////////////////////////////////////////
   if_id_enable = 0;
   id_exe_enable = 1;
   exe_mem_enable = 1;
   mem_wr_enable = 1;
   Sel_Alu = 4'h0;
end

always @(*)
begin

   case(OpCode_1)
       6'h20:                                //opcode de un add
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 0;                        //selecion de mux de entrada para el dato B de la alu y el shamp
           Mux_2_1 = 1;                        //selecion de mux dato de la memoria 0 o operacion 1
           Mux_3_1 = 0;                        //selecion de mux de direccion de rd 0 o rt 1
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 0;
           banco_wr_1 = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'h0;
       end
       6'h08:                                //opcode de un addi
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 1;
           Mux_2_1 = 1;
           Mux_3_1 = 1;
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 0;
           banco_wr_1 = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'h0;
       end
       6'h24:                                //opcode de un and
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 0;
           Mux_2_1 = 1;
           Mux_3_1 = 0;
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 0;
           banco_wr_1 = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'h8;
       end
       6'h0c:                                //opcode de un andi
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 1;
           Mux_2_1 = 1;
           Mux_3_1 = 1;
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 0;
           banco_wr_1 = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'h8;
       end
       6'h02:                                //opcode de un j
       begin                                 //Se usa un opcode de 3 porque se repite para el slr
           Sel_pc_mux_1 = 1;                   //usando el de 0x3 no habra errores
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 0;
           Mux_2_1 = 1;
           Mux_3_1 = 0;
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 1;
           banco_wr_1 = 1;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'h4;
       end

       6'h23:                                //opcode de un lw
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 1;
           Mux_2_1 = 0;
           Mux_3_1 = 1;
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 0;
           Mem_WR_1 = 1;
           banco_rd_1 = 0;
           banco_wr_1 = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'h0;
       end
       6'h27:                                //opcode de un nor
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 0;
           Mux_2_1 = 1;
           Mux_3_1 = 0;
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 0;
           banco_wr_1 = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'hd;
       end
       6'h25:                                //opcode de un or
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 0;
           Mux_2_1 = 1;
           Mux_3_1 = 0;
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 0;
           banco_wr_1 = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'h9;
       end
       6'h0d:                                //opcode de un ori
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 1;
           Mux_2_1 = 1;
           Mux_3_1 = 1;
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 0;
           banco_wr_1 = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'h9;
       end
       6'h00:                                //opcode de un sll
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 2'h2;
           Mux_2_1 = 1;
           Mux_3_1 = 0;
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 0;
           banco_wr_1 = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'h2;
       end
       6'h03:                                //opcode de un slr
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 2'h2;
           Mux_2_1 = 1;
           Mux_3_1 = 0;
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 0;
           banco_wr_1 = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'h3;
       end
       6'h22:                                //opcode de un sub
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 0;
           Mux_2_1 = 1;
           Mux_3_1 = 0;
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 0;
           banco_wr_1 = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'h1;
       end
       6'h0e:                                     //nop
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 0;
           Mux_2_1 = 0;
           Mux_3_1 = 0;
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 1;
           banco_wr_1 = 1;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'h5;
       end
       6'h29:                                     //subu
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 0;
           Mux_2_1 = 1;
           Mux_3_1 = 0;
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 0;
           banco_wr_1 = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'h1;
       end

       6'h21:                                //opcode de un addu
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 0;
           Mux_1_1 = 0;                        //selecion de mux de entrada para el dato B de la alu
           Mux_2_1 = 1;                        //selecion de mux dato de la memoria 0 o operacion 1
           Mux_3_1 = 0;                        //selecion de mux de direccion de rd 0 o rt 1
           Mem_inst_rd_1 = 0;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 0;
           banco_wr_1 = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu_1 = 4'h0;
       end

       default:
       begin
           Sel_pc_mux_1 = 0;
           Sel_pc_reg_1 = 1;
           Mux_1_1 = 0;
           Mux_2_1 = 1;
           Mux_3_1 = 0;
           Mem_inst_rd_1 = 1;
           Mem_RD_1 = 1;
           Mem_WR_1 = 1;
           banco_rd_1 = 1;
           banco_wr_1 = 1;
           if_id_enable = 1;
           id_exe_enable = 1;
           exe_mem_enable = 1;
           mem_wr_enable = 1;
           Sel_Alu_1 = 4'h5;
       end
   endcase

   case(OpCode_2)
       6'h20:                                //opcode de un add
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 0;                        //selecion de mux de entrada para el dato B de la alu y el shamp
           Mux_2_2 = 1;                        //selecion de mux dato de la memoria 0 o operacion 1
           Mux_3_2 = 0;                        //selecion de mux de direccion de rd 0 o rt 1
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 0;
           banco_wr_2 = 0;
           Sel_Alu_2 = 4'h0;
       end
       6'h08:                                //opcode de un addi
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 1;
           Mux_2_2 = 1;
           Mux_3_2 = 1;
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 0;
           banco_wr_2 = 0;
           Sel_Alu_2 = 4'h0;
       end
       6'h24:                                //opcode de un and
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 0;
           Mux_2_2 = 1;
           Mux_3_2 = 0;
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 0;
           banco_wr_2 = 0;
           Sel_Alu_2 = 4'h8;
       end
       6'h0c:                                //opcode de un andi
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 1;
           Mux_2_2 = 1;
           Mux_3_2 = 1;
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 0;
           banco_wr_2 = 0;
           Sel_Alu_2 = 4'h8;
       end
       6'h02:                                //opcode de un j
       begin                                 //Se usa un opcode de 3 porque se repite para el slr
           Sel_pc_mux_2 = 1;                   //usando el de 0x3 no habra errores
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 0;
           Mux_2_2 = 1;
           Mux_3_2 = 0;
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 1;
           banco_wr_2 = 1;
           Sel_Alu_2 = 4'h4;
       end

       6'h23:                                //opcode de un lw
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 1;
           Mux_2_2 = 0;
           Mux_3_2 = 1;
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 0;
           Mem_WR_2 = 1;
           banco_rd_2 = 0;
           banco_wr_2 = 0;
           Sel_Alu_2 = 4'h0;
       end
       6'h27:                                //opcode de un nor
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 0;
           Mux_2_2 = 1;
           Mux_3_2 = 0;
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 0;
           banco_wr_2 = 0;
           Sel_Alu_2 = 4'hd;
       end
       6'h25:                                //opcode de un or
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 0;
           Mux_2_2 = 1;
           Mux_3_2 = 0;
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 0;
           banco_wr_2 = 0;
           Sel_Alu_2 = 4'h9;
       end
       6'h0d:                                //opcode de un ori
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 1;
           Mux_2_2 = 1;
           Mux_3_2 = 1;
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 0;
           banco_wr_2 = 0;
           Sel_Alu_2 = 4'h9;
       end
       6'h00:                                //opcode de un sll
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 2'h2;
           Mux_2_2 = 1;
           Mux_3_2 = 0;
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 0;
           banco_wr_2 = 0;
           Sel_Alu_2 = 4'h2;
       end
       6'h03:                                //opcode de un slr
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 2'h2;
           Mux_2_2 = 1;
           Mux_3_2 = 0;
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 0;
           banco_wr_2 = 0;
           Sel_Alu_2 = 4'h3;
       end
       6'h22:                                //opcode de un sub
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 0;
           Mux_2_2 = 1;
           Mux_3_2 = 0;
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 0;
           banco_wr_2 = 0;
           Sel_Alu_2 = 4'h1;
       end
       6'h0e:                                     //nop
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 0;
           Mux_2_2 = 0;
           Mux_3_2 = 0;
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 1;
           banco_wr_2 = 1;
           Sel_Alu_2 = 4'h5;
       end
       6'h29:                                     //subu
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 0;
           Mux_2_2 = 1;
           Mux_3_2 = 0;
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 0;
           banco_wr_2 = 0;
           Sel_Alu_2 = 4'h1;
       end

       6'h21:                                //opcode de un addu
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 0;
           Mux_1_2 = 0;                        //selecion de mux de entrada para el dato B de la alu
           Mux_2_2 = 1;                        //selecion de mux dato de la memoria 0 o operacion 1
           Mux_3_2 = 0;                        //selecion de mux de direccion de rd 0 o rt 1
           Mem_inst_rd_2 = 0;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 0;
           banco_wr_2 = 0;
           Sel_Alu_2 = 4'h0;
       end

       default:
       begin
           Sel_pc_mux_2 = 0;
           Sel_pc_reg_2 = 1;
           Mux_1_2 = 0;
           Mux_2_2 = 1;
           Mux_3_2 = 0;
           Mem_inst_rd_2 = 1;
           Mem_RD_2 = 1;
           Mem_WR_2 = 1;
           banco_rd_2 = 1;
           banco_wr_1 = 1;
           Sel_Alu_2 = 4'h5;
       end
   endcase
end

endmodule
