module behavioralFullAdder(sum, carryout, a, b, carryin);
output sum, carryout;
input a, b, carryin;
assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder(out, carryout, a, b, carryin);
output out, carryout;
input a, b, carryin;
wire temp1, temp2, temp3;

xor #50 xorgate1(temp1,a,b);
xor #50 xorgate2(out,temp1,carryin);
and #50 andgate1(temp2,carryin,temp1);
and #50 andgate2(temp3,a,b);
or #50 orgat(carryout,temp2,temp3);
endmodule

module testFullAdder;
reg a, b, carryin;
wire sum, carryout;
//structuralFullAdder adder (sum, carryout, a, b, carryin);
behavioralFullAdder adder (sum, carryout, a, b, carryin);

initial begin
$display("a  b| Cin Cout | Sum | Expected Output");
a=0;b=0;carryin=0; #1000 
$display("%b  %b | %b     %b |   %b |  0", a, b, carryin, carryout, sum);
a=0;b=0;carryin=1; #1000 
$display("%b  %b | %b     %b |   %b |  1", a, b, carryin, carryout, sum);
a=0;b=1;carryin=0; #1000 
$display("%b  %b | %b     %b |   %b |  1", a, b, carryin, carryout, sum);
a=0;b=1;carryin=1; #1000 
$display("%b  %b | %b     %b |   %b |  0", a, b, carryin, carryout, sum);
a=1;b=0;carryin=0; #1000 
$display("%b  %b | %b     %b |   %b |  1", a, b, carryin, carryout, sum);
a=1;b=0;carryin=1; #1000 
$display("%b  %b | %b     %b |   %b |  0", a, b, carryin, carryout, sum);
a=1;b=1;carryin=0; #1000 
$display("%b  %b | %b     %b |   %b |  0", a, b, carryin, carryout, sum);
a=1;b=1;carryin=1; #1000 
$display("%b  %b | %b     %b |   %b |  1", a, b, carryin, carryout, sum);
end
endmodule
