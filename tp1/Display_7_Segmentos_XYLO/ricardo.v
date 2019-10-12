module MipsPipeLine (

	//////////// CLOCK //////////
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,

	//////////// SW //////////
	SW,

	//////////// SEG7 //////////
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6,
	HEX7
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 		          		CLOCK_50;
input 		          		CLOCK2_50;
input 		          		CLOCK3_50;


//////////// SW //////////
input 		    [17:0]		SW;

//////////// SEG7 //////////
output		     [6:0]		HEX0;
output		     [6:0]		HEX1;
output		     [6:0]		HEX2;
output		     [6:0]		HEX3;
output		     [6:0]		HEX4;
output		     [6:0]		HEX5;
output		     [6:0]		HEX6;
output		     [6:0]		HEX7;


//=======================================================
//  REG/WIRE declarations
//=======================================================
wire [31:0] out_Alu;
wire [31:0] out_Instruc;
wire [31:0] out_Pc;
reg  [31:0] out_Display;
reg  [31:0] out_CounterInstruc;
wire CLOCK;


//=======================================================
//  Structural coding
//=======================================================

initial begin
	out_Display = out_Instruc;
	out_CounterInstruc = 32'b0;
end
//=======================================================
//  CLOCK
//=======================================================
clock clock_0 (.in_Clock(CLOCK_50), .out_Clock(CLOCK));
//=======================================================
//  Caminho de Dados
//=======================================================
mips mips_0 (.clock(CLOCK), .reset(SW[17]), .saida_1(out_Pc), .saida_2(out_Instruc), .saida_3(out_Alu));
//=======================================================
//  DISPLAY
//=======================================================
display display_0 (out_Display[31:28], HEX7);
display display_1 (out_Display[27:24], HEX6);
display display_2 (out_Display[23:20], HEX5);
display display_3 (out_Display[19:16], HEX4);
display display_4 (out_Display[15:12], HEX3);
display display_5 (out_Display[11:8], HEX2);
display display_6 (out_Display[7:4], HEX1);
display display_7 (out_Display[3:0], HEX0);

always @(*) begin
	if (SW[16]) begin
		out_Display = out_Pc;
	end
	else if (SW[15]) begin
		out_Display = out_Alu;
	end
	else begin
		out_Display = out_Instruc;
	end
end

endmodule
