
class pe_mon;

	pe_tx tx;
	
	virtual pe_intf vif1;
	mailbox #( pe_tx ) mon2sco1;
	mailbox	#( pe_tx ) mon2cov1;
	
	function new( virtual pe_intf vif, mailbox #( pe_tx ) mon2sco, mailbox #( pe_tx ) mon2cov );
		this.vif1	  = vif;
		this.mon2sco1 = mon2sco;
		this.mon2cov1 = mon2cov;
	endfunction
	
	task run();
		repeat( 5 ) begin
			tx = new();
			#2;
			tx.a0 = vif1.a0;
			tx.a1 = vif1.a1;
			tx.a2 = vif1.a2;
			tx.a3 = vif1.a3;
			#2;
			tx.y0 = vif1.y0;
			tx.y1 = vif1.y1;
			tx.v  = vif1.v;
			
			mon2sco1.put( tx );
			mon2cov1.put( tx );
		end
	endtask
endclass