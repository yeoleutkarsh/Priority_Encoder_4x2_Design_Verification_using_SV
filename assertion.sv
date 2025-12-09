
module pe_assertion( a0, a1, a2, a3, y0, y1, v );
	
	input a0, a1, a2, a3;
	input y0, y1, v;
	
	// immediate assertion -bcz it is combinational ckt
	always @(*) 
	begin
		// 1) Case when No input is active
		#2;
		if( a0==0 && a1==0 && a2==0 && a3==0 ) 
		begin
			A1: assert ( y1==0 && y0==0 && v==0 ) begin
					$display(" -> Assertion Pass ( a0==0, a1==0, a2==0, a3==0 )");	
				end
				else begin
					$warning(" -> Assertion Failed ( a0==0, a1==0, a2==0, a3==0 )");
				end
		end
		// 2) Case when a0 input is active
		else if( a0==1 && a1==0 && a2==0 && a3==0 ) 
		begin
			A2: assert ( y1==0 && y0==0 && v==1 ) begin
					$display(" -> Assertion Pass ( a0==1, a1==0, a2==0, a3==0 )");
				end
				else begin
					$warning(" -> Assertion Failed ( a0==1, a1==0, a2==0, a3==0 )");
				end
		end
		// 3) Case when a1 input is active( priority over a0 )
		else if( a1==1 && a2==0 && a3==0 ) 
		begin
			A3: assert ( y1==0 && y0==1 && v==1 ) begin
					$display(" -> Assertion Pass ( a0==x, a1==1, a2==0, a3==0 )");	
				end
				else begin
					$warning(" -> Assertion Failed ( a0==x, a1==1, a2==0, a3==0 )");
				end
		end
		// 4) Case when a2 input is active( priority over a1, a0 )
		else if( a2==1 && a3==0 ) begin
			A4: assert ( y1==1 && y0==0 && v==1 ) begin
					$display(" -> Assertion Pass ( a0==x, a1==x, a2==1, a3==0 )");
				end
				else begin
					$warning(" -> Assertion Failed ( a0==x, a1==x, a2==1, a3==0 )");
				end
		end		
		// 5) Case when a3 input is active( priority over a2, a1, a0 )( highest priority )
		else if( a3==1 ) begin
			A5: assert ( y1==1 && y0==1 && v==1 ) begin
					$display(" -> Assertion Pass ( a0==x, a1==x, a2==x, a3==1 )");	
				end
				else begin
					$warning(" -> Assertion Failed ( a0==x, a1==x, a2==x, a3==1 )");
				end
		end
		else
			$warning(" -> Unexpected input combination.");
	end
endmodule