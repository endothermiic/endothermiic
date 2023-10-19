module(input KEY[0], input SW[1:0], output LEDR[7:0], output HEX0, HEX1); 
	
	part1 u0(.Clock(KEY[0]), .Enable(SW[0]), .Reset(SW[1]), .CounterValue(LEDR[7:0])); 
	hex_decoder u0(.c(CounterValue[3:0]), .display(HEX0)); 
	hex_decoder u1(.c(CounterValue[7:4]), .display(HEX1)); 
	
endmodule

module hex_decoder(c, display);

	input [3:0] c;
	output [6:0] display;
	
	assign display[0] = !((~c[0] | c[1] | c[2] | c[3])&
								(c[0] | c[1] | ~c[2] | c[3])&
								(~c[0] | ~c[1] | c[2] | ~c[3])&
								(~c[0] | c[1] | ~c[2] | ~c[3]));
	
	assign display[1] = !((~c[0] | c[1] | ~c[2] | c[3])&
								(c[0] | ~c[1] | ~c[2] | c[3])&
								(~c[0] | ~c[1] | c[2] | ~c[3])&
								(c[0] | c[1] | ~c[2] | ~c[3])&
								(c[0] | ~c[1] | ~c[2] | ~c[3])&
								(~c[0] | ~c[1] | ~c[2] | ~c[3]));
	
	assign display[2] = !((c[0] | ~c[1] | c[2] | c[3])&
								(c[0] | c[1] | ~c[2] | ~c[3])&
								(c[0] | ~c[1] | ~c[2] | ~c[3])&
								(~c[0] | ~c[1] | ~c[2] | ~c[3]));
								
	assign display[3] = !((~c[0] | c[1] | c[2] | c[3])&
								(c[0] | c[1] | ~c[2] | c[3])&
								(~c[0] | ~c[1] | ~c[2] | c[3])&
								(c[0] | ~c[1] | c[2] | ~c[3])&
								(~c[0] | ~c[1] | ~c[2] | ~c[3]));
								
	assign display[4] = !((~c[0]|c[1]|c[2]|c[3])&
								(~c[0]|~c[1]|c[2]|c[3])&
								(c[0]|c[1]|~c[2]|c[3])&
								(~c[0]|c[1]|~c[2]|c[3])&
								(~c[0]|~c[1]|~c[2]|c[3])&
								(~c[0]|c[1]|c[2]|~c[3]));
								
	assign display[5] = !((~c[0] | c[1] | c[2] | c[3])&
								(c[0] | ~c[1] | c[2] | c[3])&
								(~c[0] | ~c[1] | c[2] | c[3])&
								(~c[0] | ~c[1] | ~c[2] | c[3])&
								(~c[0] | c[1] | ~c[2] | ~c[3]));
								
	assign display[6] = !((c[0] | c[1] | c[2] | c[3])&
								(~c[0]|c[1]|c[2] | c[3])&
								(~c[0]|~c[1] | ~c[2] | c[3])&
								(c[0]|c[1] | ~c[2] | ~c[3]));

endmodule
