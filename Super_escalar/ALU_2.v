`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 11:01:05 PM
// Design Name: 
// Module Name: ALU_1
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


module ALU_2(

    input [31:0] DataA, DataB,
    input [3:0] Alu_fun,          // Señal de la nube de control
    output reg [31:0] Resultado,
    output reg Zero
    );

    always @* begin
        Resultado = 32'h0;
        Zero = 1'b0;
        case(Alu_fun)
            4'h0:                   //Add
            begin
                Resultado = DataA + DataB;
                Zero = 1'b0;
            end
            4'h1:                   //Sub
            begin
                Resultado = DataA - DataB;
                Zero = 1'b0;
            end
            4'h2:                   //correr a la izquierda
            begin
                Resultado = DataA << DataB;
                Zero = 1'b0;
            end
            4'h3:                   //Correr a la derecha
            begin
                Resultado = DataA >> DataB;
                Zero = 1'b0;
            end
            4'h8:                     //And
            begin
                Resultado = DataA & DataB;
                Zero = 1'b0;
            end                       //or
            4'h9:
            begin
                Resultado = DataA | DataB;
                Zero = 1'b0;
            end
            4'ha:                     //Not
            begin
                Resultado =  ~DataA;
                Zero = 1'b0;
            end
            4'hb:                     //Xor
            begin
                Resultado = DataA ^ DataB;
                Zero = 1'b0;
            end
            4'hc:                     //Nand
            begin
                Resultado = ~(DataA & DataB);
                Zero = 1'b0;
            end
            4'hd:                    //Nor
            begin
                Resultado = ~(DataA | DataB);
                Zero = 1'b0;
            end
            4'he:                   //Xnor
            begin
                Resultado = DataA ~^ DataB;
                Zero = 1'b0;
            end
            4'hf:                  //comparacion de si son iguales
            begin
                if (DataA == DataB)
                begin
                    Resultado = 32'h0;
                    Zero = 1;
                end
                else
                begin
                    Resultado = 32'h0;
                    Zero = 0;
                end
            end
            default:
            begin
                Resultado = 32'h0;
                Zero = 1'b0;
            end
        endcase
    end
endmodule