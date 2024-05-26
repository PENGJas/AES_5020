`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module Round_Call_Last(input clock, input rst, input [127:0] din,input [3:0] roundcount,input [127:0] kin,output [127:0]roundout);

reg [127 : 0] din_reg;
reg [3 : 0]   roundcount_reg;
reg [127 : 0] kin_reg;


always @(posedge clock) begin
    if(!rst)begin
    din_reg <= 128'd0;
    end 
    else
    din_reg <= din;
end

always @(posedge clock) begin
    if(!rst)begin
    roundcount_reg <= 4'd0;
    end 
    else
    roundcount_reg <= roundcount;
end

always @(posedge clock) begin
    if(!rst)begin
    kin_reg <= 128'd0;
    end 
    else
    kin_reg <= kin;
end

wire [127:0] sbout,outstate,kout;

Key_Generate k1(clock, rst, roundcount_reg,kin,kout);

Substitute_Byte s1(clock, rst, din_reg,sbout);

Shift_Rows sr1(clock, rst, sbout,outstate);

assign roundout=kout^outstate;
 
 
endmodule
