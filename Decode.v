`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2017 02:04:48 PM
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
    input [31:0] address,
    input [31:0] PC_4,
    output reg [31:0] JumpAddr,
    output reg [31:0] SignExtImm,
    output [4:0] rd_out, rt_out, shamt_out,
    
    // Variables para instancia: banco de registros
    input read_reg_flag,
    input write_reg_flag,
    input write_reg,
    input write_data,
    output reg [31:0] dato_A,
    output reg [31:0] dato_B
    );
    
    wire [5:0] opcode;
    wire [4:0] rs;
    wire [4:0] rd;
    wire [4:0] rt;
    wire [10:6] shamt;
    
    assign opcode = address [31:26];
    assign rs = address [25:21];
    assign rt = address [20:16];
    assign rd = address [15:11];
    assign shamt = address [10:6];
    
    assign rd_out = rd;
    assign rt_out = rt;
    assign shamt_out = shamt;

    always@* 
    begin
        case(opcode)
        6'h8: SignExtImm = {16'd0,address[15:0]};  // Addi
        6'h2: JumpAddr = {PC_4 [31:28], address [25:0],2'b0}; //Jump
        6'h23: SignExtImm = {16'd0,address[15:0]}; // Load Word
        default: JumpAddr = 32'd0;
        endcase
    end
    
    Banco_registros Banco_registros_unit(
       .clk(clk),
       .read_reg_flag(read_reg_flag),
       .write_reg_flag(write_reg_flag),
       .write_reg(write_reg),
       .write_data(write_data),
       .rs(rs),
       .rt(rt),
       .dato_A(dato_A),
       .dato_B(dato_B)
    );
    
    
endmodule
