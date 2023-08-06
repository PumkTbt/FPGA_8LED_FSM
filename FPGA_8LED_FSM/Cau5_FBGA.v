module Cau5_FBGA(ck,rs,led,s);
parameter start = 5'b0000;
parameter s1 = 5'b00001;
parameter s2 = 5'b00010;
parameter s3 = 5'b00011;
parameter s4 = 5'b00100;
parameter s5 = 5'b00101;
parameter s6 = 5'b00110;
parameter s7 = 5'b00111;
parameter s8 = 5'b01000;

parameter sd1 = 5'b01001;
parameter sd2 = 5'b01010;
parameter sd3 = 5'b01011;
parameter sd4 = 5'b01100;
parameter sd5 = 5'b01101;
parameter sd6 = 5'b01110;
parameter sd7 = 5'b01111;
parameter sd8 = 5'b10000;
input ck,rs,s;
output [7:0]led;
reg [7:0]led;
reg [4:0]next_state, current_state;
always @ (*)
begin 
case (current_state)
start:
begin
if (s) next_state = s8;
else next_state = sd1;
end
s8:
begin
if (s) next_state = s7;
else next_state = start;
end
s7:
begin
if (s) next_state = s6;
else next_state = start;
end
s6:
begin
if (s) next_state = s5;
else next_state = start;
end
s5:
begin
if (s) next_state = s4;
else next_state = start;
end
s4:
begin
if (s) next_state = s3;
else next_state = start;
end
s3:
begin
if (s) next_state = s2;
else next_state = start;
end
s2:
begin
if (s) next_state = s1;
else next_state = start;
end
s1:
begin
if (s) next_state = s8;
else next_state = start;		
end
sd8:
begin
if (!s) next_state = sd1;
else next_state = start;
end
sd7:
begin
if (!s) next_state = sd8;
else next_state = start;
end
sd6:
begin
if (!s) next_state = sd7;
else next_state = start;
end
sd5:
begin
if (!s) next_state = sd6;
else next_state = start;
end
sd4:
begin
if (!s) next_state = sd5;
else next_state = start;
end
sd3:
begin
if (!s) next_state = sd4;
else next_state = start;
end
sd2:
begin
if (!s) next_state = sd3;
else next_state = start;
end
sd1:
begin
if (!s) next_state = sd2;
else next_state = start;	
end
endcase
end 
always @(posedge ck)
begin
if(rs)current_state <= start;
else current_state <= next_state;
end
always @ (*)
begin
case(current_state)
start : 	led = 8'b00000000;

s1 :led = 8'b00000001;
s2 :led = 8'b00000010;
s3 :led = 8'b00000100;
s4 :led = 8'b00001000;
s5 :led = 8'b00010000;
s6 :led = 8'b00100000;
s7 :led = 8'b01000000;
s8 :led = 8'b10000000;

sd1 : led = 8'b00000001;
sd2 : led = 8'b00000011;
sd3 : led = 8'b00000111;
sd4 : led = 8'b00001111;
sd5 :	led = 8'b00011111;
sd6 :	led = 8'b00111111;
sd7 :	led = 8'b01111111;
sd8 :	led = 8'b11111111;
endcase
end
endmodule
