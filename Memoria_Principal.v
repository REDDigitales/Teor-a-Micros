`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2017 03:36:45 PM
// Design Name: 
// Module Name: Memoria_Principal
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2017 06:24:40 PM
// Design Name: 
// Module Name: Memoria
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


module Memoria(
    clk,
    enable,
    ReadMem,
    Dir_Instru,
    Dir_Mem,
    Dato_Instru,
    Dato_Mem
    );

parameter registro = 5;
parameter bus = 31;
    
input clk;
input enable; // Bandera de lectura de instrucciones
input ReadMem;
input [bus:0]Dir_Instru;
input [bus:0]Dir_Mem; 
output reg [bus:0] Dato_Instru; //Dato salida Instrucciones
output reg[bus:0] Dato_Mem; // Dato que contiene registro

reg stop; // Bandera que me indica si la memoria está o no activada.

always @(posedge clk)
begin
	if (~enable && ReadMem)    // Memoria se activa con 0.
	begin
	   stop <= 0;
	case (Dir_Instru) //PC + 4
	32'h00400000 : Dato_Instru = 32'h00000010; //
	32'h00400004 : Dato_Instru = 32'h01000110; //
	32'h00400008 : Dato_Instru = 32'h001001001; //
	32'h0040000C : Dato_Instru = 32'h001000011; //
	32'h00400010 : Dato_Instru = 32'h001001000; //
	32'h00400014 : Dato_Instru = 32'h001000001; //
	32'h00400018 : Dato_Instru = 32'h001000001; //
	32'h0040001C : Dato_Instru = 32'h001000001; //
	32'h00400020 : Dato_Instru = 32'h001000011; //
	32'h00400024 : Dato_Instru = 32'h001000001; //
	32'h00400028 : Dato_Instru = 32'h001001010; //
	32'h0040002C : Dato_Instru = 32'h001000001; //
	32'h00400030 : Dato_Instru = 32'h001000001; //	
	32'h00400034 : Dato_Instru = 32'h001010101; //
	32'h00400038 : Dato_Instru = 32'h001001100; //
	
	default : Dato_Instru = 32'd0;
	endcase
	end
    
    
/*********** DIRECCIONES PARA DATOS DE MEMORIA ************/    

    else if (~ReadMem && enable) begin
        case (Dir_Mem) //PC + 4
        32'h10000000 : Dato_Mem = 32'h000000100; //
        32'h10000001 : Dato_Mem = 32'h010001100; //
        32'h10000002 : Dato_Mem = 32'h001001001; //
        endcase     
    end
    
    else
       Dato_Mem <= 32'h00000000;
       Dato_Instru <= 32'h00000000;
    
    
end

    
endmodule

