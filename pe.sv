 
 
 module pe ( a0, a1, a2, a3, y0, y1, v );
	input a0, a1, a2, a3;
	output reg y0, y1, v;
	
	always @( a0, a1, a2, a3 )
	begin
		y1 = a2 | a3;
		y0 = ( a3 | ( ~a2 & a1 ) );
		v  = ( a0 | a1 | a2 | a3 );
	end
 endmodule

 
 /*
 module pe (
    input a0, a1, a2, a3,
    output reg y0, y1, v
);

    always @(*) begin
        // default outputs
        y1 = 0;
        y0 = 0;
        v  = 0;

        // Highest priority first
        if (a3 == 1) begin
            y1 = 1;
            y0 = 1;
            v  = 1;
        end
        else if (a2 == 1) begin
            y1 = 1;
            y0 = 0;
            v  = 1;
        end
        else if (a1 == 1) begin
            y1 = 0;
            y0 = 1;
            v  = 1;
        end
        else if (a0 == 1) begin
            y1 = 0;
            y0 = 0;
            v  = 1;
        end
        // else → defaults (000)
    end

endmodule
*/

/*
module pe (
    input  a0, a1, a2, a3,
    output reg y0, y1, v
);

    always @(*) begin
        // default outputs
        y1 = 0;
        y0 = 0;
        v  = 0;

        casez ({a3, a2, a1, a0})
            4'b1???: begin y1 = 1; y0 = 1; v = 1; end  // a3 has highest priority
            4'b01??: begin y1 = 1; y0 = 0; v = 1; end  // a2
            4'b001?: begin y1 = 0; y0 = 1; v = 1; end  // a1
            4'b0001: begin y1 = 0; y0 = 0; v = 1; end  // a0
            4'b0000: begin y1 = 0; y0 = 0; v = 0; end  // no input active
            default: begin y1 = 0; y0 = 0; v = 0; end
        endcase
    end

endmodule
*/

