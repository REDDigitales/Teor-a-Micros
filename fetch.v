`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/01/2017 08:14:57 PM
// Design Name:
// Module Name: fetch
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


module fetch(

    );

    reg clk /*PC_reg_enable_reg, mux_PC_flag_reg, Readmem_reg*/;
    //reg [31:0] jump_address_reg;
    wire [31:0] PC_sum_wire, Instrucction_wire;
    //   wire [31:0]PC_mux_wire;
    wire [31:0]PC_reg;

    reg IF_ID_enable;
    wire [31:0] PC_sum_wire_2;
    wire [31:0] Instrucction_wire_2;

    reg [31:0] address;
    reg [31:0] PC_4;
    wire [31:0] JumpAddr;
    wire [31:0] SignExtImm;
    wire [4:0] rd_out, rt_out, shamt_out;
    /*reg read_reg_flag;
    reg write_reg_flag;*/
    wire [4:0] write_reg;
    wire [31:0] write_data;
    wire [31:0] dato_A;
    wire [31:0] dato_B;
    // wire [31:0] at_reg,v0_reg,v1_reg,a0_reg,a1_reg,a2_reg,a3_reg, t0_reg,t1_reg,t2_reg,t3_reg,
    // t4_reg,t5_reg,t6_reg,t7_reg,t8_reg,t9_reg,s0_reg, s1_reg,s2_reg,s3_reg,s4_reg,s5_reg,s6_reg,s7_reg,k0_reg,k1_reg,gp_reg,sp_reg,fp_reg,ra_reg;

    wire Sel_pc_mux, Sel_pc_reg, Mux_2, Mux_3,
    Mem_inst_rd, Mem_RD, Mem_WR, banco_rd, banco_wr,
    if_id_enable, id_exe_enable, exe_mem_enable, mem_wr_enable;
    wire [1:0] Mux_1;
    wire [3:0] Sel_Alu;
    wire EX_MEM_enable, MEM_WB_enable;
    wire [31:0] dato_A_out_ID_EX;
    wire [31:0] dato_B_out_ID_EX;
    wire [4:0] shampt_out_ID_EX;
    wire [4:0] rd_out_ID_EX;
    wire [4:0] rt_out_ID_EX;
    wire [31:0] SignExtImm_out_ID_EX;

    wire [3:0] alu_function_out_ID_EX;
    wire [1:0] Mux_1_flag_out_ID_EX;
    wire Mux_2_flag_out_ID_EX;
    wire Mux_3_flag_out_ID_EX;
    wire flag_mem_wr_out_ID_EX;
    wire flag_mem_rd_out_ID_EX;
    wire flag_banco_wr_out_ID_EX;

    wire [31:0] ALU;

    wire [31:0] ALU_EX_MEM;
    wire [4:0] rd_out_EX_MEM;
    wire [4:0] rt_out_EX_MEM;
    wire [31:0]dato_B_out_EX_MEM;
    wire Mux_2_flag_out_EX_MEM;
    wire Mux_3_flag_out_EX_MEM;
    wire flag_mem_rd_out_EX_MEM;
    wire flag_mem_wr_out_EX_MEM;
    wire flag_banco_wr_out_EX_MEM;

    wire MEM_WB_enable_out;

    wire [31:0] Dato_Mem_out;

    wire [31:0] dato_mem_out_wire;
    wire [4:0] rd_out_wire;
    wire [4:0] rt_out_wire;
    wire [31:0] ALU_out;
    wire Mux_flag_2_MOUT;
    wire Mux_flag_3_MOUT;
    wire banco_flag_wr_MOUT;

    Fetch fetch_test(
    .clk(clk),
    .PC_reg_enable(Sel_pc_reg),
    .mux_PC_flag(Sel_pc_mux),              // 0 = PC+4  , 1= jump_address
    .Readmem(Mem_inst_rd),                  // bandera de control: lectura de memoria
    .jump_address(JumpAddr),
    .PC_sum(PC_sum_wire),
    .Instrucction(Instrucction_wire),
    //    .PC_mux_wire(PC_mux_wire),
    .PC_reg(PC_reg)
    );

    IF_ID IF_ID_unit (
    .clk(clk),
    .IF_ID_enable(if_id_enable),
    .PC_4(PC_sum_wire),
    .Instrucction(Instrucction_wire),

    .PC_4_out(PC_sum_wire_2),
    .Instrucction_out(Instrucction_wire_2)

    );

    Decode decode_test(
        .clk(clk),
        .address(Instrucction_wire_2),
        .PC_4(PC_sum_wire_2),
        .JumpAddr(JumpAddr),
        .SignExtImm(SignExtImm),
        .rd_out(rd_out),
        .rt_out(rt_out),
        .shamt_out(shamt_out),

        // Variables para instancia: banco de registros
        .read_reg_flag(banco_rd),
        .write_reg_flag(banco_flag_wr_MOUT),
        .write_reg(write_reg),
        .write_data(write_data),
        .dato_A(dato_A),
        .dato_B(dato_B)
        // .at_reg(at_reg),
        // .v0_reg(v0_reg),
        // .v1_reg(v1_reg),
        // .a0_reg(a0_reg),
        // .a1_reg(a1_reg),
        // .a2_reg(a2_reg),
        // .a3_reg(a3_reg),
        // .t0_reg(t0_reg),
        // .t1_reg(t1_reg),
        // .t2_reg(t2_reg),
        // .t3_reg(t3_reg),
        // .t4_reg(t4_reg),
        // .t5_reg(t5_reg),
        // .t6_reg(t6_reg),
        // .t7_reg(t7_reg),
        // .t8_reg(t8_reg),
        // .t9_reg(t9_reg),
        // .s0_reg(s0_reg),
        // .s1_reg(s1_reg),
        // .s2_reg(s2_reg),
        // .s3_reg(s3_reg),
        // .s4_reg(s4_reg),
        // .s5_reg(s5_reg),
        // .s6_reg(s6_reg),
        // .s7_reg(s7_reg),
        // .k0_reg(k0_reg),
        // .k1_reg(k1_reg),
        // .gp_reg(gp_reg),
        // .sp_reg(sp_reg),
        // .fp_reg(fp_reg),
        // .ra_reg(ra_reg)
        );

      Control control_test(
         .clk(clk),
         .OpCode(Instrucction_wire_2 [31:26]),
         .Sel_pc_mux(Sel_pc_mux),
         .Sel_pc_reg(Sel_pc_reg),
         .Mux_2(Mux_2),
         .Mux_3(Mux_3),
         .Mem_inst_rd(Mem_inst_rd),
         .Mem_RD(Mem_RD),
         .Mem_WR(Mem_WR),
         .banco_rd(banco_rd),
         .banco_wr(banco_wr),
         .if_id_enable(if_id_enable),
         .id_exe_enable(id_exe_enable),
         .exe_mem_enable(exe_mem_enable),
         .mem_wr_enable(mem_wr_enable),
         .Mux_1(Mux_1),
         .Sel_Alu(Sel_Alu)
         );

     ID_EX ID_EX_unit(
         .clk(clk),
         .ID_EX_enable(id_exe_enable),
         .EX_MEM_enable(exe_mem_enable),
         .MEM_WB_enable(mem_wr_enable),
         .dato_A(dato_A),
         .dato_B(dato_B),
         .shampt(shamt_out),
         .rd(rd_out),
         .rt(rt_out),
         .SignExtImm(SignExtImm),

         .alu_function(Sel_Alu),
         .Mux_1_flag(Mux_1),
         .Mux_2_flag(Mux_2),
         .Mux_3_flag(Mux_3),
         .flag_mem_rd(Mem_RD),
         .flag_mem_wr(Mem_WR),
         .flag_banco_wr(banco_wr),


         .dato_A_out(dato_A_out_ID_EX),
         .dato_B_out(dato_B_out_ID_EX),
         .shampt_out(shampt_out_ID_EX),
         .rd_out(rd_out_ID_EX),
         .rt_out(rt_out_ID_EX),
         .SignExtImm_out(SignExtImm_out_ID_EX),
         .EX_MEM_enable_out(EX_MEM_enable),
         .MEM_WB_enable_out(MEM_WB_enable),
         .alu_function_out(alu_function_out_ID_EX),
         .Mux_1_flag_out(Mux_1_flag_out_ID_EX),
         .Mux_2_flag_out(Mux_2_flag_out_ID_EX),
         .Mux_3_flag_out(Mux_3_flag_out_ID_EX),
         .flag_mem_wr_out(flag_mem_wr_out_ID_EX),
         .flag_mem_rd_out(flag_mem_rd_out_ID_EX),
         .flag_banco_wr_out(flag_banco_wr_out_ID_EX)
        );

    Execute Execute_unit(
          .data_A(dato_A_out_ID_EX),
          .data_B(dato_B_out_ID_EX),
          .SignExtImm(SignExtImm_out_ID_EX),
          .shamt(shampt_out_ID_EX),
          .mux_1_flag(Mux_1_flag_out_ID_EX),
          .Alu_function(alu_function_out_ID_EX),
          .ALU(ALU)
      );

    EX_MEM EX_MEM_unit(
          .clk(clk),
          .EX_MEM_enable(EX_MEM_enable),
          .MEM_WB_enable(MEM_WB_enable),
          .ALU(ALU),
          .rd(rd_out_ID_EX),
          .rt(rt_out_ID_EX),
          .dato_B(dato_B_out_ID_EX),
          .Mux_flag_2(Mux_2_flag_out_ID_EX),
          .Mux_flag_3(Mux_3_flag_out_ID_EX),
          .mem_flag_rd(flag_mem_rd_out_ID_EX),
          .mem_flag_wr(flag_mem_wr_out_ID_EX),
          .banco_flag_wr(flag_banco_wr_out_ID_EX),
          .MEM_WB_enable_out(MEM_WB_enable_out),
          .ALU_out(ALU_EX_MEM),
          .rd_out(rd_out_EX_MEM),
          .rt_out(rt_out_EX_MEM),
          .dato_B_out(dato_B_out_EX_MEM),
          .Mux_flag_2_MEM(Mux_2_flag_out_EX_MEM),
          .Mux_flag_3_MEM(Mux_3_flag_out_EX_MEM),
          .mem_flag_rd_MEM(flag_mem_rd_out_EX_MEM),
          .mem_flag_wr_MEM(flag_mem_wr_out_EX_MEM),
          .banco_flag_wr_MEM(flag_banco_wr_out_EX_MEM)
          );

    Mem_datos mem_datos_unit(
          .Mem_rd(flag_mem_rd_out_EX_MEM),
          .Mem_wr(flag_mem_wr_out_EX_MEM),
          .Dir_Mem(ALU_EX_MEM),
          .Dato_Mem_in(dato_B_out_EX_MEM),
          .Dato_Mem_out(Dato_Mem_out)
          );


    MEM_WB MEM_WB_unit(
          .clk(clk),
          .MEM_WB_enable(MEM_WB_enable_out),
          .dato_mem(Dato_Mem_out),
          .ALU(ALU_EX_MEM),
          .rd(rd_out_EX_MEM),
          .rt(rt_out_EX_MEM),
          .Mux_flag_2_M(Mux_2_flag_out_EX_MEM),
          .Mux_flag_3_M(Mux_3_flag_out_EX_MEM),
          .banco_flag_wr_M(flag_banco_wr_out_EX_MEM),

          .dato_mem_out(dato_mem_out_wire),
          .rd_out(rd_out_wire),
          .rt_out(rt_out_wire),
          .ALU_out(ALU_out),
          .Mux_flag_2_MOUT(Mux_flag_2_MOUT),
          .Mux_flag_3_MOUT(Mux_flag_3_MOUT),
          .banco_flag_wr_MOUT(banco_flag_wr_MOUT)
          );

    Write_back Write_back_unit(
          .dato_mem(dato_mem_out_wire),
          .rd(rd_out_wire),
          .rt(rt_out_wire),
          .ALU(ALU_out),
          .WB_mux_flag(Mux_flag_2_MOUT),
          .WR_mux_flag(Mux_flag_3_MOUT),
          .WB_mux(write_data),
          .WR_mux(write_reg)
          );

    initial begin
     clk = 0;
     //mux_PC_flag_reg = 0;
     //Readmem_reg = 0;
     //PC_reg_enable_reg = 0;

     //IF_ID_enable = 0;
     //read_reg_flag = 0;
     //write_reg_flag = 1;
     //write_reg = 5'd16;
     //write_data = 32'h0;
     //jump_address_reg = 32'h00400000;
     //# 30 jump_address_reg = 32'h004000AA;
     //#5 mux_PC_flag_reg = 1;
     //#5 mux_PC_flag_reg = 0;
     //#50 write_data = 32'hfff;
     //write_reg_flag = 0;

    end

    always
       #5 clk = ~clk;


endmodule
