module Memoria(
    input clk, ReadMem,
    input [31:0] Dir_Instru,
    output reg [31:0] Dato_Instru //Dato salida Instrucciones
    );


initial begin
  Dato_Instru = 32'h00400000;
end
always @(posedge clk)
begin
	if (~ReadMem)    // Memoria se activa con 0.
	begin
	case (Dir_Instru) //PC + 4
  32'h00400000 : Dato_Instru = 32'b00000010001100101000000000100000; //add
	32'h00400004 : Dato_Instru = 32'b00000000000100010100000011000000; //sll
	32'h00400008 : Dato_Instru = 32'b00100010000010010000000000001111; //addi
	32'h0040000C : Dato_Instru = 32'b10001110001010100000000000000010; //lw
	32'h00400010 : Dato_Instru = 32'b00000000000010101000100110000010; //srl
	32'h00400014 : Dato_Instru = 32'b00000001001010100100000000100101; //or
	32'h00400018 : Dato_Instru = 32'b00000010001100100100100000100010; //sub
	32'h0040001C : Dato_Instru = 32'b00000010001100101000000000100100; //and
	32'h00400020 : Dato_Instru = 32'b00110110000010010000000000010000; //ori
	32'h00400024 : Dato_Instru = 32'b00000010001100100101000000100111; //nor
	32'h00400028 : Dato_Instru = 32'b00110010000100010000000000000100; //andi
	32'h0040002C : Dato_Instru = 32'b00000001000100101000000000100011; //subu
	32'h00400030 : Dato_Instru = 32'b00001000101010111010101010000100; //	jump
	32'h00400034 : Dato_Instru = 32'b00000010001100101000000000100000; //add
	32'h00400038 : Dato_Instru = 32'b00000001001010101001000000100001; //addu
	32'hAAAAAAAA : Dato_Instru = 32'h00000033; //	nop
	default : Dato_Instru = 32'h0;
	endcase
	end
  else
      Dato_Instru = 32'h0;

end


endmodule
