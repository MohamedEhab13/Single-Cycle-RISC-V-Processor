module testbench () ;

    logic clk , reset ; 
	logic [31:0] wr_data , data_addr ;
	logic mem_write ;
	
	top dut(clk , reset , wr_data , data_addr , mem_write);

    // initialize test
     initial begin
         reset <= 1; # 22; reset <= 0;
     end
	 
     // generate clock to sequence tests
     always begin
         clk <= 1; # 5; clk <= 0; # 5;
     end  
    
	initial begin 
   #900  for (int i = 0 ; i < 19 ; i++) begin  
      $display ("Data Memory        [%0d] %0d",i,dut.data_memory.ram[i]);
	  $display ("Instr Memory       [%0d] %0h",i,dut.instruction_memory.rom[i]);
      $display ("reg file  register [%0d] = %0d",     
           i,dut.my_risc.single_risc_data_path.my_rf.registers[i]);
	  $display ("pc_src %0d" , dut.my_risc.single_risc_data_path.pc_src) ;	  
      $display ("pc_next %0d  pc %0d" , dut.my_risc.single_risc_data_path.pc_next , dut.my_risc.single_risc_data_path.pc) ;	  
	  $display ("Instruction %0x" , dut.my_risc.single_risc_data_path.instr) ;
	  $display ("alu_result %0d" , dut.my_risc.single_risc_data_path.my_alu.alu_result) ;
$display ("_______________________________________________");
    end
	#50 $finish ;
  end

endmodule 
