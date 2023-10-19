module part1(input Clock, 
				input Enable, 
				input Reset, 
				output [7:0]CounterValue //cv[7] = msb, cv[0] = lsb
				); 
		
		wire [6:0] inter; // has length n - 2 
		tflipflop u0 (.clk(Clock), .t(Enable), .reset(Reset), .q(CounterValue[0]));
		
		assign inter[0] = Enable & CounterValue[0];
		tflipflop u1 (.clk(Clock), .t(inter[0]), .reset(Reset), .q(CounterValue[1]));
		
		assign inter[1] = inter[0] & CounterValue[1];
		tflipflop u2 (.clk(Clock), .t(inter[1]), .reset(Reset), .q(CounterValue[2]));
		
		assign inter[2] = inter[1] & CounterValue[2]; 
		tflipflop u3 (.clk(Clock), .t(inter[2]), .reset(Reset), .q(CounterValue[3]));
		
		assign inter[3] = inter[2] & CounterValue[3]; 
		tflipflop u4 (.clk(Clock), .t(inter[3]), .reset(Reset), .q(CounterValue[4]));
		
		assign inter[4] = inter[3] & CounterValue[4]; 
		tflipflop u5 (.clk(Clock), .t(inter[4]), .reset(Reset), .q(CounterValue[5]));
		
		assign inter[5] = inter[4] & CounterValue[5]; 
		tflipflop u6 (.clk(Clock), .t(inter[5]), .reset(Reset), .q(CounterValue[6]));
		
		assign inter[6] = inter[5] & CounterValue[6]; 
		tflipflop u7 (.clk(Clock), .t(inter[6]), .reset(Reset), .q(CounterValue[7]));

endmodule

module tflipflop(input clk, 
					input reset, 
					input t, 
					output reg q); 
					
	always @(posedge clk)
		begin
			if (reset) // synchronous high reset 
				q <= 0;
			else 
			if(t)
				q <= ~q; // i.e. q = t ^ q
			else
				q <= q; 
		end
		
endmodule 
