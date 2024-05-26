`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module Shift_Rows(input clk, input rst, input [127:0] istate,output [127:0] ostate);

reg [127 : 0] istate_reg;

always@(posedge clk)begin
    if(!rst)begin
    istate_reg <= 128'd0;
    end 
    else
    istate_reg <= istate;
end

assign ostate[127:120]=istate_reg[127:120];
assign ostate[95:88]=istate_reg[95:88];
assign ostate[63:56]=istate_reg[63:56];
assign ostate[31:24]=istate_reg[31:24];

assign ostate[119:112]=istate_reg[87:80];
assign ostate[87:80]=istate_reg[55:48];
assign ostate[55:48]=istate_reg[23:16];
assign ostate[23:16]=istate_reg[119:112];

assign ostate[111:104]=istate_reg[47:40];
assign ostate[79:72]=istate_reg[15:8];
assign ostate[47:40]=istate_reg[111:104];
assign ostate[15:8]=istate_reg[79:72];

assign ostate[103:96]=istate_reg[7:0];
assign ostate[71:64]=istate_reg[103:96];
assign ostate[39:32]=istate_reg[71:64];
assign ostate[7:0]=istate_reg[39:32];



endmodule
