`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module AES_Encrypt(clk,rst, din,k,dout);

    input clk;
    input rst;
    input [127:0] din;
    input [127:0] k;
    output[127:0] dout;
    
    wire [127:0] r0_out;
    wire [127:0] r1_out,r2_out,r3_out,r4_out,r9_out;
    
    wire [127:0] kout1,kout2,kout3,kout4,kout9;
	 
	 assign r0_out = din^k;
    reg [5 : 0] cnt;
    reg v1_sel;
    reg [127 : 0]din_1;
    reg [3 : 0]roundcount1;     
    reg [3 : 0]roundcount2; 
    reg [3 : 0]roundcount3; 
    reg [3 : 0]roundcount4; 
    reg [127:0] kin1;


    always@(posedge clk)begin
    if(!rst)begin
        cnt <= 6'd0;
    end 
    else if(cnt == 6'd39)begin
        cnt <= 6'd0;
    end 
    else cnt <= cnt + 1;
    end 

    always@(*)begin
        case (cnt)
           6'd0 : v1_sel = 1'b0;
           6'd1 : v1_sel = 1'b0;
           6'd2 : v1_sel = 1'b0;
           6'd3 : v1_sel = 1'b0;
           6'd4 : v1_sel = 1'b0;
           6'd5 : v1_sel = 1'b0;
           6'd6 : v1_sel = 1'b0;
           6'd7 : v1_sel = 1'b0;
           6'd8 : v1_sel = 1'b0;
           6'd9 : v1_sel = 1'b0;
           6'd10 : v1_sel = 1'b0;
           6'd11 : v1_sel = 1'b0;
           6'd12 : v1_sel = 1'b0;
           6'd13 : v1_sel = 1'b0;
           6'd14 : v1_sel = 1'b0;
           6'd15 : v1_sel = 1'b0;
           6'd16 : v1_sel = 1'b0;
           6'd17 : v1_sel = 1'b0;
           6'd18 : v1_sel = 1'b0;
           6'd19 : v1_sel = 1'b0;
            default: v1_sel = 1'b1;
        endcase
    end 

    always@(*)begin
        case(v1_sel)
        1'b1 : din_1 = r4_out;
        1'b0 : din_1 = r0_out;
    endcase
    end
    always@(*)begin
        case(v1_sel)
        1'b1 : roundcount1 = 4'b0100;
        1'b0 : roundcount1 = 4'b0000;
    endcase
    end

    always@(*)begin
        case(v1_sel)
        1'b1 : roundcount2 = 4'b0101;
        1'b0 : roundcount2 = 4'b0001;
    endcase
    end
    always@(*)begin
        case(v1_sel)
        1'b1 : roundcount3 = 4'b0110;
        1'b0 : roundcount3 = 4'b0010;
    endcase
    end
    always@(*)begin
        case(v1_sel)
        1'b1 : roundcount4 = 4'b0111;
        1'b0 : roundcount4 = 4'b0011;
    endcase
    end
    always@(*)begin
        case(v1_sel)
        1'b1 : kin1 = kout4;
        1'b0 : kin1 = k;
    endcase
    end


    Round_Call           v1(.clock(clk), .rst(rst), .din(din_1),.roundcount(roundcount1),.kin(kin1),.kout(kout1),.roundout(r1_out));
    Round_Call           v2(.clock(clk), .rst(rst), .din(r1_out),.roundcount(roundcount2),.kin(kout1),.kout(kout2),.roundout(r2_out));
    Round_Call           v3(.clock(clk), .rst(rst), .din(r2_out),.roundcount(roundcount3),.kin(kout2),.kout(kout3),.roundout(r3_out));
    Round_Call           v4(.clock(clk), .rst(rst), .din(r3_out),.roundcount(roundcount4),.kin(kout3),.kout(kout4),.roundout(r4_out));

    Round_Call           v9(.clock(clk), .rst(rst), .din(r4_out),.roundcount(4'b1000),.kin(kout4),.kout(kout9),.roundout(r9_out));
    Round_Call_Last     v10(.clock(clk), .rst(rst), .din(r9_out),.roundcount(4'b1001),.kin(kout9),.roundout(dout));
    	 
    
endmodule