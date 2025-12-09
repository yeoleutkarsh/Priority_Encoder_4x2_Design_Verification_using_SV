
class pe_sco;
	
	pe_tx tx;
	pe_tx ref_tx;
	
	mailbox #( pe_tx ) mon2sco1;

	function new( mailbox #( pe_tx) mon2sco );
		this.mon2sco1 = mon2sco;
	endfunction
	
	task run();
		repeat( 5 ) begin
			mon2sco1.get( tx );	// contain actual data form DUT.
			ref_tx = new();
			tx.copy( ref_tx );	// copying the tx data into the ref_tx.
			
			// write our own logic.
			ref_tx.y1 = ref_tx.a2 | ref_tx.a3;
			ref_tx.y0 = ref_tx.a3 | ( ~ref_tx.a2 & ref_tx.a1 );
			ref_tx.v  = ref_tx.a0 | ref_tx.a1 | ref_tx.a2 | ref_tx.a3;
			
			if( tx.compare( ref_tx ) )
			begin
				tx.display("ACTUAL DATA");
				ref_tx.display("EXPECTED DATA");
				$display("Scoreboard Pass.");
			end
			else
			begin
				tx.display("ACTUAL DATA");
				ref_tx.display("EXPECTED DATA");
				$display("Scoreboard Fail.");
			end
			$display("**********************************************");
		end
	endtask
endclass