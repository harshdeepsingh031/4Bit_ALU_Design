`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2026 07:32:49 PM
// Design Name: 
// Module Name: TB_ALU_4BIT
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



module TB_ALU_4BIT;

reg [3:0] A, B;
reg [3:0] ALU_sel;
wire [3:0] ALU_OUT;
wire Carryout;

ALU_4BIT uut (
    .A(A),
    .B(B),
    .ALU_sel(ALU_sel),
    .ALU_OUT(ALU_OUT),
    .Carryout(Carryout)
);

initial begin
    A = 4'b0011; B = 4'b0001;
    
    ALU_sel = 4'b0000; #200;
    ALU_sel = 4'b0001; #200;
    ALU_sel = 4'b0010; #200;
    ALU_sel = 4'b0011; #200;
    ALU_sel = 4'b0100; #200;
    ALU_sel = 4'b0101; #200;
    ALU_sel = 4'b0111; #200;
    ALU_sel = 4'b1000; #200;
    ALU_sel = 4'b1001; #200;
    ALU_sel = 4'b1010; #200;
    ALU_sel = 4'b1011; #200;
    ALU_sel = 4'b1100; #200;
    ALU_sel = 4'b1101; #200;
    ALU_sel = 4'b1110; #200;
    ALU_sel = 4'b1111; #200;
    $finish;
end

endmodule

   


