`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module Substitute_Byte (
     clk,
     rst, 
     data,sb);

input clk;
input rst;
input [127:0] data;
output [127:0] sb;

reg [127 : 0] data_reg;

always @(posedge clk) begin
     if(!rst)begin
    data_reg <= 128'd0;
    end 
    else
     data_reg <= data;
     
end

     S_Box v0( .a(data_reg[127:120]),.c(sb[127:120]) );
     S_Box v1( .a(data_reg[119:112]),.c(sb[119:112]) );
     S_Box v2( .a(data_reg[111:104]),.c(sb[111:104]) );
     S_Box v3( .a(data_reg[103:96]),.c(sb[103:96]) );
     
     S_Box v4( .a(data_reg[95:88]),.c(sb[95:88]) );
     S_Box v5( .a(data_reg[87:80]),.c(sb[87:80]) );
     S_Box v6( .a(data_reg[79:72]),.c(sb[79:72]) );
     S_Box v7( .a(data_reg[71:64]),.c(sb[71:64]) );
           
     S_Box v8( .a(data_reg[63:56]),.c(sb[63:56]) );
     S_Box v9( .a(data_reg[55:48]),.c(sb[55:48]) );
     S_Box v10(.a(data_reg[47:40]),.c(sb[47:40]) );
     S_Box v11(.a(data_reg[39:32]),.c(sb[39:32]) );
     
     S_Box v12(.a(data_reg[31:24]),.c(sb[31:24]) );
     S_Box v13(.a(data_reg[23:16]),.c(sb[23:16]) );
     S_Box v14(.a(data_reg[15:8]),.c(sb[15:8]) );
     S_Box v15(.a(data_reg[7:0]),.c(sb[7:0]) ); 
   
endmodule
