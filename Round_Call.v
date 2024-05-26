`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module Round_Call(input clock,input rst, input [127:0] din,input [3:0] roundcount,input [127:0] kin, output [127:0] kout,output [127:0]roundout);

reg [127 : 0] din_reg;
reg [3 : 0]   roundcount_reg;
reg [127 : 0] kin_reg;
reg [127 : 0] kout_reg;
reg [127 : 0] roundout_reg;

reg [2 : 0] cnt;
wire [127 : 0] kout_tmp;
wire [127 : 0] roundout_tmp;

always@(posedge clock)begin
    if(!rst)begin
        cnt <= 3'd0;
    end
    else if(cnt == 3'd4)begin
            cnt <= 3'd0;
    end 
    else cnt <= cnt + 1;
end 


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

wire [127:0] sbout,outstate,outcol;

Key_Generate k1(clock, rst, roundcount_reg,kin_reg,kout_tmp);

Substitute_Byte s1(clock, rst, din_reg,sbout);

Shift_Rows sr1(clock, rst, sbout,outstate);

Mix_Columns m1(clock, rst, outstate,outcol);

always@(*)begin
    if(cnt == 4'd4)begin
        kout_reg = kout_tmp;
    end 
end 
assign kout = kout_reg;

always @(*) begin
    if(cnt == 4'd4)begin
      roundout_reg = kout ^ outcol;  
    end     
end
assign roundout=roundout_reg;

endmodule
 
