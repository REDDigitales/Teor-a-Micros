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


module MEM_WB(
    input clk,
    input [31:0] dato_mem,
    input [31:0] ALU,
    input [4:0] rd,
    input [4:0] rt,
    
    output reg [31:0] dato_mem_out,
    output reg [4:0] rd_out,
    output reg [4:0] rt_out,
    output reg [31:0] ALU_out
    ); 
    
    always@(negedge clk)
       begin
         dato_mem_out <= dato_mem;
         rd_out <= rd;
         rt_out <= rt;
         ALU_out <= ALU;
       end
endmodule
