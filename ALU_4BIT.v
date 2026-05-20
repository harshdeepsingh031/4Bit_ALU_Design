`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2026 07:24:54 PM
// Design Name: 
// Module Name: ALU_4BIT
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


module ALU_4BIT(
    input [3:0] A,
    input [3:0] B,
    input [3:0] ALU_sel,
    output [3:0] ALU_OUT,
    output Carryout
    );
reg [3:0] ALU_result;
wire[4:0] tmp;
assign ALU_OUT= ALU_result;
assign tmp = {1'b0,A} + {1'b0,B};
assign Carryout = tmp[4];
always @(*)
begin
     case(ALU_sel)
     4'b0000:// addition
         ALU_result = A + B;
     4'b0001:// subtraction
          ALU_result = A - B;
     4'b0010:// Multiplication
          ALU_result = A * B;
     4'b0011://Divison
          ALU_result = A/B;
     4'b0100://Logical shift left
          ALU_result = A<<1;
     4'b0101:// logical shift right
          ALU_result = A>>1;
     4'b0110:// rotate left
          ALU_result = {A[2:0],A[3]};
     4'b0111: // rotate right
          ALU_result = {A[0],A[3:1]};
      4'b1000:  // logical and
          ALU_result = A & B ;
      4'b1001: //logical or
          ALU_result = A | B;
      4'b1010: //logical xor
          ALU_result = A ^ B;
      4'b1011: //logical nor
          ALU_result = ~(A | B);
      4'b1100:// logical nand
           ALU_result =  ~( A & B);
      4'b1101: // logical xnor
           ALU_result = ~(A ^ B);
      4'b1110:// greater comparison
           ALU_result = (A>B)?4'd1:4'd0;
      4'b1111: // equal comparison
           ALU_result = (A==B)?4'D1:4'D0 ;
        default: ALU_result = A + B;
       endcase
     end
endmodule                

