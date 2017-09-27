`timescale 1ns / 1ps
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
   input [5:0] OpCode,
   output reg Sel_pc_mux, Sel_pc_reg, Mux_2, Mux_3,
   Mem_inst_rd, Mem_RD, Mem_WR, banco_rd, banco_wr,
   if_id_enable, id_exe_enable, exe_mem_enable, mem_wr_enable,
   output reg [1:0] Mux_1,
   output reg [3:0] Sel_Alu
   );

initial begin
   Sel_pc_mux = 0;
   Sel_pc_reg = 0;
   Mux_1 = 0;
   Mux_2 = 0;
   Mux_3 = 0;
   Mem_inst_rd = 0;
   Mem_RD = 0;
   Mem_WR = 0;
   banco_rd = 0;
   banco_wr = 0;
   if_id_enable = 0;
   id_exe_enable = 0;
   exe_mem_enable = 0;
   mem_wr_enable = 0;
   Sel_Alu = 4'h0;
end

always @(posedge clk)
begin

   case(OpCode)
       6'h20:                                //opcode de un add
       begin
           Sel_pc_mux = 0;
           Sel_pc_reg = 0;
           Mux_1 = 0;                        //selecion de mux de entrada para el dato B de la alu
           Mux_2 = 1;                        //selecion de mux dato de la memoria 0 o operacion 1
           Mux_3 = 0;                        //selecion de mux de direccion de rd 0 o rt 1
           Mem_inst_rd = 0;
           Mem_RD = 1;
           Mem_WR = 1;
           banco_rd = 0;
           banco_wr = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu = 4'h0;
       end
       6'h08:                                //opcode de un addi
       begin
           Sel_pc_mux = 0;
           Sel_pc_reg = 0;
           Mux_1 = 1;
           Mux_2 = 1;
           Mux_3 = 1;
           Mem_inst_rd = 0;
           Mem_RD = 1;
           Mem_WR = 1;
           banco_rd = 0;
           banco_wr = 1;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu = 4'h0;
       end
       6'h24:                                //opcode de un and
       begin
           Sel_pc_mux = 0;
           Sel_pc_reg = 0;
           Mux_1 = 0;
           Mux_2 = 1;
           Mux_3 = 0;
           Mem_inst_rd = 0;
           Mem_RD = 1;
           Mem_WR = 1;
           banco_rd = 0;
           banco_wr = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu = 4'h8;
       end
       6'h0c:                                //opcode de un andi
       begin
           Sel_pc_mux = 0;
           Sel_pc_reg = 0;
           Mux_1 = 1;
           Mux_2 = 1;
           Mux_3 = 1;
           Mem_inst_rd = 0;
           Mem_RD = 1;
           Mem_WR = 1;
           banco_rd = 0;
           banco_wr = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu = 4'h8;
       end
       6'h03:                                //opcode de un j
       begin                                 //Se usa un opcode de de 3 porque se repite para el slr
           Sel_pc_mux = 1;                   //usando el de 0x3 no habra errores
           Sel_pc_reg = 0;
           Mux_1 = 0;
           Mux_2 = 1;
           Mux_3 = 0;
           Mem_inst_rd = 0;
           Mem_RD = 1;
           Mem_WR = 1;
           banco_rd = 0;
           banco_wr = 0;
           if_id_enable = 0;
           id_exe_enable = 1;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
       end
       
       6'h23:                                //opcode de un lw
       begin
           Sel_pc_mux = 0;
           Sel_pc_reg = 0;
           Mux_1 = 1;
           Mux_2 = 1;
           Mux_3 = 1;
           Mem_inst_rd = 0;
           Mem_RD = 0;
           Mem_WR = 1;
           banco_rd = 0;
           banco_wr = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu = 4'h0;
       end
       6'h27:                                //opcode de un nor
       begin
           Sel_pc_mux = 0;
           Sel_pc_reg = 0;
           Mux_1 = 0;
           Mux_2 = 1;
           Mux_3 = 0;
           Mem_inst_rd = 0;
           Mem_RD = 1;
           Mem_WR = 1;
           banco_rd = 0;
           banco_wr = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu = 4'hd;
       end
       6'h25:                                //opcode de un or
       begin
           Sel_pc_mux = 0;
           Sel_pc_reg = 0;
           Mux_1 = 0;
           Mux_2 = 1;
           Mux_3 = 0;
           Mem_inst_rd = 0;
           Mem_RD = 1;
           Mem_WR = 1;
           banco_rd = 0;
           banco_wr = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu = 4'h9;
       end
       6'h0d:                                //opcode de un ori
       begin
           Sel_pc_mux = 0;
           Sel_pc_reg = 0;
           Mux_1 = 1;
           Mux_2 = 1;
           Mux_3 = 1;
           Mem_inst_rd = 0;
           Mem_RD = 1;
           Mem_WR = 1;
           banco_rd = 0;
           banco_wr = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu = 4'h9;
       end
       6'h00:                                //opcode de un sll
       begin
           Sel_pc_mux = 0;
           Sel_pc_reg = 0;
           Mux_1 = 2'h2;
           Mux_2 = 1;
           Mux_3 = 0;
           Mem_inst_rd = 0;
           Mem_RD = 1;
           Mem_WR = 1;
           banco_rd = 0;
           banco_wr = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu = 4'h2;
       end
       6'h02:                                //opcode de un slr
       begin
           Sel_pc_mux = 0;
           Sel_pc_reg = 0;
           Mux_1 = 2'h2;
           Mux_2 = 1;
           Mux_3 = 0;
           Mem_inst_rd = 0;
           Mem_RD = 1;
           Mem_WR = 1;
           banco_rd = 0;
           banco_wr = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu = 4'h3;
       end
       6'h22:                                //opcode de un sub
       begin
           Sel_pc_mux = 0;
           Sel_pc_reg = 0;
           Mux_1 = 0;
           Mux_2 = 1;
           Mux_3 = 0;
           Mem_inst_rd = 0;
           Mem_RD = 1;
           Mem_WR = 1;
           banco_rd = 0;
           banco_wr = 0;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu = 4'h1;
       end
       default:
       begin
           Sel_pc_mux = 0;
           Sel_pc_reg = 0;
           Mux_1 = 0;
           Mux_2 = 1;
           Mux_3 = 0;
           Mem_inst_rd = 0;
           Mem_RD = 1;
           Mem_WR = 1;
           banco_rd = 1;
           banco_wr = 1;
           if_id_enable = 0;
           id_exe_enable = 0;
           exe_mem_enable = 0;
           mem_wr_enable = 0;
           Sel_Alu = 4'h5;
       end
   endcase
end

endmodule
