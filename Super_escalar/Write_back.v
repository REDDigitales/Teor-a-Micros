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
    input [31:0] dato_mem_1,
    input [4:0] rd_1,
    input [4:0] rt_1,
    input [31:0] ALU_1,
    input WB_mux_flag_1,
    input WR_mux_flag_1,
    output wire [31:0] WB_mux_1,
    output wire [4:0] WR_mux_1,
///////////////////////////////////////////
    input [31:0] dato_mem_2,
    input [4:0] rd_2,
    input [4:0] rt_2,
    input [31:0] ALU_2,
    input WB_mux_flag_2,
    input WR_mux_flag_2,
    output wire [31:0] WB_mux_2,
    output wire [4:0] WR_mux_2
    );



    assign WB_mux_1 = WB_mux_flag_1 ? ALU_1 : dato_mem_1;
    assign WR_mux_1 = WR_mux_flag_1 ? rt_1 : rd_1;

/////////////////////////////////////////////////////////////////

    assign WB_mux_2 = WB_mux_flag_2 ? ALU_2 : dato_mem_2;
    assign WR_mux_2 = WR_mux_flag_2 ? rt_2 : rd_2;

endmodule
