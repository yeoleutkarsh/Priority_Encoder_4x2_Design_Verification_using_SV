
class pe_gen;

	pe_tx tx;
	
	mailbox #( pe_tx ) gen2bfm1;
	string name;

	function new( string testname, mailbox #( pe_tx ) gen2bfm );
		this.gen2bfm1	= gen2bfm;
		this.name		= testname;
	endfunction
	
	task run();
		case( name )
			"first" : begin
				tx = new();
				assert( tx.randomize() with { a0==0; a1==0; a2==0; a3==0;} );	// testcase 1
				gen2bfm1.put( tx );
				
				tx = new();
				assert( tx.randomize() with { a0==1; a1==0; a2==0; a3==0;} );	// testcase 2
				gen2bfm1.put( tx );
				
				tx = new();
				assert( tx.randomize() with { a0==0; a1==1; a2==0; a3==0;} );	// testcase 3
				gen2bfm1.put( tx );
				
				tx = new();
				assert( tx.randomize() with { a0==0; a1==0; a2==1; a3==0;} );	// testcase 4
				gen2bfm1.put( tx );
				
				tx = new();
				assert( tx.randomize() with { a0==0; a1==0; a2==0; a3==1;} );	// testcase 5
				gen2bfm1.put( tx );
			end
		endcase
	endtask
endclass