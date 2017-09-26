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


module ID_EX(
    input clk,
    input [31:0] dato_A,
    input [31:0] dato_B,
    input [4:0] shampt,
    input [4:0] rd,
    input [4:0] rt,
    
    output reg [31:0] dato_A_out,
    output reg [31:0] dato_B_out,
    output reg [4:0] shampt_out,
    output reg [4:0] rd_out,
    output reg [4:0] rt_out
    );
    
     always@(negedge clk)
       begin
         dato_A_out <= dato_A;
         dato_B_out <= dato_B;
         shampt_out <= shampt;
         rd_out <= rd;
         rt_out <= rt;
       end
endmodule
