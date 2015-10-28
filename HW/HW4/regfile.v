//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------



module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);

wire[31:0] decoderoutput;
wire[31:0] temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14, temp15, temp16, temp17, temp18, temp19, temp20, temp21, temp22, temp23, temp24, temp25, temp26, temp27, temp28, temp29, temp30, temp31;

decoder1to32 decoder(decoderoutput, RegWrite, WriteRegister);


register32zero register0(temp0,WriteData,decoderoutput[0],Clk);
register32 register1(temp1, WriteData, decoderoutput[1], Clk);
register32 register2(temp2, WriteData, decoderoutput[2], Clk);
register32 register3(temp3, WriteData, decoderoutput[3], Clk);
register32 register4(temp4, WriteData, decoderoutput[4], Clk);
register32 register5(temp5, WriteData, decoderoutput[5], Clk);
register32 register6(temp6, WriteData, decoderoutput[6], Clk);
register32 register7(temp7, WriteData, decoderoutput[7], Clk);
register32 register8(temp8, WriteData, decoderoutput[8], Clk);
register32 register9(temp9, WriteData, decoderoutput[9], Clk);
register32 register10(temp10, WriteData, decoderoutput[10], Clk);
register32 register11(temp11, WriteData, decoderoutput[11], Clk);
register32 register12(temp12, WriteData, decoderoutput[12], Clk);
register32 register13(temp13, WriteData, decoderoutput[13], Clk);
register32 register14(temp14, WriteData, decoderoutput[14], Clk);
register32 register15(temp15, WriteData, decoderoutput[15], Clk);
register32 register16(temp16, WriteData, decoderoutput[16], Clk);
register32 register17(temp17, WriteData, decoderoutput[17], Clk);
register32 register18(temp18, WriteData, decoderoutput[18], Clk);
register32 register19(temp19, WriteData, decoderoutput[19], Clk);
register32 register20(temp20, WriteData, decoderoutput[20], Clk);
register32 register21(temp21, WriteData, decoderoutput[21], Clk);
register32 register22(temp22, WriteData, decoderoutput[22], Clk);
register32 register23(temp23, WriteData, decoderoutput[23], Clk);
register32 register24(temp24, WriteData, decoderoutput[24], Clk);
register32 register25(temp25, WriteData, decoderoutput[25], Clk);
register32 register26(temp26, WriteData, decoderoutput[26], Clk);
register32 register27(temp27, WriteData, decoderoutput[27], Clk);
register32 register28(temp28, WriteData, decoderoutput[28], Clk);
register32 register29(temp29, WriteData, decoderoutput[29], Clk);
register32 register30(temp30, WriteData, decoderoutput[30], Clk);
register32 register31(temp31, WriteData, decoderoutput[31], Clk);


mux32to1by32 mux1 (ReadData1, ReadRegister1,temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14, temp15, temp16, temp17, temp18, temp19, temp20, temp21, temp22, temp23, temp24, temp25, temp26, temp27, temp28, temp29, temp30, temp31);
mux32to1by32 mux2 (ReadData2, ReadRegister2,temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14, temp15, temp16, temp17, temp18, temp19, temp20, temp21, temp22, temp23, temp24, temp25, temp26, temp27, temp28, temp29, temp30, temp31);


endmodule
