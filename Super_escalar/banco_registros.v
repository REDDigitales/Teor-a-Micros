`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 09:12:01 PM
// Design Name: 
// Module Name: banco_registros
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


module banco_registros(

    input clk,
    input read_reg_flag_1,
    input write_reg_flag_1,
    input read_reg_flag_2,
    input write_reg_flag_2,
    
    input [4:0] write_reg_1,
    input [31:0] write_data_1,
    input [4:0] write_reg_2,
    input [31:0] write_data_2,
    
    input [4:0] rs_1,
    input [4:0] rt_1,
    input [4:0] rs_2,
    input [4:0] rt_2,
    
    output reg [31:0] dato_A1,
    output reg [31:0] dato_B1,
    output reg [31:0] dato_A2,
    output reg [31:0] dato_B2

    );

   reg [31:0] at,v0,v1,a0,a1,a2,a3,t0,t1,t2,t3,t4,t5,t6;
   reg [31:0] t7,t8,t9,s0,s1,s2,s3,s4,s5,s6,s7,k0,k1,gp,sp,fp,ra,zero;

   // Valores iniciales de registros
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


   // Lectura Registros
   always@(*)
   begin

    if (~read_reg_flag_1)               // Lectura
        begin
        case(rs_1)
        5'd0: dato_A1 = zero;  // registro zero
        5'd1: dato_A1 = at;
        5'd2: dato_A1 = v0;
        5'd3: dato_A1 = v1;
        5'd4: dato_A1 = a0;
        5'd5: dato_A1 = a1;
        5'd6: dato_A1 = a2;
        5'd7: dato_A1 = a3;
        5'd8: dato_A1 = t0;
        5'd9: dato_A1 = t1;
        5'd10: dato_A1 = t2;
        5'd11: dato_A1 = t3;
        5'd12: dato_A1 = t4;
        5'd13: dato_A1 = t5;
        5'd14: dato_A1 = t6;
        5'd15: dato_A1 = t7;
        5'd16: dato_A1 = s0;
        5'd17: dato_A1 = s1;
        5'd18: dato_A1 = s2;
        5'd19: dato_A1 = s3;
        5'd20: dato_A1 = s4;
        5'd21: dato_A1 = s5;
        5'd22: dato_A1 = s6;
        5'd23: dato_A1 = s7;
        5'd24: dato_A1 = t8;
        5'd25: dato_A1 = t9;
        5'd26: dato_A1 = k0;
        5'd27: dato_A1 = k1;
        5'd28: dato_A1 = gp;
        5'd29: dato_A1 = sp;
        5'd30: dato_A1 = fp;
        5'd31: dato_A1 = ra;
        endcase
        end
    end

  always@(*)
  begin

   if (~read_reg_flag_1)               // Lectura
       begin
        case(rt_1)
            5'd0: dato_B1 = zero;  // registro zero
            5'd1: dato_B1 = at;
            5'd2: dato_B1 = v0;
            5'd3: dato_B1 = v1;
            5'd4: dato_B1 = a0;
            5'd5: dato_B1 = a1;
            5'd6: dato_B1 = a2;
            5'd7: dato_B1 = a3;
            5'd8: dato_B1 = t0;
            5'd9: dato_B1 = t1;
            5'd10: dato_B1 = t2;
            5'd11: dato_B1 = t3;
            5'd12: dato_B1 = t4;
            5'd13: dato_B1 = t5;
            5'd14: dato_B1 = t6;
            5'd15: dato_B1 = t7;
            5'd16: dato_B1 = s0;
            5'd17: dato_B1 = s1;
            5'd18: dato_B1 = s2;
            5'd19: dato_B1 = s3;
            5'd20: dato_B1 = s4;
            5'd21: dato_B1 = s5;
            5'd22: dato_B1 = s6;
            5'd23: dato_B1 = s7;
            5'd24: dato_B1 = t8;
            5'd25: dato_B1 = t9;
            5'd26: dato_B1 = k0;
            5'd27: dato_B1 = k1;
            5'd28: dato_B1 = gp;
            5'd29: dato_B1 = sp;
            5'd30: dato_B1 = fp;
            5'd31: dato_B1 = ra;
        endcase
        end
    end

 always@(*)
   begin

    if (~read_reg_flag_2)               // Lectura
        begin
        case(rs_2)
        5'd0: dato_A2 = zero;  // registro zero
        5'd1: dato_A2 = at;
        5'd2: dato_A2 = v0;
        5'd3: dato_A2 = v1;
        5'd4: dato_A2 = a0;
        5'd5: dato_A2 = a1;
        5'd6: dato_A2 = a2;
        5'd7: dato_A2 = a3;
        5'd8: dato_A2 = t0;
        5'd9: dato_A2 = t1;
        5'd10: dato_A2 = t2;
        5'd11: dato_A2 = t3;
        5'd12: dato_A2 = t4;
        5'd13: dato_A2 = t5;
        5'd14: dato_A2 = t6;
        5'd15: dato_A2 = t7;
        5'd16: dato_A2 = s0;
        5'd17: dato_A2 = s1;
        5'd18: dato_A2 = s2;
        5'd19: dato_A2 = s3;
        5'd20: dato_A2 = s4;
        5'd21: dato_A2 = s5;
        5'd22: dato_A2 = s6;
        5'd23: dato_A2 = s7;
        5'd24: dato_A2 = t8;
        5'd25: dato_A2 = t9;
        5'd26: dato_A2 = k0;
        5'd27: dato_A2 = k1;
        5'd28: dato_A2 = gp;
        5'd29: dato_A2 = sp;
        5'd30: dato_A2 = fp;
        5'd31: dato_A2 = ra;
        endcase
        end
    end

  always@(*)
  begin

   if (~read_reg_flag_2)               // Lectura
       begin
        case(rt_2)
            5'd0: dato_B2 = zero;  // registro zero
            5'd1: dato_B2 = at;
            5'd2: dato_B2 = v0;
            5'd3: dato_B2 = v1;
            5'd4: dato_B2 = a0;
            5'd5: dato_B2 = a1;
            5'd6: dato_B2 = a2;
            5'd7: dato_B2 = a3;
            5'd8: dato_B2 = t0;
            5'd9: dato_B2 = t1;
            5'd10: dato_B2 = t2;
            5'd11: dato_B2 = t3;
            5'd12: dato_B2 = t4;
            5'd13: dato_B2 = t5;
            5'd14: dato_B2 = t6;
            5'd15: dato_B2 = t7;
            5'd16: dato_B2 = s0;
            5'd17: dato_B2 = s1;
            5'd18: dato_B2 = s2;
            5'd19: dato_B2 = s3;
            5'd20: dato_B2 = s4;
            5'd21: dato_B2 = s5;
            5'd22: dato_B2 = s6;
            5'd23: dato_B2 = s7;
            5'd24: dato_B2 = t8;
            5'd25: dato_B2 = t9;
            5'd26: dato_B2 = k0;
            5'd27: dato_B2 = k1;
            5'd28: dato_B2 = gp;
            5'd29: dato_B2 = sp;
            5'd30: dato_B2 = fp;
            5'd31: dato_B2 = ra;
        endcase
        end
    end



    // Escritura Registro
    
    always @ (negedge clk) begin
    if (~write_reg_flag_1)
        begin
            case(write_reg_1)
            5'd01: at = write_data_1;
            5'd02: v0 = write_data_1;
            5'd03: v1 = write_data_1;
            5'd04: a0 = write_data_1;
            5'd05: a1 = write_data_1;
            5'd06: a2 = write_data_1;
            5'd07: a3 = write_data_1;
            5'd08: t0 = write_data_1;
            5'd09: t1 = write_data_1;
            5'd10: t2 = write_data_1;
            5'd11: t3 = write_data_1;
            5'd12: t4 = write_data_1;
            5'd13: t5 = write_data_1;
            5'd14: t6 = write_data_1;
            5'd15: t7 = write_data_1;
            5'd16: s0 = write_data_1;
            5'd17: s1 = write_data_1;
            5'd18: s2 = write_data_1;
            5'd19: s3 = write_data_1;
            5'd20: s4 = write_data_1;
            5'd21: s5 = write_data_1;
            5'd22: s6 = write_data_1;
            5'd23: s7 = write_data_1;
            5'd24: t8 = write_data_1;
            5'd25: t9 = write_data_1;
            5'd26: k0 = write_data_1;
            5'd27: k1 = write_data_1;
            5'd28: gp = write_data_1;
            5'd29: sp = write_data_1;
            5'd30: fp = write_data_1;
            5'd31: ra = write_data_1;
            endcase
        end
    end


    always @ (negedge clk) begin
    if (~write_reg_flag_2)
        begin
            case(write_reg_2)
            5'd01: at = write_data_2;
            5'd02: v0 = write_data_2;
            5'd03: v1 = write_data_2;
            5'd04: a0 = write_data_2;
            5'd05: a1 = write_data_2;
            5'd06: a2 = write_data_2;
            5'd07: a3 = write_data_2;
            5'd08: t0 = write_data_2;
            5'd09: t1 = write_data_2;
            5'd10: t2 = write_data_2;
            5'd11: t3 = write_data_2;
            5'd12: t4 = write_data_2;
            5'd13: t5 = write_data_2;
            5'd14: t6 = write_data_2;
            5'd15: t7 = write_data_2;
            5'd16: s0 = write_data_2;
            5'd17: s1 = write_data_2;
            5'd18: s2 = write_data_2;
            5'd19: s3 = write_data_2;
            5'd20: s4 = write_data_2;
            5'd21: s5 = write_data_2;
            5'd22: s6 = write_data_2;
            5'd23: s7 = write_data_2;
            5'd24: t8 = write_data_2;
            5'd25: t9 = write_data_2;
            5'd26: k0 = write_data_2;
            5'd27: k1 = write_data_2;
            5'd28: gp = write_data_2;
            5'd29: sp = write_data_2;
            5'd30: fp = write_data_2;
            5'd31: ra = write_data_2;
            endcase
        end
    end

  
endmodule
