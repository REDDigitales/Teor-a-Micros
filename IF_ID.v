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
    input IF_ID_enable,
    input [31:0] PC_4,
    input [31:0] Instrucction,

    output reg [31:0]PC_4_out,
    output reg [31:0] Instrucction_out
    );
    
    always@(negedge clk)
    begin
        case(IF_ID_enable)
        1'b0:
            begin
            PC_4_out <= PC_4;
            Instrucction_out <= Instrucction;
            end
            
        default: 
            begin
            PC_4_out <= 32'hZZZZZZZZ;
            Instrucction_out <= 32'hZZZZZZZZ;
            end
        
        endcase
    end
    
   
    
endmodule
