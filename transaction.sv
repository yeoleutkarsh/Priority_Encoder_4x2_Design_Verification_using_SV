
class pe_tx;
	
	rand bit a0;
	rand bit a1;
	rand bit a2;
	rand bit a3;
	
		bit y0;
		bit y1;
		bit v;
		
	function void display( string name );
		$display("[%s] :: a3=%0d a2=%0d a1=%0d a0=%0d -> y1=%0d y0=%0d v=%0d", name, a3, a2, a1, a0, y1, y0, v);
	endfunction
	
	// copy method - bcz only i/p is randomized
	function void copy( output pe_tx tx );
		tx = new();
		tx.a0 = a0;
		tx.a1 = a1;
		tx.a2 = a2;
		tx.a3 = a3;
	endfunction
	
	// compare method
	function bit compare( pe_tx tx );
		if( (a0==tx.a0) && (a1==tx.a1) && (a2==tx.a2) && (a3==tx.a3) &&
			(y1==tx.y1) && (y0==tx.y0) && (v==tx.v) 
		) begin
			return 1;
		end
		else begin
			return 0; 
		end
	endfunction
endclass