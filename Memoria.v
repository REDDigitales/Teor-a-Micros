module Memoria(
    input clk, ReadMem,
    input [31:0] Dir_Instru,
    output reg [31:0] Dato_Instru //Dato salida Instrucciones
    );

always @(posedge clk)
begin
	if (~ReadMem)    // Memoria se activa con 0.
	begin
	case (Dir_Instru) //PC + 4
	32'h00400000 : Dato_Instru = 32'h000000100; //
	32'h00400004 : Dato_Instru = 32'h010001100; //
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
	default : Dato_Instru = 32'h0;
	endcase
	end
  else
      Dato_Instru = 32'h0;

end


endmodule