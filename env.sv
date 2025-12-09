
class pe_env;
	
	pe_gen	gen;
	pe_bfm	bfm;
	pe_mon	mon;
	pe_sco  sco;
	pe_cov  cov;  // we can have the coverage also.
	
	mailbox #( pe_tx ) gen2bfm;
	mailbox #( pe_tx ) mon2sco;
	mailbox #( pe_tx ) mon2cov;
	
	function new(virtual pe_intf vif, string testname );
		gen2bfm	= new();
		mon2sco = new();
		mon2cov = new();
		gen		= new( testname, gen2bfm );
		bfm		= new( vif	   , gen2bfm );
		mon		= new( vif	   , mon2sco, mon2cov );
		sco		= new( 			 mon2sco );
		cov		= new(           mon2cov );
	endfunction
	
	task run();
		fork
			gen.run();
			bfm.run();
			mon.run();
			sco.run(); 
			cov.run();
		join
	endtask
	
endclass