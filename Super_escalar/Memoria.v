`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 11:28:02 PM
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

    input clk, ReadMem_1, ReadMem_2,
    input [31:0] Dir_Instru_1, Dir_Instru_2,
    output reg [31:0] Dato_Instru_1, Dato_Instru_2  //Dato salida Instrucciones
    );


// initial begin
//   Dato_Instru = 32'h00400000;
// end

always @(*)
begin
	if (~ReadMem_1 || ~ReadMem_2)    // Memoria se activa con 0.
	begin
      case (Dir_Instru_1) //PC + 4
        32'h00400000 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400004 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400008 : Dato_Instru_1 = 32'h8D710000;//lw s1, 0(t3)
        32'h0040000C : Dato_Instru_1 = 32'h8D720004;//lw s2, 4(t3)
        32'h00400010 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400014 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400018 : Dato_Instru_1 = 32'h38000000;//nop
        32'h0040001C : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400020 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400024 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400028 : Dato_Instru_1 = 32'h82328020;//add s0, s1, s2
        32'h0040002C : Dato_Instru_1 = 32'h022040C0;//sll t0, s1, 3
        32'h00400030 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400034 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400038 : Dato_Instru_1 = 32'h38000000;//nop
        32'h0040003C : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400040 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400044 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400048 : Dato_Instru_1 = 32'h2209000F;//addi t1, s0, 15
        32'h0040004C : Dato_Instru_1 = 32'h468A0008;//lw t2, 8(t4)
        32'h00400050 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400054 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400058 : Dato_Instru_1 = 32'h38000000;//nop
        32'h0040005C : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400060 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400064 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400068 : Dato_Instru_1 = 32'h0D402182;//slr a0, t2, 4
        32'h0040006C : Dato_Instru_1 = 32'h95242825;//or a1, t1, a0
        32'h00400070 : Dato_Instru_1 = 32'h8A243022;//sub a2, s1, a0
        32'h00400074 : Dato_Instru_1 = 32'h91526824;//and t5, t2, s2
        32'h00400078 : Dato_Instru_1 = 32'h38000000;//nop
        32'h0040007C : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400080 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400084 : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400088 : Dato_Instru_1 = 32'h38000000;//nop
        32'h0040008C : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400090 : Dato_Instru_1 = 32'h34CE0018;//ori t6, a2, 24
        32'h00400094 : Dato_Instru_1 = 32'h9E327827;//nor t7, s1, s2
        32'h00400098 : Dato_Instru_1 = 32'h32130004;//andi s3, s0, 4
        32'h0040009C : Dato_Instru_1 = 32'hA512A023;//subu s4, t0, s2
        32'h004000A0 : Dato_Instru_1 = 32'h0810004C;//j 0x
        32'h004000A4 : Dato_Instru_1 = 32'h38000000;//nop
        32'h004000A8 : Dato_Instru_1 = 32'h0810004C;//j 0x
        32'h004000AC : Dato_Instru_1 = 32'h38000000;//nop
        32'h004000B0 : Dato_Instru_1 = 32'h38000000;//nop
        32'h004000B4 : Dato_Instru_1 = 32'h38000000;//nop
        32'h004000B8 : Dato_Instru_1 = 32'h38000000;//nop
        32'h0040011C : Dato_Instru_1 = 32'h38000000;//nop
        32'h00400120 : Dato_Instru_1 = 32'h8232A820;//add s5, s1, s2
        32'h00400124 : Dato_Instru_1 = 32'h852AB021;//addu s6, t1, t2
        32'h00400128 : Dato_Instru_1 = 32'hAD72000C;//sw s2, s12(t3)
        32'h0040012C : Dato_Instru_1 = 32'h16B60004;//bne s5, s6, etiqueta
        32'h00400130 : Dato_Instru_1 = 32'h82B6B820;//add s7, s5, s6
        32'h00400134 : Dato_Instru_1 = 32'h8AB6B822;//sub s7, s5, s6


        default : Dato_Instru_1 = 32'hffffffff;
	   endcase

	   case (Dir_Instru_2) //PC + 8
       32'h00400000 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400004 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400008 : Dato_Instru_2 = 32'h8D710000;//lw s1, 0(t3)
       32'h0040000C : Dato_Instru_2 = 32'h8D720004;//lw s2, 4(t3)
       32'h00400010 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400014 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400018 : Dato_Instru_2 = 32'h38000000;//nop
       32'h0040001C : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400020 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400024 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400028 : Dato_Instru_2 = 32'h82328020;//add s0, s1, s2
       32'h0040002C : Dato_Instru_2 = 32'h022040C0;//sll t0, s1, 3
       32'h00400030 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400034 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400038 : Dato_Instru_2 = 32'h38000000;//nop
       32'h0040003C : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400040 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400044 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400048 : Dato_Instru_2 = 32'h2209000F;//addi t1, s0, 15
       32'h0040004C : Dato_Instru_2 = 32'h468A0008;//lw t2, 8(t4)
       32'h00400050 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400054 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400058 : Dato_Instru_2 = 32'h38000000;//nop
       32'h0040005C : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400060 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400064 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400068 : Dato_Instru_2 = 32'h0D402182;//slr a0, t2, 4
       32'h0040006C : Dato_Instru_2 = 32'h95242825;//or a1, t1, a0
       32'h00400070 : Dato_Instru_2 = 32'h8A243022;//sub a2, s1, a0
       32'h00400074 : Dato_Instru_2 = 32'h91526824;//and t5, t2, s2
       32'h00400078 : Dato_Instru_2 = 32'h38000000;//nop
       32'h0040007C : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400080 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400084 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400088 : Dato_Instru_2 = 32'h38000000;//nop
       32'h0040008C : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400090 : Dato_Instru_2 = 32'h34CE0018;//ori t6, a2, 24
       32'h00400094 : Dato_Instru_2 = 32'h9E327827;//nor t7, s1, s2
       32'h00400098 : Dato_Instru_2 = 32'h32130004;//andi s3, s0, 4
       32'h0040009C : Dato_Instru_2 = 32'hA512A023;//subu s4, t0, s2
       32'h004000A0 : Dato_Instru_2 = 32'h0810004C;//j 0x
       32'h004000A4 : Dato_Instru_2 = 32'h38000000;//nop
       32'h004000A8 : Dato_Instru_2 = 32'h0810004C;//j 0x
       32'h004000AC : Dato_Instru_2 = 32'h38000000;//nop
       32'h004000B0 : Dato_Instru_2 = 32'h38000000;//nop
       32'h004000B8 : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400118 : Dato_Instru_2 = 32'h38000000;//nop
       32'h0040011C : Dato_Instru_2 = 32'h38000000;//nop
       32'h00400120 : Dato_Instru_2 = 32'h8232A820;//add s5, s1, s2
       32'h00400124 : Dato_Instru_2 = 32'h852AB021;//addu s6, t1, t2
       32'h00400128 : Dato_Instru_2 = 32'hAD72000C;//sw s2, s12(t3)
       32'h0040012C : Dato_Instru_2 = 32'h16B60004;//bne s5, s6, etiqueta
       32'h00400130 : Dato_Instru_2 = 32'h82B6B820;//add s7, s5, s6
       32'h00400134 : Dato_Instru_2 = 32'h8AB6B822;//sub s7, s5, s6

       default : Dato_Instru_2 = 32'hffffffff;
          endcase

	end

  else begin
      Dato_Instru_1 = 32'h0;
      Dato_Instru_2 = 32'h0;
      end

end


endmodule
