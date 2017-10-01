`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 09/25/2017 09:11:35 PM
// Design Name:
// Module Name: Write_back
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


module Write_back(
    input [31:0] dato_mem,
    input [4:0] rd,
    input [4:0] rt,
    input [31:0] ALU,
    input WB_mux_flag,
    input WR_mux_flag,
    output wire [31:0] WB_mux,
    output wire [4:0] WR_mux
    );



    assign WB_mux = WB_mux_flag ? ALU : dato_mem;
    assign WR_mux = WR_mux_flag ? rt : rd;


endmodule
