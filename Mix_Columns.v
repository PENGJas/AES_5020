`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module Mix_Columns(
  clk,
  rst,
  a,out);

input clk;
input rst;
input [127:0] a;
output [127:0] out;

reg[127 : 0] a_reg;

always@(posedge clk)begin
  if(!rst)begin
    a_reg <= 128'd0;
    end 
    else
  a_reg <= a;
end


Mix_Columns_32 v16(a_reg[127:120],a_reg[119:112],a_reg[111:104],a_reg[103:96],out[127:120]);
Mix_Columns_32 v15(a_reg[119:112],a_reg[111:104],a_reg[103:96],a_reg[127:120],out[119:112]);
Mix_Columns_32 v14(a_reg[111:104],a_reg[103:96],a_reg[127:120],a_reg[119:112],out[111:104]);
Mix_Columns_32 v13(a_reg[103:96],a_reg[127:120],a_reg[119:112],a_reg[111:104],out[103:96]);

Mix_Columns_32 v12(a_reg[95:88],a_reg[87:80],a_reg[79:72],a_reg[71:64],out[95:88]);
Mix_Columns_32 v11(a_reg[87:80],a_reg[79:72],a_reg[71:64],a_reg[95:88],out[87:80]);
Mix_Columns_32 v10(a_reg[79:72],a_reg[71:64],a_reg[95:88],a_reg[87:80],out[79:72]);
Mix_Columns_32 v9(a_reg[71:64],a_reg[95:88],a_reg[87:80],a_reg[79:72],out[71:64]);

Mix_Columns_32 v8(a_reg[63:56],a_reg[55:48],a_reg[47:40],a_reg[39:32],out[63:56]);
Mix_Columns_32 v7(a_reg[55:48],a_reg[47:40],a_reg[39:32],a_reg[63:56],out[55:48]);
Mix_Columns_32 v6(a_reg[47:40],a_reg[39:32],a_reg[63:56],a_reg[55:48],out[47:40]);
Mix_Columns_32 v5(a_reg[39:32],a_reg[63:56],a_reg[55:48],a_reg[47:40],out[39:32]);

Mix_Columns_32 v4(a_reg[31:24],a_reg[23:16],a_reg[15:8],a_reg[7:0],out[31:24]);
Mix_Columns_32 v3(a_reg[23:16],a_reg[15:8],a_reg[7:0],a_reg[31:24],out[23:16]);
Mix_Columns_32 v2(a_reg[15:8],a_reg[7:0],a_reg[31:24],a_reg[23:16],out[15:8]);
Mix_Columns_32 v1(a_reg[7:0],a_reg[31:24],a_reg[23:16],a_reg[15:8],out[7:0]);

  
endmodule
