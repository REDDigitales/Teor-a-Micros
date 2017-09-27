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
    input clk
    );
    
    wire [5:0] opcode;
    wire sel_pc_mux_wire;
    wire sel_pc_reg_wire;
    wire mux_dato_b;
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
    .jump_address(),
    .Instrucction()
    );
    
   
    
    IF_ID IF_ID_unit(
    .clk(clk),
    .IF_ID_enable(if_id_enable_wire),
    .PC_4(),
    .Instrucction(), 
    .PC_4_out (),
    .Instrucction_out(),
    .opcode_out(opcode)
    );
    
    Decode Decode_unit(
    .clk(clk),
    .address(),
    .PC_4(),
    .JumpAddr(),
    .SignExtImm(),
    .rd_out(), 
    .rt_out(), 
    .shamt_out(), 
    .read_reg_flag(banco_rd_wire),
    .write_reg_flag(banco_wr_wire),
    .write_reg(),
    .write_data(),
    .dato_A(),
    .dato_B()
    );
    
    ID_EX ID_EX_unit(
    .clk(clk),
    .ID_EX_enable(id_exe_enable_wire),
    .dato_A(),
    .dato_B(),
    .shampt(),
    .rd(),
    .rt(),
    .SignExtImm(),
        
    .dato_A_out(),
    .dato_B_out(),
    .shampt_out(),
    .rd_out(),
    .rt_out(),
    .SignExtImm_out()
    );
    
    Execute Execute_unit(
    .data_A(),
    .data_B(),
    .SignExtImm(),
    .shamt(),
    .mux_2_flag(mux_dato_b),
    .Alu_function(Alu_function_wire),
    .ALU()
    );
    
    EX_MEM EX_MEM_unit(
    .clk(clk),
    .EX_MEM_enable(exe_mem_enable_wire),
    .ALU(),
    .rd(),
    .rt(),
    .dato_B(),
        
    .ALU_out(),
    .rd_out(),
    .rt_out(),
    .dato_B_out()
    );
    
    
    Mem_datos Mem_datos_unit(
    .clk(), 
    .Mem_rd(mem_RD_wire), 
    .Mem_wr(mem_WR_wire),
    .Dir_Mem(), 
    .Dato_Mem_in(),
    .Dato_Mem_out()
    );
    
    MEM_WB MEM_WB_unit(
    .clk(clk),
    .MEM_WB_enable(mem_wr_enable_wire),
    .dato_mem(),
    .ALU(),
    .rd(),
    .rt(),
        
    .dato_mem_out(),
    .rd_out(),
    .rt_out(),
    .ALU_out()   
    );
    
    Write_back Write_back_unit(
    .dato_mem(),
    .rd(),
    .rt(),
    .ALU(),     
    .WB_mux_flag(mux_WB),
    .WR_mux_flag(mux_rd_rt)
    );
    
endmodule
