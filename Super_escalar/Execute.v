`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 10:49:12 PM
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

    input [31:0] data_A_1,
    input [31:0] data_B_1,
    input [31:0] SignExtImm_1,
    input [4:0] shamt_1,
    input [1:0] mux_1_flag_1,
    input [3:0] Alu_function_1,
    output [31:0] ALU_1,
/////////////////////////////////////////////
    input [31:0] data_A_2,
    input [31:0] data_B_2,
    input [31:0] SignExtImm_2,
    input [4:0] shamt_2,
    input [1:0] mux_1_flag_2,
    input [3:0] Alu_function_2,
    output [31:0] ALU_2
    );

    reg [31:0] data_A_reg_1;
    reg [31:0] data_B_reg_1;
    wire zero_flag_1;
///////////////////////////////////////////
    reg [31:0] data_A_reg_2;
    reg [31:0] data_B_reg_2;
    wire zero_flag_2;

    always@*
    begin
    case(mux_1_flag_1)
        2'd0: data_B_reg_1 = data_B_1;
        2'd1: data_B_reg_1 = SignExtImm_1;
        2'd2: data_B_reg_1 = {27'b0,shamt_1};
        default: data_B_reg_1 = 32'hzzzzzz;
    endcase
    end
////////////////////////////////////////////////////
    always@*
    begin
    case(mux_1_flag_2)
        2'd0: data_B_reg_2 = data_B_2;
        2'd1: data_B_reg_2 = SignExtImm_2;
        2'd2: data_B_reg_2 = {27'b0,shamt_2};
        default: data_B_reg_2 = 32'hzzzzzz;
    endcase
    end

    ALU_1 Alu_unit_1(
    .DataA(data_A_1),
    .DataB(data_B_reg_1),
    .Alu_fun(Alu_function_1),          // Se?al de la nube de control
    .Resultado(ALU_1),
    .Zero(zero_flag_1)
    );
/////////////////////////////////////////////
    ALU_2 Alu_unit_2(
    .DataA(data_A_2),
    .DataB(data_B_reg_2),
    .Alu_fun(Alu_function_2),          // Se?al de la nube de control
    .Resultado(ALU_2),
    .Zero(zero_flag_2)
    );

endmodule