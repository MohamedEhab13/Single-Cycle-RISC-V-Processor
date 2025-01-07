module top (input  logic        clk , reset ,
            output logic [31:0] wr_data     ,
			output logic [31:0] data_addr   ,
			output logic        mem_write   
			);

        logic [31:0] instr , rd_data , pc;
  
        single_risc my_risc(clk , reset , instr , rd_data , pc , data_addr , wr_data , mem_write);
		
		instr_mem instruction_memory(pc , instr) ;
		
		data_mem data_memory(clk , data_addr , wr_data , mem_write , rd_data) ;

endmodule