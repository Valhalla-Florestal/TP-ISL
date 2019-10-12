module Display_7_Segmentos_XYLO (a,b,c,d,s0);
   input wire a,b,c,d;
   output reg [6:0] s0;

	
   always @ (*) begin
		if ((a == 0) && (b == 0) && (c == 0)) begin
			s0[0] = 1;
			s0[1] = 1;
			s0[2] = 1;
			s0[3] = 1;
			s0[4] = 1;
			s0[5] = 1;
			s0[6] = 1;
			
		end

		else begin			
			s0[0] = (d | (~a & ~b & ~c));	
			s0[1] = ((a & ~c & d) | (~a & ~b & ~c) | (a & b & ~d) | (~a & b & c) | (~a & c & ~d));
			s0[2] = ((~a & ~c) | (b & ~c) | (b & d) | (a & c & d));
			s0[3] = ((~a & ~b) | (c & ~d) | (~a & ~d) | (~b & ~d));
			s0[4] = ((~a & ~b) | (a & b & ~c) | (b & ~c & d) | (~b & c & ~d));
			s0[5] = ((~b & d) | (~a & b & c) | (~a & ~b & ~c) | (a & ~b & c) | (a & b & ~c & ~d));
			s0[6] = ((~a & ~b & ~c) | (a & ~b & ~d) | (a & b & c));           
		end
	end
endmodule // Notas

