
class pe_cov;
	
	pe_tx tx;
	mailbox #( pe_tx ) mon2cov1;
	
	covergroup pe_cg;
		A0 : coverpoint tx.a0{
			bins a0 = ( 0 => 1 => 0 => 0 => 0 );	// according to our testcases in the generator.
		}
		A1 : coverpoint tx.a1{
			bins a1 = ( 0 => 0 => 1 => 0 => 0 );	// according to our testcases in the generator.
		}
		A2 : coverpoint tx.a2{
			bins a2 = ( 0 => 0 => 0 => 1 => 0 );	// according to our testcases in the generator.
		}
		A3 : coverpoint tx.a3{
			bins a0 = ( 0 => 0 => 0 => 0 => 1 );	// according to our testcases in the generator.
		}
		Y1 : coverpoint tx.y1{
			bins y1_1 = {0};	
			bins y1_2 = {1};
		}
		Y0 : coverpoint tx.y0{
			bins y0_1 = {0};	
			bins y0_2 = {1};
		}
		VALID : coverpoint tx.v{
			bins v_1 = {0};	
			bins v_2 = {1};
		}
	endgroup
	
	function new( mailbox #( pe_tx ) mon2cov );
		this.mon2cov1 = mon2cov;
		pe_cg = new();
	endfunction
	
	task run();
		forever begin
			mon2cov1.get( tx );
			pe_cg.sample();
		end
	endtask
endclass