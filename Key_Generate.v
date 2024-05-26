`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module Key_Generate(input clk, input rst, input [3:0] rc,input [127:0] kin,output [127:0] kout);

wire [31:0] word0,word1,word2,word3,rcout,temp;

reg [3 : 0]   rc_reg   ;
reg [127 : 0] kin_reg  ;



always@(posedge clk)begin
    if(!rst)begin
    rc_reg <= 4'd0;
    end 
    else
    rc_reg <= rc;
end

always@(posedge clk)begin
    if(!rst)begin
    kin_reg <= 128'd0;
    end 
    else
    kin_reg <= kin;
end

assign word0=kin_reg[127:96];
assign word1=kin_reg[95:64];
assign word2=kin_reg[63:32];
assign word3=kin_reg[31:0];

roundconst r1(rc_reg,rcout);

S_Box a1(.a(word3[23:16]),.c(temp[31:24]));
S_Box a2(.a(word3[15:8]),.c(temp[23:16]));
S_Box a3(.a(word3[7:0]),.c(temp[15:8]));
S_Box a4(.a(word3[31:24]),.c(temp[7:0]));

assign kout[127:96]= word0 ^ temp ^ rcout;
assign kout[95:64] = word0 ^ temp ^ rcout^ word1;
assign kout[63:32] = word0 ^ temp ^ rcout^ word1 ^ word2;
assign kout[31:0]  = word0 ^ temp ^ rcout^ word1 ^ word2 ^ word3;

  
endmodule
