`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2017 09:59:49 PM
// Design Name: 
// Module Name: Execute
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


module Execute(
    input [31:0] data_A,
    input [31:0] data_B,
    input [31:0] SignExtImm,
    input [4:0] shamt,
    input mux_2_flag,
    input [3:0] Alu_function,
    
    output reg [31:0] ALU
    );
    
    reg [31:0] data_A_reg;
    reg [31:0] data_B_reg;
    reg zero_flag;
    
    always@*
    begin
    case(mux_2_flag)
    
        2'd0: data_B_reg = data_B;
        2'd1: data_B_reg = SignExtImm;
        default: data_B_reg = shamt;
       
    endcase
    end
    
    Alu Alu_unit(
    .DataA(data_A), 
    .DataB(data_B_reg),
    .Alu_fun(Alu_function),          // Señal de la nube de control
    .Resultado(ALU),
    .Zero(zero_flag)
    );
    
    
endmodule
