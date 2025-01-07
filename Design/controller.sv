module controller (input  logic [6:0] op          ,
                   input  logic [2:0] funct3      ,
                   input  logic       funct7      ,
				   input  logic       zero        ,
				   output logic [1:0] pc_src      ,
				   output logic [1:0] result_src  ,
				   output logic       mem_write   ,
				   output logic       jump        ,
				   output logic [2:0] alu_control ,
                   output logic       alu_src     ,
				   output logic [1:0] imm_src     ,
				   output logic       reg_write
                   );
				   
	    logic branch ; 
        logic [1:0] alu_op ;

        // ALU Decoder Instantiation
        alu_decoder my_ad (alu_op , funct3 , funct7 , op[5] , alu_control) ; 

        // Main Decoder Instantiation
        main_decoder my_md (zero , op , branch , jump , result_src , mem_write , alu_src , imm_src , reg_write , alu_op) ;

        assign beq_flag  = (branch & zero) ? 1'b1 : 1'b0 ;
        assign bne_flag  = (branch & !zero & funct3 == 3'b001) ? 1'b1 : 1'b0 ;
        assign jalr_flag = (op == 7'b1100111 ) ? 1'b1 : 1'b0 ;
		
		always_comb begin 
            if (jalr_flag) 
			    pc_src = 2'b10 ;
			else if (beq_flag | bne_flag | jump)
			    pc_src = 2'b01 ;
			else 
			    pc_src = 2'b00 ;
        end		
				   
endmodule 
