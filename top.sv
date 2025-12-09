
module top;

	pe_intf vif();			// interface 
	
	pe dut (				// Design
		.a0( vif.a0 ),
		.a1( vif.a1 ),
		.a2( vif.a2 ),
		.a3( vif.a3 ),
		.y0( vif.y0 ),
		.y1( vif.y1 ),
		.v ( vif.v  )
	);
	
	pe_tb tb ( vif );		// program block 
	
	// assertion connection perform here.
	pe_assertion a1 (
		.a0( vif.a0 ),
		.a1( vif.a1 ),
		.a2( vif.a2 ),
		.a3( vif.a3 ),
		.y0( vif.y0 ),
		.y1( vif.y1 ),
		.v ( vif.v  )
	);
endmodule