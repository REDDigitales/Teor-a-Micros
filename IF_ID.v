`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2017 07:34:16 PM
// Design Name: 
// Module Name: ID_EX
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
    input [31:0] PC_4,
    input [31:0] Instrucction,
    output reg [31:0]PC_4_out,
    output reg [31:0] Instrucction_out
    );
    
    always@(negedge clk)
    begin
        PC_4_out <= PC_4;
        Instrucction_out <= Instrucction;
    end
    
    
    
    
    
    
    
endmodule
