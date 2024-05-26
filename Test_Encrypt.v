`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module Test_Encrypt();

	reg clock;
	reg rst;
	wire [127:0] finaloutput;

	AES_Encrypt v1(.clk(clock),.rst(rst), .din(128'h 54776f204f6e65204e696e652054776f),.k(128'h 5468617473206d79204b756e67204675),.dout(finaloutput));
    
	initial begin
		clock = 0;
		rst = 1;
		#5 rst = 0;
		#20 rst = 1;
	end
	always begin 
	#1; clock = ~clock;
	end
endmodule
