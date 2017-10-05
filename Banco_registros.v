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
    input [4:0]write_reg,
    input [31:0]write_data,
    input [4:0] rs,
    input [4:0] rt,
    output reg [31:0] dato_A,
    output reg [31:0] dato_B
    // output [31:0] at_reg,v0_reg,v1_reg,a0_reg,a1_reg,a2_reg,a3_reg, t0_reg,t1_reg,t2_reg,t3_reg,
    // t4_reg,t5_reg,t6_reg,t7_reg,t8_reg,t9_reg,s0_reg, s1_reg,s2_reg,s3_reg,s4_reg,s5_reg,s6_reg,
    // s7_reg,k0_reg,k1_reg,gp_reg,sp_reg,fp_reg,ra_reg
    );

   reg [31:0] at,v0,v1,a0,a1,a2,a3,t0,t1,t2,t3,t4,t5,t6;
   reg [31:0] t7,t8,t9,s0,s1,s2,s3,s4,s5,s6,s7,k0,k1,gp,sp,fp,ra,zero;


   initial
   begin
      zero = 32'd0;
      at = 32'd0;
      v0 = 32'd0;
      v1 = 32'd0;
      a0 = 32'd0;
      a1 = 32'd0;
      a2 = 32'd0;
      a3 = 32'd0;
      t0 = 32'd0;
      t1 = 32'd0;
      t2 = 32'd0;
      t3 = 32'h10000000;
      t4 = 32'h10000000;
      t5 = 32'd0;
      t6 = 32'd0;
      t7 = 32'd0;
      t8 = 32'd0;
      t9 = 32'd0;
      s0 = 32'd0;
      s1 = 32'd0;
      s2 = 32'd0;
      s3 = 32'd0;
      s5 = 32'd0;
      s6 = 32'd0;
      s7 = 32'd0;
      k0 = 32'd0;
      k1 = 32'd0;
      gp = 32'd0;
      sp = 32'd0;
      fp = 32'd0;
      ra = 32'd0;


   end


   always@(*)
   begin

    if (~read_reg_flag)               // Lectura
        begin
        case(rs)
        5'd0: dato_A = zero;  // registro zero
        5'd1: dato_A = at;
        5'd2: dato_A = v0;
        5'd3: dato_A = v1;
        5'd4: dato_A = a0;
        5'd5: dato_A = a1;
        5'd6: dato_A = a2;
        5'd7: dato_A = a3;
        5'd8: dato_A = t0;
        5'd9: dato_A = t1;
        5'd10: dato_A = t2;
        5'd11: dato_A = t3;
        5'd12: dato_A = t4;
        5'd13: dato_A = t5;
        5'd14: dato_A = t6;
        5'd15: dato_A = t7;
        5'd16: dato_A = s0;
        5'd17: dato_A = s1;
        5'd18: dato_A = s2;
        5'd19: dato_A = s3;
        5'd20: dato_A = s4;
        5'd21: dato_A = s5;
        5'd22: dato_A = s6;
        5'd23: dato_A = s7;
        5'd24: dato_A = t8;
        5'd25: dato_A = t9;
        5'd26: dato_A = k0;
        5'd27: dato_A = k1;
        5'd28: dato_A = gp;
        5'd29: dato_A = sp;
        5'd30: dato_A = fp;
        5'd31: dato_A = ra;
        endcase
        end
    end

  always@(*)
  begin

   if (~read_reg_flag)               // Lectura
       begin
        case(rt)
            5'd0: dato_B = zero;  // registro zero
            5'd1: dato_B = at;
            5'd2: dato_B = v0;
            5'd3: dato_B = v1;
            5'd4: dato_B = a0;
            5'd5: dato_B = a1;
            5'd6: dato_B = a2;
            5'd7: dato_B = a3;
            5'd8: dato_B = t0;
            5'd9: dato_B = t1;
            5'd10: dato_B = t2;
            5'd11: dato_B = t3;
            5'd12: dato_B = t4;
            5'd13: dato_B = t5;
            5'd14: dato_B = t6;
            5'd15: dato_B = t7;
            5'd16: dato_B = s0;
            5'd17: dato_B = s1;
            5'd18: dato_B = s2;
            5'd19: dato_B = s3;
            5'd20: dato_B = s4;
            5'd21: dato_B = s5;
            5'd22: dato_B = s6;
            5'd23: dato_B = s7;
            5'd24: dato_B = t8;
            5'd25: dato_B = t9;
            5'd26: dato_B = k0;
            5'd27: dato_B = k1;
            5'd28: dato_B = gp;
            5'd29: dato_B = sp;
            5'd30: dato_B = fp;
            5'd31: dato_B = ra;
        endcase
        end
    end


    always @ (negedge clk) begin
    if (~write_reg_flag)
        begin
            case(write_reg)
            5'd01: at = write_data;
            5'd02: v0 = write_data;
            5'd03: v1 = write_data;
            5'd04: a0 = write_data;
            5'd05: a1 = write_data;
            5'd06: a2 = write_data;
            5'd07: a3 = write_data;
            5'd08: t0 = write_data;
            5'd09: t1 = write_data;
            5'd10: t2 = write_data;
            5'd11: t3 = write_data;
            5'd12: t4 = write_data;
            5'd13: t5 = write_data;
            5'd14: t6 = write_data;
            5'd15: t7 = write_data;
            5'd16: s0 = write_data;
            5'd17: s1 = write_data;
            5'd18: s2 = write_data;
            5'd19: s3 = write_data;
            5'd20: s4 = write_data;
            5'd21: s5 = write_data;
            5'd22: s6 = write_data;
            5'd23: s7 = write_data;
            5'd24: t8 = write_data;
            5'd25: t9 = write_data;
            5'd26: k0 = write_data;
            5'd27: k1 = write_data;
            5'd28: gp = write_data;
            5'd29: sp = write_data;
            5'd30: fp = write_data;
            5'd31: ra = write_data;
            endcase
        end
    end

        // assign at_reg =at ;
        // assign v0_reg =v0 ;
        // assign v1_reg =v1 ;
        // assign a0_reg = a0 ;
        // assign a1_reg = a1 ;
        // assign a2_reg = a2 ;
        // assign a3_reg = a3 ;
        // assign t0_reg = t0;
        // assign t1_reg = t1;
        // assign t2_reg = t2;
        // assign t3_reg = t3;
        // assign t4_reg= t4;
        // assign t5_reg =t5;
        // assign t6_reg =t6;
        // assign t7_reg =t7;
        // assign t8_reg = t8;
        // assign t9_reg = t9;
        // assign s0_reg = s0;
        // assign s1_reg = s1;
        // assign s2_reg = s2;
        // assign s3_reg = s3;
        // assign s4_reg = s4;
        // assign s5_reg = s5;
        // assign s6_reg = s6;
        // assign s7_reg = s7;
        // assign k0_reg = k0;
        // assign k1_reg = k1;
        // assign gp_reg = gp;
        // assign sp_reg = sp;
        // assign fp_reg = fp;
        // assign ra_reg = ra;
endmodule
