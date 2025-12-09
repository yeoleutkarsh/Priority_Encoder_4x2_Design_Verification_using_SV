
class pe_bfm;

	pe_tx tx;
	
	virtual pe_intf vif1;
	mailbox #( pe_tx ) gen2bfm1;

	function new( virtual pe_intf vif, mailbox #( pe_tx ) gen2bfm );
		this.vif1		= vif;
		this.gen2bfm1	= gen2bfm;
	endfunction
	
	task run();
		forever begin
			gen2bfm1.get( tx );
			drive_dut( tx );
			//tx.display();
		end
	endtask
	
	task drive_dut( pe_tx tx );
		#2;
		vif1.a0 	= tx.a0;
		vif1.a1		= tx.a1;
		vif1.a2		= tx.a2;
		vif1.a3		= tx.a3;
		#2;
		tx.y0		= vif1.y0;
		tx.y1		= vif1.y1;
		tx.v 		= vif1.v;
	endtask
	
endclass