module instr_mem (input  logic [31:0] a ,
                  output logic [31:0] rd ) ;
	
    logic [31:0] rom [255:0] ;

    initial
    $readmemh("program_input",rom);

    assign rd = rom[a[9:2]] ;	
				 
endmodule 
