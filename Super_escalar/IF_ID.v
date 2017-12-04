`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 09:46:55 PM
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
    input clk,
    input IF_ID_enable,
    
    input [31:0] PC_4,
    input [31:0] Instrucction,
    output [31:0] PC_4_out,
    output [31:0] Instrucction_out,
    /////////////////////////////////////
    input [31:0] PC_8,
    input [31:0] Instrucction_2,
    output [31:0] PC_8_out,
    output [31:0] Instrucction_out_2
    
    );

    reg [31:0] Instrucction_reg, PC_4_reg;
    reg [31:0] Instrucction_reg_2, PC_8_reg;

    always@(posedge clk)
    begin
        case(IF_ID_enable)
        1'b0:
            begin
            PC_4_reg <= PC_4;
            Instrucction_reg <= Instrucction;
            PC_8_reg <= PC_8;
            Instrucction_reg_2 <= Instrucction_2;
            end

        default:
            begin
            PC_4_reg <= 32'hZZZZZZZZ;
            Instrucction_reg <= 32'hZZZZZZZZ;
            PC_8_reg <= 32'hZZZZZZZZ;
            Instrucction_reg_2 <= 32'hZZZZZZZZ;
            end

        endcase
    end

    assign Instrucction_out = Instrucction_reg;
    assign PC_4_out = PC_4_reg;
    assign Instrucction_out_2 = Instrucction_reg_2;
    assign PC_8_out = PC_8_reg;


endmodule

