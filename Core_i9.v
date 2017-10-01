`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 09/25/2017 11:02:40 PM
// Design Name:
// Module Name: Core_i9
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


module Core_i9(
    input clk,
    input [31:0] t0_out, t1_out, t2_out, s0_out, s1_out, s2_out
    );

    wire [5:0] opcode;
    wire sel_pc_mux_wire;
    wire sel_pc_reg_wire;
    wire [1:0] mux_dato_b;
    wire mux_WB;
    wire mux_rd_rt;
    wire mem_inst_enable; // Mem instrucciones
    wire mem_RD_wire;     // Mem datos
    wire mem_WR_wire;     // Mem datos
    wire banco_rd_wire;
    wire banco_wr_wire;
    wire if_id_enable_wire;
    wire id_exe_enable_wire;
    wire exe_mem_enable_wire;
    wire mem_wr_enable_wire;
    wire [3:0] Alu_function_wire;
    wire [31:0] jump_addr;
    wire [31:0] PC_more_4_FI;
    wire [31:0] PC_more_4_DI;
    wire [31:0] instruction_wire_FI;
    wire [31:0] instruction_wire_DI;

    wire [31:0] SignExtImm_DI;
    wire [4:0] rd_out_DI, rt_out_DI, shamt_out_DI;
    wire [31:0] Dato_A_DI, Dato_B_DI;

    wire [31:0] SignExtImm_EX;
    wire [4:0] rd_out_EX, rt_out_EX, shamt_out_EX;
    wire [31:0] Dato_A_EX, Dato_B_EX;
    wire [31:0] Alu_EX;

    wire [3:0] alu_function_EX;
    wire [1:0] Mux_1_flag_EX;
    wire Mux_2_flag_EX;
    wire Mux_3_flag_EX;
    wire flag_mem_rd_EX;
    wire flag_mem_wr_EX;
    wire flag_banco_wr_EX;

    wire Mux_2_flag_MEM;
    wire Mux_3_flag_MEM;
    wire flag_mem_rd_MEM;
    wire flag_mem_wr_MEM;
    wire flag_banco_wr_MEM;
    wire [31:0] Alu_MEM, DI;
    wire [4:0] rd_out_MEM, rt_out_MEM;

    wire [31:0] DO;

    wire Mux_2_flag_WB;
    wire Mux_3_flag_WB;
    wire flag_banco_wr_WB;
    wire [4:0] rd_out_WB, rt_out_WB;
    wire [31:0] DO_WB, Alu_WB;

    wire [31:0] write_data_WB;
    wire [4:0] write_reg_WB;

    Control Control_unit(
    .clk(clk),
    .OpCode(opcode),
    .Sel_pc_mux(sel_pc_mux_wire),
    .Sel_pc_reg(sel_pc_reg_wire),
    .Mux_1(mux_dato_b),
    .Mux_2(mux_WB),
    .Mux_3(mux_rd_rt),
    .Mem_inst_rd(mem_inst_enable),
    .Mem_RD(mem_RD_wire),
    .Mem_WR(mem_WR_wire),
    .banco_rd(banco_rd_wire),
    .banco_wr(banco_wr_wire),
    .if_id_enable(if_id_enable_wire),
    .id_exe_enable(id_exe_enable_wire),
    .exe_mem_enable(exe_mem_enable_wire),
    .mem_wr_enable(mem_wr_enable_wire),
    .Sel_Alu(Alu_function_wire)
    );

    Fetch Fetch_unit(
    .clk(clk),
    .PC_reg_enable(sel_pc_reg_wire),
    .mux_PC_flag(sel_pc_mux_wire),              // 0 = PC+4  , 1= jump_address
    .Readmem(mem_inst_enable),                  // bandera de control: lectura de memoria
    .jump_address(jump_addr),
    .PC_sum(PC_more_4_FI),
    .Instrucction(instruction_wire_FI)
    );



    IF_ID IF_ID_unit(
    .clk(clk),
    .IF_ID_enable(if_id_enable_wire),
    .PC_4(PC_more_4_FI),
    .Instrucction(instruction_wire_FI),
    .PC_4_out (PC_more_4_DI),
    .Instrucction_out(instruction_wire_DI),
    .opcode_out(opcode)
    );



    Decode Decode_unit(
    .clk(clk),
    .address(instruction_wire_DI),
    .PC_4(PC_more_4_DI),
    .JumpAddr(jump_addr),
    .SignExtImm(SignExtImm_DI),
    .rd_out(rd_out_DI),
    .rt_out(rt_out_DI),
    .shamt_out(shamt_out_DI),
    .read_reg_flag(banco_rd_wire),
    .write_reg_flag(flag_banco_wr_WB),//
    .write_reg(write_reg_WB),
    .write_data(write_data_WB),
    .dato_A(Dato_A_DI),
    .dato_B(Dato_B_DI),
    .t0_wire(t0_out),
    .t1_wire(t1_out),
    .t2_wire(t2_out),
    .s0_wire(s0_out),
    .s1_wire(s1_out),
    .s2_wire(s2_out)
    );

    ID_EX ID_EX_unit(
    .clk(clk),
    .ID_EX_enable(id_exe_enable_wire),
    .dato_A(Dato_A_DI),
    .dato_B(Dato_B_DI),
    .shampt(shamt_out_DI),
    .rd(rd_out_DI),
    .rt(rt_out_DI),
    .SignExtImm(SignExtImm_DI),

    .alu_function(Alu_function_wire),
    .Mux_1_flag(mux_dato_b),
    .Mux_2_flag(mux_WB),
    .Mux_3_flag(mux_rd_rt),
    .flag_mem_rd(mem_RD_wire),
    .flag_mem_wr(mem_WR_wire),
    .flag_banco_wr(banco_wr_wire),

    .dato_A_out(Dato_A_EX),
    .dato_B_out(Dato_B_EX),
    .shampt_out(shamt_out_EX),
    .rd_out(rd_out_EX),
    .rt_out(rt_out_EX),
    .SignExtImm_out(SignExtImm_EX),

    .alu_function_out(alu_function_EX),
    .Mux_1_flag_out(Mux_1_flag_EX),
    .Mux_2_flag_out(Mux_2_flag_EX),
    .Mux_3_flag_out(Mux_3_flag_EX),
    .flag_mem_rd_out(flag_mem_rd_EX),
    .flag_mem_wr_out(flag_mem_wr_EX),
    .flag_banco_wr_out(flag_banco_wr_EX)
    );

    Execute Execute_unit(
    .data_A(Dato_A_EX),
    .data_B(Dato_B_EX),
    .SignExtImm(SignExtImm_EX),
    .shamt(shamt_out_EX),
    .mux_2_flag(Mux_1_flag_EX),//
    .Alu_function(alu_function_EX),//
    .ALU(Alu_EX)
    );

    EX_MEM EX_MEM_unit(
    .clk(clk),
    .EX_MEM_enable(exe_mem_enable_wire),
    .ALU(Alu_EX),
    .rd(rd_out_EX),
    .rt(rt_out_EX),
    .dato_B(Dato_B_EX),
    .Mux_flag_2(Mux_2_flag_EX),
    .Mux_flag_3(Mux_3_flag_EX),
    .mem_flag_rd(flag_mem_rd_EX),
    .mem_flag_wr(flag_mem_wr_EX),
    .banco_flag_wr(flag_banco_wr_EX),

    .ALU_out(Alu_MEM),
    .rd_out(rd_out_MEM),
    .rt_out(rt_out_MEM),
    .dato_B_out(DI),
    .Mux_flag_2_MEM(Mux_2_flag_MEM),
    .Mux_flag_3_MEM(Mux_3_flag_MEM),
    .mem_flag_rd_MEM(flag_mem_rd_MEM),
    .mem_flag_wr_MEM(flag_mem_wr_MEM),
    .banco_flag_wr_MEM(flag_banco_wr_EX)
    );


    Mem_datos Mem_datos_unit(
    .clk(clk),
    .Mem_rd(flag_mem_rd_MEM),//
    .Mem_wr(flag_mem_wr_MEM),//
    .Dir_Mem(Alu_MEM),
    .Dato_Mem_in(DI),
    .Dato_Mem_out(DO)
    );

    MEM_WB MEM_WB_unit(
    .clk(clk),
    .MEM_WB_enable(mem_wr_enable_wire),
    .dato_mem(DO),
    .ALU(Alu_MEM),
    .rd(rd_out_MEM),
    .rt(rt_out_MEM),
    .Mux_flag_2_M(Mux_2_flag_MEM),
    .Mux_flag_3_M(Mux_3_flag_MEM),
    .banco_flag_wr_M(flag_banco_wr_EX),

    .dato_mem_out(DO_WB),
    .rd_out(rd_out_WB),
    .rt_out(rt_out_WB),
    .ALU_out(Alu_WB),
    .Mux_flag_2_MOUT(Mux_2_flag_WB),
    .Mux_flag_3_MOUT(Mux_3_flag_WB),
    .banco_flag_wr_MOUT(flag_banco_wr_WB)
    );

    Write_back Write_back_unit(
    .dato_mem(DO_WB),
    .rd(rd_out_WB),
    .rt(rt_out_WB),
    .ALU(Alu_WB),
    .WB_mux_flag(Mux_2_flag_WB),//
    .WR_mux_flag(Mux_3_flag_WB),//
    .WB_mux(write_data_WB),
    .WR_mux(write_reg_WB)
    );

endmodule
