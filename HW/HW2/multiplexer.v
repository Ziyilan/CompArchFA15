module behavioralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire[3:0] inputs = {in3, in2, in1, in0};
wire[1:0] address = {address1, address0};
assign out = inputs[address];
endmodule

module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;

wire notA0, notA1;
wire S0, S1, S2, S3;
wire out0, out1, out2, out3;
wire outI, outII;

not #50 Not1 (notA0, address0);
not #50 Not2 (notA1, address1);

and #50 Andgate0(S0, notA1,notA0);
and #50 Andgate1(S1, notA1, address0);
and #50 Andgate2(S2, address1, notA0);
and #50 Andgate3(S3, address1, address0);
and #50 Andgate4(out0, in0, S0);
and #50 Andgate5(out1, in1, S1);
and #50 Andgate6(out2, in2, S2);
and #50 Andgate7(out3, in3, S3);
or #50 Orgate1(outI, out0, out1);
or #50 Orgate2(outII, out2, out3);
or #50 Orgate3(out, outI, outII);

endmodule


module testMultiplexer;
reg addr0,addr1;
reg in0,in1,in2,in3;
wire out;
//structuralMultiplexer DUT(out, addr0,addr1, in0,in1,in2,in3);
behavioralMultiplexer DUT(out, addr0, addr1, in0,in1,in2,in3);

initial begin
$display("\n");
$display("Truth Table for Multiplexer");
$display("A0 A1| I0 I1 I2 I3 | Output  | Expected Output");
addr0=0;addr1=0;in0=1;in1=0;in2=0;in3=0; #1000 
$display("%b  %b |  %b  %b  %b  %b | %b       |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0=1;addr1=0;in0=0;in1=1;in2=0;in3=0; #1000
$display("%b  %b |  %b  %b  %b  %b | %b       |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0=0;addr1=1;in0=0;in1=0;in2=1;in3=0; #1000 
$display("%b  %b |  %b  %b  %b  %b | %b       |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0=1;addr1=1;in0=0;in1=0;in2=0;in3=1; #1000 
$display("%b  %b |  %b  %b  %b  %b | %b       |  1", addr0, addr1, in0, in1, in2, in3, out);

addr0=0;addr1=0;in0=0;in1=1;in2=1;in3=1; #1000 
$display("%b  %b |  %b  %b  %b  %b | %b       |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0=1;addr1=0;in0=1;in1=0;in2=1;in3=1; #1000
$display("%b  %b |  %b  %b  %b  %b | %b       |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0=0;addr1=1;in0=1;in1=1;in2=0;in3=1; #1000 
$display("%b  %b |  %b  %b  %b  %b | %b       |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0=1;addr1=1;in0=1;in1=1;in2=1;in3=0; #1000 
$display("%b  %b |  %b  %b  %b  %b | %b       |  0", addr0, addr1, in0, in1, in2, in3, out);
end
endmodule
