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


module EX_MEM(
    input clk,
    input EX_MEM_enable,
    input [31:0] ALU,
    input [4:0] rd,
    input [4:0] rt,
    input [31:0] dato_B,
    
    output reg [31:0] ALU_out,
    output reg[4:0] rd_out,
    output reg [4:0] rt_out,
    output reg [31:0] dato_B_out
    );
    
    always@(negedge clk)
    begin
        case(EX_MEM_enable)
        1'b0:
            begin
            ALU_out <= ALU;
            rd_out <= rd;
            rt_out <= rt;
            dato_B_out <= dato_B;
            end
        default:
            begin
            ALU_out <= 32'hZZZZZZZZ;
            rd_out <= 32'hZZZZZZZZ;
            rt_out <= 32'hZZZZZZZZ;
            dato_B_out <= 32'hZZZZZZZZ;
            end
        endcase
     end
       
endmodule
