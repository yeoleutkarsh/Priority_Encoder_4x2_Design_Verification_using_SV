
program pe_tb( pe_intf vif );
	
	pe_env env;
	string testname;
	
	initial begin
		$value$plusargs("testname=%s", testname);
		env = new( vif, testname );
		env.run();
	end
	
endprogram