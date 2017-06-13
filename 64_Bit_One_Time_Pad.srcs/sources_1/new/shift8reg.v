`timescale 1ns / 1ps
module shift8reg(input [7:0] in, input en, input rst1, input rst2, input rst3, 
input clk, input shiftL8, output reg [63:0] out);

always@(posedge clk, posedge rst1, posedge rst2)
begin
    if(en)
        out[7:0]=in;
    if(shiftL8)
        out=out<<8;
    if(rst1||rst2||rst3)
        out=0;  
end

endmodule
