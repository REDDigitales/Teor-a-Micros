`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITCR
// Engineer: David R. Berrocal Madriz
//
// Create Date: 09/14/2017 01:30:01 PM
// Design Name: FETCH
// Module Name: Fetch
// Project Name: Procesador Pipeline
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
    input PC_reg_enable,
    input mux_PC_flag,              // 0 = PC+4  , 1= jump_address
    input Readmem,                  // bandera de control: lectura de memoria
    input [31:0] jump_address,
    output [31:0] PC_sum,
    output [31:0] Instrucction
    );

    parameter four = 3'd4;

    reg [31:0] PC_reg;
    wire [31:0] PC_mux_wire;
    wire [31:0] direc_wire;

    initial
    begin
        PC_reg = 32'h00400000;
    end

    //////////////////////////////////
    // Sumador PC + 4
    assign direc_wire = PC_reg;
    assign PC_sum = four + direc_wire;


    /////////////////////////////////
    // MUX_PC
    assign PC_mux_wire = mux_PC_flag ? PC_sum : jump_address;

    /////////////////////////////////
    
    // Registro PC
    always @(negedge clk)
    begin
    if (~PC_reg_enable)
        PC_reg <= PC_mux_wire;

    end

    Memoria Memoria_unit(
    .clk(clk),
    .ReadMem(Readmem),
    .Dir_Instru(direc_wire),
    .Dato_Instru(Instrucction)
    );



endmodule
