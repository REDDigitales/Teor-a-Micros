`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 11:46:54 PM
// Design Name: 
// Module Name: Mem_datos
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


module Mem_datos(

    input clk, Mem_rd_1, Mem_wr_1,
    input [31:0] Dir_Mem_1, Dato_Mem_in_1,
    output reg [31:0] Dato_Mem_out_1,
    
    input Mem_rd_2, Mem_wr_2,
    input [31:0] Dir_Mem_2, Dato_Mem_in_2,
    output reg [31:0] Dato_Mem_out_2
    );

    parameter grande = 31;
    reg [grande:0] r1, r2, r3, r4;

    initial
     begin
         r1 = 32'h00000008;
         r2 = 32'h0000000D;
         r3 = 32'h00000002;
         r4 = 32'h00000010;
     end

    always@(*)
    begin
        case (Dir_Mem_1)

            32'h10000000:
            begin
                if (~Mem_rd_1)
                    Dato_Mem_out_1 = r1;
                else if (~Mem_wr_1)
                    r1 = Dato_Mem_in_1;
            end

            32'h10000004:
            begin
                if (~Mem_rd_1)
                    Dato_Mem_out_1 = r2;
                else if (~Mem_wr_1)
                    r2 = Dato_Mem_in_1;
            end

            32'h10000008:
            begin
                if (~Mem_rd_1)
                    Dato_Mem_out_1 = r3;
                else if (~Mem_wr_1)
                    r3 = Dato_Mem_in_1;
            end

            32'h1000000C:
            begin
                if (~Mem_rd_1)
                    Dato_Mem_out_1 = r4;
                else if (~Mem_wr_1)
                    r4 = Dato_Mem_in_1;
            end

            default: Dato_Mem_out_1 = 32'b00100000;

        endcase
        
        case (Dir_Mem_2)
        
            32'h10000000:
            begin
                if (~Mem_rd_2)
                    Dato_Mem_out_2 = r1;
                else if (~Mem_wr_2)
                    r1 = Dato_Mem_in_2;
            end

            32'h10000004:
            begin
                if (~Mem_rd_2)
                    Dato_Mem_out_2 = r2;
                else if (~Mem_wr_2)
                    r2 = Dato_Mem_in_2;
            end

            32'h10000008:
            begin
                if (~Mem_rd_2)
                    Dato_Mem_out_2 = r3;
                else if (~Mem_wr_2)
                    r3 = Dato_Mem_in_2;
            end

            32'h1000000C:
            begin
                if (~Mem_rd_2)
                    Dato_Mem_out_2 = r4;
                else if (~Mem_wr_2)
                    r4 = Dato_Mem_in_2;
            end

            default: Dato_Mem_out_2 = 32'b00100000;

        endcase
    end

endmodule