`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2017 02:12:00 PM
// Design Name: 
// Module Name: Fetch
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


module Fetch(

    input clk,
    
    input PC_reg_enable_1,
    input mux_PC_flag_1,              // 0 = PC+4  , 1= jump_address
    input Readmem_1,                  // bandera de control: lectura de memoria
    input [31:0] jump_address_1,
    output [31:0] PC_sum_1,
    output [31:0] Instrucction_1,
    output reg [31:0] PC_reg_1,
    //////////////////////////////////////////
    
    input PC_reg_enable_2,
    input mux_PC_flag_2,              // 0 = PC+4  , 1= jump_address
    input Readmem_2,                  // bandera de control: lectura de memoria
    input [31:0] jump_address_2,
    output [31:0] PC_sum_2,
    output [31:0] Instrucction_2,

    output reg [31:0] PC_reg_2
    );

    parameter four = 3'b100;
    parameter ocho = 4'b1000;
    ///////////////////////////////////    
 
    wire [31:0] PC_mux_wire_1;
    wire [31:0] direc_wire_1;
    ///////////////////////////////////
    wire [31:0] PC_mux_wire_2;
    wire [31:0] direc_wire_2;
    
    initial
    begin
        PC_reg_1 = 32'h00400000;
        PC_reg_2 = 32'h00400004;
    end

    //////////////////////////////////
    // Sumador PC + 4
    assign direc_wire_1 = PC_reg_1;
    assign PC_sum_1 = ocho + direc_wire_1;
    /////////////////////////////////
    // Sumador PC +8
    assign direc_wire_2 = PC_reg_2;
    assign PC_sum_2 = ocho + direc_wire_2;
    /////////////////////////////////
    
    // MUX_PC (pipeline1)
    assign PC_mux_wire_1 = mux_PC_flag_1 ? jump_address_1 : PC_sum_1;
    /////////////////////////////////
    // MUX_PC (pipeline2)
    assign PC_mux_wire_2 = mux_PC_flag_2 ? jump_address_2 : PC_sum_2;



    /////////////////////////////////

    // Registro PC
    always @(posedge clk)
    begin
    if (~PC_reg_enable_1)
        PC_reg_1 <= PC_mux_wire_1;
    if (~PC_reg_enable_2)
        PC_reg_2 <= PC_mux_wire_2;
    end



    Memoria Memoria_unit(
    .clk(clk),
    .ReadMem_1(Readmem_1),
    .ReadMem_2(Readmem_2),
    .Dir_Instru_1(direc_wire_1),
    .Dir_Instru_2(direc_wire_2),
    .Dato_Instru_1(Instrucction_1),
    .Dato_Instru_2(Instrucction_2)
    );



endmodule
