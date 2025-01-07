module alu (input  logic [31:0] in1 , in2 ,
            input  logic [3:0]  alu_control ,
            input  logic IR_diff ,
			output logic zero ,
			output logic [31:0] alu_result) ;
  
 
  // R_Type Instructions 
  
  parameter ADD  = 4'b0000 ;   // Addition 
  parameter SUB  = 4'b0001 ;   // Subtraction 
  parameter SLL  = 4'b0010 ;   // Shift Left Logical
  parameter SLT  = 4'b0011 ;   // Set Less Than
  parameter SLTU = 4'b0100 ;   // Set Less Than Unsigned 
  parameter XOR  = 4'b0101 ;   // XOR
  parameter SRA  = 4'b0110 ;   // Shift Right Arithmetic
  parameter OR   = 4'b0111 ;   // OR
  parameter AND  = 4'b1000 ;   // AND
  parameter SRL  = 4'b1001 ;   // Shift Right Logical
  
  
  
  // I_Type Instruction 
  
  parameter LW    = 3'b000 ;
  parameter ADDI  = 3'b001 ;
  parameter SLLI  = 3'b010 ;
  parameter SLTIA = 3'b011 ;
  parameter XORI  = 3'b100 ;
  parameter SRLI  = 3'b101 ;
  parameter ORI   = 3'b110 ;
  parameter ANDI  = 3'b111 ;
  
  
  
  assign zero = (alu_result == 0) ;     // Zero Flag 
  
  
  
  always_comb(*) begin 
  
     if (!IR_diff) begin 
	 
	     case (alu_control) begin 
             ADD : alu_result = in1 + in2 ;
			 SUB : alu_result = in1 - in2 ; 
			 SLL : alu_result = { in1[in2:0] , {in2{1'b0}}}
         end		 
	
	 end
	 
  end
	