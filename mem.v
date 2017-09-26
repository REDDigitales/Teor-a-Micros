`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 09/25/2017 07:24:43 PM
// Design Name:
// Module Name: mem
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


module mem(
    input clk, Mem_rd, Mem_wr,
    input [31:0] Dir_Mem, Dato_Mem_in,
    output reg [31:0] Dato_Mem_out
    );

    parameter grande = 31;
    reg [grande:0] r1, r2, r3;
    
    initial
     begin
         r1 = 32'h0;
         r2 = 32'h0;
         r3 = 32'h0;
     end

    always@(posedge clk)
    begin
        case (Dir_Mem)
        
            32'h10000000:
            begin
                if (~Mem_rd)
                    Dato_Mem_out = r1;
                else if (~Mem_wr)
                    r1 = Dato_Mem_in;
            end
            
            32'h10000004:
            begin
                if (~Mem_rd)
                    Dato_Mem_out = r2;
                else if (~Mem_wr)
                    r2 = Dato_Mem_in;
            end
            
            32'h10000008:
            begin
                if (~Mem_rd)
                    Dato_Mem_out = r3;
                else if (~Mem_wr)
                    r3 = Dato_Mem_in;
            end
            
            default: Dato_Mem_out = 32'hf;
            
        endcase
    end

endmodule
