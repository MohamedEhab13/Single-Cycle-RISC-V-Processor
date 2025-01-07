module main_decoder (input  logic       zero       ,
                     input  logic [6:0] op         ,
					 output logic       branch     ,
					 output logic       jump       ,
                     output logic [1:0] result_src ,
                     output logic       mem_write  ,
                     output logic 		alu_src    ,
					 output logic [1:0] imm_src    ,
					 output logic       reg_write  ,
					 output logic [1:0] alu_op 
                     );
        
		localparam lw     = 7'b0000011;  // Load Word
        localparam sw     = 7'b0100011;  // Store Word
        localparam r_type = 7'b0110011;  // R_type
        localparam b_type = 7'b1100011;  // beq and bne
		localparam i_type = 7'b0010011;  // addi , andi , ori
		localparam jal    = 7'b1101111;  // Jump and link
		localparam jalr   = 7'b1100111;  // Jump and link register 
	
	
	    always_comb begin 
             case (op) 
			 
			    lw : begin 
				    reg_write  = 1'b1  ;
                    imm_src    = 2'b00 ;
					mem_write  = 1'b0  ;
					result_src = 2'b01 ;
					branch     = 1'b0  ;
					alu_op     = 2'b00 ;
					jump       = 1'b0  ;
					alu_src    = 1'b1  ;
				end
				
				sw : begin 
				    reg_write  = 1'b0  ;
                    imm_src    = 2'b01 ;
					mem_write  = 1'b1  ;
					result_src = 2'bxx ;
					branch     = 1'b0  ;
					alu_op     = 2'b00 ;
					jump       = 1'b0  ;
					alu_src    = 1'b1  ;
				end
				
				lw : begin 
				    reg_write  = 1'b1  ;
                    imm_src    = 2'b00 ;
					mem_write  = 1'b0  ;
					result_src = 2'b01 ;
					branch     = 1'b0  ;
					alu_op     = 2'b00 ;
					jump       = 1'b0  ;
					alu_src    = 1'b1  ;
				end
				
				r_type : begin 
				    reg_write  = 1'b1  ;
                    imm_src    = 2'bxx ;
					mem_write  = 1'b0  ;
					result_src = 2'b00 ;
					branch     = 1'b0  ;
					alu_op     = 2'b10 ;
					jump       = 1'b0  ;
					alu_src    = 1'b0 ;
				end
				
				b_type : begin 
				    reg_write  = 1'b0  ;
                    imm_src    = 2'b10 ;
					mem_write  = 1'b0  ;
					result_src = 2'bxx ;
					branch     = 1'b1  ;
					alu_op     = 2'b01 ;
					jump       = 1'b0  ;
					alu_src    = 1'b0  ;
				end
				
				i_type : begin 
				    reg_write  = 1'b1  ;
                    imm_src    = 2'b00 ;
					mem_write  = 1'b0  ;
					result_src = 2'b00 ;
					branch     = 1'b0  ;
					alu_op     = 2'b10 ;
					jump       = 1'b0  ;
					alu_src    = 1'b1  ;
				end
				
				jal : begin 
				    reg_write  = 1'b1  ;
                    imm_src    = 2'b11 ;
					mem_write  = 1'b0  ;
					result_src = 2'b10 ;
					branch     = 1'b0  ;
					alu_op     = 2'bxx ;
					jump       = 1'b1  ;
					alu_src    = 1'bx  ;
				end
				
				jalr : begin 
				    reg_write  = 1'b1  ;
                    imm_src    = 2'b00 ;
					mem_write  = 1'b0  ;
					result_src = 2'b10 ;
					branch     = 1'b0  ;
					alu_op     = 2'b00 ;
					jump       = 1'b1  ;
					alu_src    = 1'b1  ;
				end
				
				default : begin 
				    reg_write  = 1'bx  ;
                    imm_src    = 2'bxx ;
					mem_write  = 1'bx  ;
					result_src = 2'bxx ;
					branch     = 1'bx  ;
					alu_op     = 2'bxx ;
					jump       = 1'bx  ;
					alu_src    = 1'bx  ;
				end
			 endcase
        end
endmodule 