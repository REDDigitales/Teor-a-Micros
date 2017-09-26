`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2017 05:00:11 PM
// Design Name: 
// Module Name: Banco_registros
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


module Banco_registros(
    input clk,
    input read_reg_flag,
    input write_reg_flag,
    input write_reg,
    input write_data,
    input [4:0] rs,
    input [4:0] rt,
    output reg [31:0] dato_A,
    output reg [31:0] dato_B
    );
    
   reg [31:0] t0,t1,t2,s0,s1,s2;
   
   
   initial
   begin
       t0 = 32'd0;
       t1 = 32'd0;
       t2 = 32'd0;
       s0 = 32'd0;
       s1 = 32'd0;
       s2 = 32'd0;
   end
    
   always@(clk)
   begin
    
    if (~read_reg_flag && write_reg_flag)               // Lectura
        begin
        case(rs)
            5'd0: dato_A <= 32'd0;  // registro zero
            5'd8: dato_A <= t0;
            5'd9: dato_A <= t1;
            5'd10: dato_A <= t2;
            5'd11: dato_A <= s0;
            5'd12: dato_A <= s1;
            5'd13: dato_A <= s2;      
        endcase
        
        case(rt)
            5'd0: dato_B <= 32'd0;  // registro zero
            5'd8: dato_B <= t0;
            5'd9: dato_B <= t1;
            5'd10: dato_B <= t2;
            5'd11: dato_B <= s0;
            5'd12: dato_B <= s1;
            5'd13: dato_B <= s2;      
            endcase
        end
    
    else if (read_reg_flag && ~write_reg_flag)      // Escritura
        begin
        case(write_reg)
            5'd8: t0 <= write_data;
            5'd9: t1 <= write_data;
            5'd10: t2 <= write_data;
            5'd11: s0 <= write_data;
            5'd12: s1 <= write_data;
            5'd13: s2 <= write_data;      
            endcase
        end
        
    else
        begin
            t0 <= 32'h11111111;
            t1 <= 32'h11111111;
            t2 <= 32'h11111111;
            s0 <= 32'h11111111;
            s1 <= 32'h11111111;
            s2 <= 32'h11111111;
        end
    end
    
   
endmodule
