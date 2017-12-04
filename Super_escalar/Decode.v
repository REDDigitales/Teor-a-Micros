`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 09:57:21 PM
// Design Name: 
// Module Name: Decode
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


module Decode(

    input clk,
    
    input [31:0] address_1,
    input [31:0] PC_4,
    output [31:0] JumpAddr_1,
    output [31:0] SignExtImm_1,
    output [4:0] rd_out_1, rt_out_1, shamt_out_1,
    
    input [31:0] address_2,
    input [31:0] PC_8,
    output [31:0] JumpAddr_2,
    output [31:0] SignExtImm_2,
    output [4:0] rd_out_2, rt_out_2, shamt_out_2,

    // Variables para instancia: banco de registros
    input read_reg_flag_1,
    input write_reg_flag_1,
    input [4:0] write_reg_1,
    input [31:0] write_data_1,
    
    input read_reg_flag_2,
    input write_reg_flag_2,
    input [4:0] write_reg_2,
    input [31:0] write_data_2,
    
    
    output [31:0] dato_A1,
    output [31:0] dato_B1,
    output [31:0] dato_A2,
    output [31:0] dato_B2
   
    );

    wire [5:0] opcode_1;
    wire [4:0] rs_1;
    wire [4:0] rd_1;
    wire [4:0] rt_1;
    wire [4:0] shamt_1;
    
    wire [5:0] opcode_2;
    wire [4:0] rs_2;
    wire [4:0] rd_2;
    wire [4:0] rt_2;
    wire [4:0] shamt_2;

    assign opcode_1 = address_1 [31:26];
    assign rs_1 = address_1 [25:21];
    assign rt_1 = address_1 [20:16];
    assign rd_1 = address_1 [15:11];
    assign shamt_1 = address_1 [10:6];

    assign opcode_2 = address_2 [31:26];
    assign rs_2 = address_2 [25:21];
    assign rt_2 = address_2 [20:16];
    assign rd_2 = address_2 [15:11];
    assign shamt_2 = address_2 [10:6];
    
    assign rd_out_1 = rd_1;
    assign rt_out_1 = rt_1;
    assign shamt_out_1 = shamt_1;
    
    assign rd_out_2 = rd_2;
    assign rt_out_2 = rt_2;
    assign shamt_out_2 = shamt_2;

    // Jump , Extension de signo
    assign JumpAddr_1 = {PC_4 [31:28], address_1 [25:0],2'b0};
    assign SignExtImm_1 = address_1[15] ? {16'hffff,address_1[15:0]} :{16'h0,address_1[15:0]};

    assign JumpAddr_2 = {PC_8 [31:28], address_2 [25:0],2'b0};
    assign SignExtImm_2 = address_2[15] ? {16'hffff,address_2[15:0]} :{16'h0,address_2[15:0]};


    banco_registros Banco_registros_unit(
       .clk(clk),
       .read_reg_flag_1(read_reg_flag_1),
       .write_reg_flag_1(write_reg_flag_1),
       .write_reg_1(write_reg_1),
       .write_data_1(write_data_1),
       .rs_1(rs_1),
       .rt_1(rt_1),
       .dato_A1(dato_A1),
       .dato_B1(dato_B1),
       
       .read_reg_flag_2(read_reg_flag_2),
       .write_reg_flag_2(write_reg_flag_2),
       .write_reg_2(write_reg_2),
       .write_data_2(write_data_2),
       .rs_2(rs_2),
       .rt_2(rt_2),
       .dato_A2(dato_A2),
       .dato_B2(dato_B2)
       );
        
endmodule