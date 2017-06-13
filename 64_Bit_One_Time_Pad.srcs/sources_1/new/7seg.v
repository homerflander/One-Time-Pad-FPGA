module sevenseg(in, s0, s1, s2, s3, s4, s5, s6);
output s0, s1, s2, s3, s4, s5, s6;
input [7:0] in;
reg s0, s1, s2, s3, s4, s5, s6;
always @ (in)
begin 
case (in) 
7'd00:begin s0=1; s1=1; s2=1; s3=1; s4=1; s5=1; s6=1; end //spacce
7'd01:begin s0=1; s1=0; s2=0; s3=0; s4=0; s5=0; s6=0; end //A
7'd02:begin s0=0; s1=0; s2=0; s3=0; s4=1; s5=0; s6=1; end //B
7'd03:begin s0=0; s1=1; s2=0; s3=1; s4=1; s5=0; s6=0; end //C
7'd04:begin s0=0; s1=0; s2=0; s3=0; s4=0; s5=1; s6=1; end //D
7'd05:begin s0=0; s1=1; s2=0; s3=0; s4=1; s5=0; s6=0; end //E
7'd06:begin s0=1; s1=1; s2=0; s3=0; s4=1; s5=0; s6=0; end //F
7'd07:begin s0=0; s1=0; s2=1; s3=0; s4=0; s5=0; s6=0; end //G
7'd08:begin s0=1; s1=0; s2=0; s3=0; s4=0; s5=0; s6=1; end //H
7'd09:begin s0=1; s1=1; s2=0; s3=1; s4=1; s5=0; s6=1; end //I
7'd10:begin s0=0; s1=0; s2=0; s3=1; s4=0; s5=1; s6=1; end //J
7'd11:begin s0=1; s1=0; s2=0; s3=0; s4=0; s5=0; s6=1; end //K
7'd12:begin s0=0; s1=1; s2=0; s3=1; s4=1; s5=0; s6=1; end //L
7'd13:begin s0=1; s1=0; s2=0; s3=1; s4=1; s5=1; s6=0; end //M
7'd14:begin s0=1; s1=0; s2=0; s3=0; s4=1; s5=1; s6=1; end //N
7'd15:begin s0=0; s1=0; s2=0; s3=1; s4=0; s5=0; s6=0; end //O
7'd16:begin s0=1; s1=1; s2=0; s3=0; s4=0; s5=0; s6=0; end //P
7'd17:begin s0=1; s1=0; s2=1; s3=0; s4=0; s5=0; s6=0; end //Q
7'd18:begin s0=1; s1=1; s2=0; s3=0; s4=1; s5=1; s6=1; end //R
7'd19:begin s0=0; s1=0; s2=1; s3=0; s4=1; s5=0; s6=0; end //S 
7'd20:begin s0=0; s1=1; s2=0; s3=0; s4=1; s5=0; s6=1; end //T
7'd21:begin s0=0; s1=0; s2=0; s3=1; s4=0; s5=0; s6=1; end //U
7'd22:begin s0=0; s1=0; s2=0; s3=1; s4=1; s5=1; s6=1; end //V
7'd23:begin s0=0; s1=1; s2=1; s3=1; s4=0; s5=0; s6=1; end //W 
7'd24:begin s0=1; s1=0; s2=0; s3=0; s4=0; s5=0; s6=1; end //X
7'd25:begin s0=0; s1=0; s2=1; s3=0; s4=0; s5=0; s6=1; end //Y
7'd26:begin s0=0; s1=1; s2=0; s3=0; s4=0; s5=1; s6=0; end //Z
default: begin s0=1; s1=1; s2=1; s3=1; s4=1; s5=1; s6=1; end
endcase
end
endmodule 