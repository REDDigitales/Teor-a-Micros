`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 09/25/2017 08:37:16 PM
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
    input clk, Mem_rd, Mem_wr,
    input [31:0] Dir_Mem, Dato_Mem_in,
    output reg [31:0] Dato_Mem_out
    );

    parameter grande = 31;
    reg [grande:0] r1, r2, r3, r4;

    initial
     begin
         r1 = 32'h00000010;
         r2 = 32'h00000008;
         r3 = 32'h0000000D;
         r4 = 32'h00000002;
     end

    always@(*)
    begin
        case (Dir_Mem)

            32'h10000000:
            begin
                if (~Mem_rd)
                    Dato_Mem_out = r1;
                else if (~Mem_wr)
                    r1 = Dato_Mem_in;
            end

            32'h10000001:
            begin
                if (~Mem_rd)
                    Dato_Mem_out = r2;
                else if (~Mem_wr)
                    r2 = Dato_Mem_in;
            end

            32'h10000002:
            begin
                if (~Mem_rd)
                    Dato_Mem_out = r3;
                else if (~Mem_wr)
                    r3 = Dato_Mem_in;
            end

            32'h10000003:
            begin
                if (~Mem_rd)
                    Dato_Mem_out = r4;
                else if (~Mem_wr)
                    r4 = Dato_Mem_in;
            end

            default: Dato_Mem_out = 32'b00100000;

        endcase
    end

endmodule
