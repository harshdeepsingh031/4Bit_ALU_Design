# What is an ALU?
An ALU (Arithmetic Logic Unit) is the computational heart of every processor. It performs all the math and logic that a CPU needs to run programs.

# In this project we builds a 4-bit ALU from scratch in Verilog that:
Takes two 4-bit binary inputs — A and B
Uses a 4-bit selector (SEL) to choose from 16 different operations
Outputs a 4-bit result with status flags (Carry, Zero)
Is fully verified through Vivado Behavioral Simulation with waveform output

# All 16 Operations
# SEl(4-bit)           # opertion              #Expression           #Description
  0000                   Addition                A+B                   Adds A and B
  0001                   Subtraction             A-B                   subtract B from A
  0010                   Multiplication          A*B                   Multiply A and B
  0011                   Divison                 A/B                   Divide A and B
  0100                   Logical shift left      A<<1                  Logical Shift left A by 1 one bit
  0101                   Logical shift Right     A>>1                  Logical Shift right A by 1 one bit
  0110                   Rotate Left             {A[2:0],A[3]}         rotate left A
  0111                   Rotate right            {A[0],A[3:1]}         rotate right A
  1000                   AND                      A & B                Bitwise AND
  1001                   OR                       A | B                Bitwise OR
  1010                   XOR                      A ^ B                Bitwise XOR
  1011                   NOR                     ~(A | B)              Bitwise NOR
  1100                   NAND                    ~(A & B )             Bitwise NAND
  1101                   XNOR                    ~(A ^ B)              Bitwise XNOR
  1110                  Greater comparison       (A>B)?4'd1:d0         Comparison between A and B
  1111                  Equal Comparison          (A=B)?4'd1:d0        Equal Comparison between A nd B

  # Port Description

  # Port                  # Width                 # Direction          # Description
    A                       4 Bit                    Input                First Operand
    B                       4 Bit                    Input                Second Operand
    ALU_SEL                 4 Bit                    Input                Selects one of 16 opertion
    ALU_OUT                 4 Bit                    Output               ouput of selected line
    Carryout                1 Bit                    Output               Carry out from ADD and Borrow from SUB

 # Tools & Technologies
Tool  Xilinx Vivado - HDL design entry and simulation
Verilog HDL - Hardware description language 
Behavioral Simulation - Functional verification via waveform

# Verilog Source code
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

# Testbench Code
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

#  How to Run Simulation in Vivado
Step 1 — Create Project
Open Vivado - Click Create Project
Select RTL Project -choose Do not specify sources at this time
Select your target device/board

Step 2 — Add Files
Click Add Sources - Add Design Sources → add src/alu.v
Click Add Sources again → Add Simulation Sources - add testbench/alu_tb.v

Step 3 — Run Simulation

In Flow Navigator (left panel) - click Run Simulation
Select Run Behavioral Simulation
In the waveform window - right-click - Add All Signals
Click Run All
Check the waveform — verify all 16 operations produce correct output

# Simulation Waveforms
<img width="1907" height="996" alt="ALU output" src="https://github.com/user-attachments/assets/4b60bce2-922b-4e08-be63-79c89ddec75d" />
# ALU OUTPUT

<img width="1902" height="894" alt="layout design" src="https://github.com/user-attachments/assets/d74e163b-70c1-44fb-be38-45f3ed23d93f" />
 # ALU LAYOUT DESIGN

 <img width="1580" height="801" alt="sechmatic design" src="https://github.com/user-attachments/assets/d5c8ceea-c75e-4050-adee-f93f39ff3034" />
 # SECHMATIC DESIGN

# Key Concepts Covered

Verilog HDL — writing clean combinational logic using always @(*) and case
Arithmetic operations — binary addition, subtraction, 2's complement
Bitwise logic — AND, OR, XOR, NAND, NOR, XNOR, NOT
Shift operations — SHL (left shift), SHR (right shift)
Comparison logic — greater than, equal to
Status flags — Carry out, Zero detection
Vivado simulation — testbench writing, waveform analysis

#  About
This project was built as part of a Digital Logic Design / Computer Organization course to understand how an ALU works at the hardware level — from writing Verilog code to verifying it with simulation waveforms in Vivado.
   
