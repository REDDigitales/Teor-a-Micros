`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2017 02:09:58 PM
// Design Name: 
// Module Name: Testbench
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


module Testbench(

    );
    
reg clk;
initial begin
clk = 0;
end
always
       #5 clk = ~clk;
       
/////////////////////////////////////// CABLERIA       

///////////////////////////////// fetch
wire PC_reg_enable_1_wire;
wire mux_PC_flag_1_wire;              // 0 = PC+4  , 1= jump_address
wire Readmem_1_wire;                  // bandera de control: lectura de memoria
wire  jump_address_1_wire;
wire [31:0] PC_sum_1_wire;
wire [31:0] Instrucction_1_wire;
    
wire [31:0] PC_reg_1_wire;            // Señal instruccion actual
    
wire PC_reg_enable_2_wire;
wire mux_PC_flag_2_wire;              // 0 = PC+8  ; 1= jump_address
wire Readmem_2_wire;                  // bandera de control: lectura de memoria
wire [31:0] jump_address_2_wire;
wire [31:0] PC_sum_2_wire;
wire [31:0] Instrucction_2_wire;

wire [31:0] PC_reg_2_wire;

/////////////////////////////////  IF_ID

wire IF_ID_enable_wire;       
wire [31:0] PC_4_out_wire;
wire [31:0] Instrucction_out_wire;

wire [31:0] PC_8_out_wire;
wire [31:0] Instrucction_out_2_wire;
       

/////////////////////////////////  decode
wire banco_rd_1_wire;
wire banco_wr_1_wire;
wire [4:0] write_reg_1_wire;
wire [31:0] write_data_1_wire;

wire banco_rd_2_wire;
wire banco_wr_2_wire;
wire [4:0] write_reg_2_wire;
wire [31:0] write_data_2_wire;

wire [31:0] SignExtImm_1_wire;
wire [4:0] rd_out_1_wire, rt_out_1_wire, shamt_out_1_wire;

wire [31:0] SignExtImm_2_wire;
wire [4:0] rd_out_2_wire, rt_out_2_wire, shamt_out_2_wire;

wire [31:0] dato_A1_wire;
wire [31:0] dato_B1_wire;

wire [31:0] dato_A2_wire;
wire [31:0] dato_B2_wire;


///////////////////////////////// ID_EX
wire ID_EX_enable_wire;
wire EX_MEM_enable_wire;
wire MEM_WB_enable_wire;
wire EX_MEM_enable_out_wire;
wire MEM_WB_enable_out_wire;

wire [3:0] alu_function_1_wire;
wire [1:0] Mux_1_flag_1_wire;                // mux_exe
wire Mux_2_flag_1_wire;
wire Mux_3_flag_1_wire;
wire flag_mem_rd_1_wire;
wire flag_mem_wr_1_wire;
wire flag_banco_wr_1_wire;

wire [3:0] alu_function_2_wire;
wire [1:0] Mux_1_flag_2_wire;                // mux_exe
wire Mux_2_flag_2_wire;
wire Mux_3_flag_2_wire;
wire flag_mem_rd_2_wire;
wire flag_mem_wr_2_wire;
wire flag_banco_wr_2_wire;

wire [31:0] dato_A_out_1_ID_EX;
wire [31:0] dato_B_out_1_ID_EX;
wire [4:0] shampt_out_1_ID_EX;
wire [4:0] rd_out_1_ID_EX;
wire [4:0] rt_out_1_ID_EX;
wire [31:0] SignExtImm_out_1_ID_EX;

wire [3:0] alu_function_out_1_ID_EX;
wire [1:0] Mux_1_flag_out_1_ID_EX;
wire Mux_2_flag_out_1_ID_EX;
wire Mux_3_flag_out_1_ID_EX;
wire flag_mem_wr_out_1_ID_EX;
wire flag_mem_rd_out_1_ID_EX;
wire flag_banco_wr_out_1_ID_EX;

wire [31:0] dato_A_out_2_ID_EX;
wire [31:0] dato_B_out_2_ID_EX;
wire [4:0] shampt_out_2_ID_EX;
wire [4:0] rd_out_2_ID_EX;
wire [4:0] rt_out_2_ID_EX;
wire [31:0] SignExtImm_out_2_ID_EX;

wire [3:0] alu_function_out_2_ID_EX;
wire [1:0] Mux_1_flag_out_2_ID_EX;
wire Mux_2_flag_out_2_ID_EX;
wire Mux_3_flag_out_2_ID_EX;
wire flag_mem_wr_out_2_ID_EX;
wire flag_mem_rd_out_2_ID_EX;
wire flag_banco_wr_out_2_ID_EX;

/////////////////////////////////  EXE
wire [31:0] ALU_1_wire;
wire [31:0] ALU_2_wire;

//////////////////////////////// EX_MEM
wire [31:0] ALU_out_1_EX_MEM;
wire [4:0] rd_out_1_EX_MEM;
wire [4:0] rt_out_1_EX_MEM;
wire [31:0] dato_B_out_1_EX_MEM;
wire Mux_2_flag_MEM_1_EX_MEM;
wire Mux_3_flag_MEM_1_EX_MEM;
wire mem_flag_rd_MEM_1_EX_MEM;
wire mem_flag_wr_MEM_1_EX_MEM;
wire banco_flag_wr_MEM_1_EX_MEM;

wire [31:0] ALU_out_2_EX_MEM;
wire [4:0] rd_out_2_EX_MEM;
wire [4:0] rt_out_2_EX_MEM;
wire [31:0] dato_B_out_2_EX_MEM;
wire Mux_2_flag_MEM_2_EX_MEM;
wire Mux_3_flag_MEM_2_EX_MEM;
wire mem_flag_rd_MEM_2_EX_MEM;
wire mem_flag_wr_MEM_2_EX_MEM;
wire banco_flag_wr_MEM_2_EX_MEM;

wire MEM_WB_enable_out_EX_MEM;

///////////////////////////////// Mem_datos
wire [31:0] Dato_Mem_out_1_wire;
wire [31:0] Dato_Mem_out_2_wire;

///////////////////////////////// MEM_WB
wire [31:0] dato_mem_out_1_MEM_WB;
wire [4:0] rd_out_1_MEM_WB;
wire [4:0] rt_out_1_MEM_WB;
wire [31:0] ALU_out_1_MEM_WB;
wire Mux_flag_2_MOUT_1_MEM_WB;
wire Mux_flag_3_MOUT_1_MEM_WB;
wire banco_flag_wr_MOUT_1_MEM_WB;
      
wire [31:0] dato_mem_out_2_MEM_WB;
wire [4:0] rd_out_2_MEM_WB;
wire [4:0] rt_out_2_MEM_WB;
wire [31:0] ALU_out_2_MEM_WB;
wire Mux_flag_2_MOUT_2_MEM_WB;
wire Mux_flag_3_MOUT_2_MEM_WB;
wire banco_flag_wr_MOUT_2_MEM_WB;
       
//////////////////////////////////////////////
wire [31:0] write_data_1;
wire [4:0] write_reg_1;
    
wire [31:0] write_data_2;  
wire [4:0] write_reg_2;
       
       
/////////////////////////////////////////////////// INSTANCIACION       
    Fetch fetch_unit (
    
    .clk(clk),    
    .PC_reg_enable_1(PC_reg_enable_1_wire),
    .mux_PC_flag_1(mux_PC_flag_1_wire),              // 0 = PC+4  , 1= jump_address
    .Readmem_1(Readmem_1_wire),                      // bandera de control: lectura de memoria
    .jump_address_1(jump_address_1_wire),
    .PC_sum_1(PC_sum_1_wire),
    .Instrucction_1(Instrucction_1_wire),
    
    .PC_reg_1(PC_reg_1_wire),                        // Señal instruccion actual
    //////////////////////////////////////////
    
    .PC_reg_enable_2(PC_reg_enable_2_wire),
    .mux_PC_flag_2(mux_PC_flag_2_wire),              // 0 = PC+8  , 1= jump_address
    .Readmem_2(Readmem_2_wire),                      // bandera de control: lectura de memoria
    .jump_address_2(jump_address_2_wire),
    .PC_sum_2(PC_sum_2_wire),
    .Instrucction_2(Instrucction_2_wire),

    .PC_reg_2(PC_reg_2_wire)                        // Señal instruccion actual
    );
    
    ///////////////////////////////////////////////////////////////////
    IF_ID IF_ID_unit(
    .clk(clk),
    .IF_ID_enable(IF_ID_enable_wire),
        
    .PC_4(PC_sum_1_wire),
    .Instrucction(Instrucction_1_wire),
    .PC_4_out(PC_4_out_wire),
    .Instrucction_out(Instrucction_out_wire),
      
    .PC_8(PC_sum_2_wire),
    .Instrucction_2(Instrucction_2_wire),
    .PC_8_out(PC_8_out_wire),
    .Instrucction_out_2(Instrucction_out_2_wire)
    );
    ////////////////////////////////////////////////////////////////////
    Decode decode_unit(
    
    .clk(clk),
    
    .address_1(Instrucction_out_wire),
    .PC_4(PC_4_out_wire),
    .JumpAddr_1(jump_address_1_wire),
    .SignExtImm_1(SignExtImm_1_wire),
    .rd_out_1(rd_out_1_wire), 
    .rt_out_1(rt_out_1_wire), 
    .shamt_out_1(shamt_out_1_wire),
    
    .address_2(Instrucction_out_2_wire),
    .PC_8(PC_8_out_wire),
    .JumpAddr_2(jump_address_2_wire),
    .SignExtImm_2(SignExtImm_2_wire),
    .rd_out_2(rd_out_2_wire), 
    .rt_out_2(rt_out_2_wire), 
    .shamt_out_2(shamt_out_2_wire),

    // Variables para instancia: banco de registros
    .read_reg_flag_1(banco_rd_1_wire),
    .write_reg_flag_1(banco_wr_1_wire),
    .write_reg_1(write_reg_1),
    .write_data_1(write_data_1),
    
    .read_reg_flag_2(banco_rd_2_wire),
    .write_reg_flag_2(banco_wr_2_wire),
    .write_reg_2(write_reg_2),
    .write_data_2(write_data_2),
    
    
    .dato_A1(dato_A1_wire),
    .dato_B1(dato_B1_wire),
    .dato_A2(dato_A2_wire),
    .dato_B2(dato_B2_wire)
    );
    /////////////////////////////////////////////////////////////////////
    
    ID_EX ID_EX_unit(
    
    .clk(clk),
    .ID_EX_enable(ID_EX_enable_wire),
    .EX_MEM_enable(EX_MEM_enable_wire),
    .MEM_WB_enable(MEM_WB_enable_wire),
    .EX_MEM_enable_out(EX_MEM_enable_out_wire),
    .MEM_WB_enable_out(MEM_WB_enable_out_wire),


    .dato_A_1(dato_A1_wire),
    .dato_B_1(dato_B1_wire),
    .shampt_1(shamt_out_1_wire),
    .rd_1(rd_out_1_wire),
    .rt_1(rt_out_1_wire),
    .SignExtImm_1(SignExtImm_1_wire),

    .alu_function_1(alu_function_1_wire),
    .Mux_1_flag_1(Mux_1_flag_1_wire),                // mux_exe
    .Mux_2_flag_1(Mux_2_flag_1_wire),
    .Mux_3_flag_1(Mux_3_flag_1_wire),
    .flag_mem_rd_1(flag_mem_rd_1_wire),
    .flag_mem_wr_1(flag_mem_wr_1_wire),
    .flag_banco_wr_1(flag_banco_wr_1_wire),

    .dato_A_out_1(dato_A_out_1_ID_EX),
    .dato_B_out_1(dato_B_out_1_ID_EX),
    .shampt_out_1(shampt_out_1_ID_EX),
    .rd_out_1(rd_out_1_ID_EX),
    .rt_out_1(rt_out_1_ID_EX),
    .SignExtImm_out_1(SignExtImm_out_1_ID_EX),

    .alu_function_out_1(alu_function_out_1_ID_EX),
    .Mux_1_flag_out_1(Mux_1_flag_out_1_ID_EX),
    .Mux_2_flag_out_1(Mux_2_flag_out_1_ID_EX),
    .Mux_3_flag_out_1(Mux_3_flag_out_1_ID_EX),
    .flag_mem_wr_out_1(flag_mem_wr_out_1_ID_EX),
    .flag_mem_rd_out_1(flag_mem_rd_out_1_ID_EX),
    .flag_banco_wr_out_1(flag_banco_wr_out_1_ID_EX),
///////////////////////////////////////////////////////////
    .dato_A_2(dato_A2_wire),
    .dato_B_2(dato_B2_wire),
    .shampt_2(shamt_out_2_wire),
    .rd_2(rd_out_2_wire),
    .rt_2(rt_out_2_wire),
    .SignExtImm_2(SignExtImm_2_wire),

    .alu_function_2(alu_function_2_wire),
    .Mux_1_flag_2(Mux_1_flag_2_wire),            // mux_exe
    .Mux_2_flag_2(Mux_2_flag_2_wire),
    .Mux_3_flag_2(Mux_3_flag_2_wire),
    .flag_mem_rd_2(flag_mem_rd_2_wire),
    .flag_mem_wr_2(flag_mem_wr_2_wire),
    .flag_banco_wr_2(flag_banco_wr_2_wire),

    .dato_A_out_2(dato_A_out_2_ID_EX),
    .dato_B_out_2(dato_B_out_2_ID_EX),
    .shampt_out_2(shampt_out_2_ID_EX),
    .rd_out_2(rd_out_2_ID_EX),
    .rt_out_2(rt_out_2_ID_EX),
    .SignExtImm_out_2(SignExtImm_out_2_ID_EX),

    .alu_function_out_2(alu_function_out_2_ID_EX),
    .Mux_1_flag_out_2(Mux_1_flag_out_2_ID_EX),
    .Mux_2_flag_out_2(Mux_2_flag_out_2_ID_EX),
    .Mux_3_flag_out_2(Mux_3_flag_out_2_ID_EX),
    .flag_mem_wr_out_2(flag_mem_wr_out_2_ID_EX),
    .flag_mem_rd_out_2(flag_mem_rd_out_2_ID_EX),
    .flag_banco_wr_out_2(flag_banco_wr_out_2_ID_EX)
    );
    
    /////////////////////////////////////////////////////////////////////
    
    Execute execute_unit(
    
    .data_A_1(dato_A_out_1_ID_EX),
    .data_B_1(dato_B_out_1_ID_EX),
    .SignExtImm_1(SignExtImm_out_1_ID_EX),
    .shamt_1(shampt_out_1_ID_EX),
    .mux_1_flag_1(Mux_1_flag_out_1_ID_EX),
    .Alu_function_1(alu_function_out_1_ID_EX),
    .ALU_1(ALU_1_wire),
/////////////////////////////////////////////
    .data_A_2(dato_A_out_2_ID_EX),
    .data_B_2(dato_B_out_2_ID_EX),
    .SignExtImm_2(SignExtImm_out_2_ID_EX),
    .shamt_2(shampt_out_2_ID_EX),
    .mux_1_flag_2(Mux_1_flag_out_2_ID_EX),
    .Alu_function_2(alu_function_out_2_ID_EX),
    .ALU_2(ALU_2_wire)
    );
    
    //////////////////////////////////////////////////////////////////////
    
    EX_MEM EX_MEM_unit(
    .clk(clk),
    .EX_MEM_enable(EX_MEM_enable_out_wire),
    .MEM_WB_enable(MEM_WB_enable_out_wire),

    .ALU_1(ALU_1_wire),
    .rd_1(rd_out_1_ID_EX),
    .rt_1(rt_out_1_ID_EX),
    .dato_B_1(dato_B_out_1_ID_EX),
    .Mux_2_flag_1(Mux_2_flag_out_1_ID_EX),
    .Mux_3_flag_1(Mux_3_flag_out_1_ID_EX),
    .mem_flag_rd_1(flag_mem_rd_out_1_ID_EX),
    .mem_flag_wr_1(flag_mem_wr_out_1_ID_EX),
    .banco_flag_wr_1(flag_banco_wr_out_1_ID_EX),

    .ALU_out_1(ALU_out_1_EX_MEM),
    .rd_out_1(rd_out_1_EX_MEM),
    .rt_out_1(rt_out_1_EX_MEM),
    .dato_B_out_1(dato_B_out_1_EX_MEM),
    .Mux_2_flag_MEM_1(Mux_2_flag_MEM_1_EX_MEM),
    .Mux_3_flag_MEM_1(Mux_3_flag_MEM_1_EX_MEM),
    .mem_flag_rd_MEM_1(mem_flag_rd_MEM_1_EX_MEM),
    .mem_flag_wr_MEM_1(mem_flag_wr_MEM_1_EX_MEM),
    .banco_flag_wr_MEM_1(banco_flag_wr_MEM_1_EX_MEM),
////////////////////////////////////////////////
    .ALU_2(ALU_2_wire),
    .rd_2(rd_out_2_ID_EX),
    .rt_2(rt_out_2_ID_EX),
    .dato_B_2(dato_B_out_2_ID_EX),
    .Mux_2_flag_2(Mux_2_flag_out_2_ID_EX),
    .Mux_3_flag_2(Mux_3_flag_out_2_ID_EX),
    .mem_flag_rd_2(flag_mem_rd_out_2_ID_EX),
    .mem_flag_wr_2(flag_mem_wr_out_2_ID_EX),
    .banco_flag_wr_2(flag_banco_wr_out_2_ID_EX),

    .ALU_out_2(ALU_out_2_EX_MEM),
    .rd_out_2(rd_out_2_EX_MEM),
    .rt_out_2(rt_out_2_EX_MEM),
    .dato_B_out_2(dato_B_out_2_EX_MEM),
    .Mux_2_flag_MEM_2(Mux_2_flag_MEM_2_EX_MEM),
    .Mux_3_flag_MEM_2(Mux_3_flag_MEM_2_EX_MEM),
    .mem_flag_rd_MEM_2(mem_flag_rd_MEM_2_EX_MEM),
    .mem_flag_wr_MEM_2(mem_flag_wr_MEM_2_EX_MEM),
    .banco_flag_wr_MEM_2(banco_flag_wr_MEM_2_EX_MEM),

    .MEM_WB_enable_out(MEM_WB_enable_out_EX_MEM)
    );

    /////////////////////////////////////////////////////////////////////////
    Mem_datos mem_datos_unit(

    .clk(clk), 
    .Mem_rd_1(mem_flag_rd_MEM_1_EX_MEM), 
    .Mem_wr_1(mem_flag_wr_MEM_1_EX_MEM),
    .Dir_Mem_1(ALU_out_1_EX_MEM), 
    .Dato_Mem_in_1(ALU_out_1_EX_MEM),       // no la usamos
    
    .Dato_Mem_out_1(Dato_Mem_out_1_wire),
    
    .Mem_rd_2(mem_flag_rd_MEM_2_EX_MEM), 
    .Mem_wr_2(mem_flag_wr_MEM_2_EX_MEM),
    .Dir_Mem_2(ALU_out_2_EX_MEM), 
    .Dato_Mem_in_2(ALU_out_2_EX_MEM),       // no la usamos
    
    .Dato_Mem_out_2(Dato_Mem_out_2_wire)
    );
    
    /////////////////////////////////////////////////////////////////////////
    
    MEM_WB mem_WB_unit(
    
    .clk(clk),
    .MEM_WB_enable(MEM_WB_enable_out_EX_MEM),
    
    .dato_mem_1(Dato_Mem_out_1_wire),
    .ALU_1(ALU_out_1_EX_MEM),
    .rd_1(rd_out_1_EX_MEM),
    .rt_1(rt_out_1_EX_MEM),
    .Mux_flag_2_M_1(Mux_2_flag_MEM_1_EX_MEM),
    .Mux_flag_3_M_1(Mux_3_flag_MEM_1_EX_MEM),
    .banco_flag_wr_M_1(banco_flag_wr_MEM_1_EX_MEM),

    .dato_mem_out_1(dato_mem_out_1_MEM_WB),
    .rd_out_1(rd_out_1_MEM_WB),
    .rt_out_1(rt_out_1_MEM_WB),
    .ALU_out_1(ALU_out_1_MEM_WB),
    .Mux_flag_2_MOUT_1(Mux_flag_2_MOUT_1_MEM_WB),
    .Mux_flag_3_MOUT_1(Mux_flag_3_MOUT_1_MEM_WB),
    .banco_flag_wr_MOUT_1(banco_flag_wr_MOUT_1_MEM_WB),
    ////////////////////////////////////////////////////////////
    .dato_mem_2(Dato_Mem_out_2_wire),
    .ALU_2(ALU_out_2_EX_MEM),
    .rd_2(rd_out_2_EX_MEM),
    .rt_2(rt_out_2_EX_MEM),
    .Mux_flag_2_M_2(Mux_2_flag_MEM_2_EX_MEM),
    .Mux_flag_3_M_2(Mux_3_flag_MEM_2_EX_MEM),
    .banco_flag_wr_M_2(banco_flag_wr_MEM_2_EX_MEM),

    .dato_mem_out_2(dato_mem_out_2_MEM_WB),
    .rd_out_2(rd_out_2_MEM_WB),
    .rt_out_2(rt_out_2_MEM_WB),
    .ALU_out_2(ALU_out_2_MEM_WB),
    .Mux_flag_2_MOUT_2(Mux_flag_2_MOUT_2_MEM_WB),
    .Mux_flag_3_MOUT_2(Mux_flag_3_MOUT_2_MEM_WB),
    .banco_flag_wr_MOUT_2(banco_flag_wr_MOUT_2_MEM_WB)
    );
    
    /////////////////////////////////////////////////////////////////////////
    Write_back write_back_unit(
    
    .dato_mem_1(dato_mem_out_1_MEM_WB),
    .rd_1(rd_out_1_MEM_WB),
    .rt_1(rt_out_1_MEM_WB),
    .ALU_1(ALU_out_1_MEM_WB),
    .WB_mux_flag_1(Mux_flag_2_MOUT_1_MEM_WB),
    .WR_mux_flag_1(Mux_flag_3_MOUT_1_MEM_WB),
    .WB_mux_1(write_data_1),
    .WR_mux_1(write_reg_1),
///////////////////////////////////////////
    .dato_mem_2(dato_mem_out_2_MEM_WB),
    .rd_2(rd_out_2_MEM_WB),
    .rt_2(rt_out_2_MEM_WB),
    .ALU_2(ALU_out_2_MEM_WB),
    .WB_mux_flag_2(Mux_flag_2_MOUT_2_MEM_WB),
    .WR_mux_flag_2(Mux_flag_3_MOUT_2_MEM_WB),
    .WB_mux_2(write_data_2),
    .WR_mux_2(write_reg_2)
    );
    
    
    
endmodule
