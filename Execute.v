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
    input [1:0] mux_1_flag,
    input [3:0] Alu_function,
    output [31:0] ALU
    );

    reg [31:0] data_A_reg;
    reg [31:0] data_B_reg;
    wire zero_flag;

    always@*
    begin
    case(mux_1_flag)
        2'd0: data_B_reg = data_B;
        2'd1: data_B_reg = SignExtImm;
        2'd2: data_B_reg = {27'b0,shamt};
        default: data_B_reg = 32'hzzzzzz;

    endcase
    end

    Alu Alu_unit(
    .DataA(data_A),
    .DataB(data_B_reg),
    .Alu_fun(Alu_function),          // Se�al de la nube de control
    .Resultado(ALU),
    .Zero(zero_flag)
    );


endmodule
