module single_risc (input  logic        clk , reset ,
                    input  logic [31:0] instr       ,
					input  logic [31:0] rd_data     ,
					output logic [31:0] pc          ,
					output logic [31:0] alu_result  ,
				    output logic [31:0] wr_data     ,
					output logic        mem_write   
				    );

        logic zero , jump , reg_write , alu_src ;
        logic [1:0] pc_src , result_src , imm_src ;
        logic [2:0] alu_control ;

        controller single_risc_controller (instr[6:0] , instr[14:12] , instr[30] , zero , pc_src , result_src , 
		                                   mem_write , jump , alu_control , alu_src , imm_src , reg_write );
										   
        data_path single_risc_data_path (clk , reset , pc_src , result_src , mem_write , alu_control , alu_src , imm_src , reg_write ,
				                         instr , rd_data , zero , pc , alu_result , wr_data ) ;

endmodule 