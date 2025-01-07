module alu_decoder (input  logic [1:0] alu_op , 
                    input  logic [2:0] funct3 ,
                    input  logic       funct7 ,
					input  logic       op_b5  ,
					output logic [2:0] alu_control 
                    );
		
        always_comb begin 
            case (alu_op)  
			    2'b00 : alu_control = 3'b000 ;
				2'b01 : alu_control = 3'b001 ;
				2'b10 : begin 
				          case (funct3)  			 
					      3'b000 : begin 
					        if (funct7 & op_b5) 
							    alu_control = 3'b001 ; // subtract 
							else 
                                alu_control = 3'b000 ; // add , addi 
							end							
						  3'b110  : alu_control = 3'b011 ; // or , ori 
						  3'b111  : alu_control = 3'b010 ; // and , andi
						  default : alu_control = 3'bxxx ;
					      endcase 
					 end
				default : alu_control = 3'bxxx ;
			endcase
        end		
				
endmodule
