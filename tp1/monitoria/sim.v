`include "modulo.v"

module Simulacao();
  reg inA, inB, inC, inD;
  wire saida;
  Exemplo ex_instancia1(.a(inA), .b(inB), .c(inC), .d(inD), .s(saida));

  initial begin
    inA = 0;
    inB = 0;
    inC = 0;
    inD = 0;
    $dumpfile("sim-onda.vcd");
    $dumpvars;
    $monitor("%b%b%b%b, saida = %b", inA, inB, inC, inD, saida);
    #1 inA = 1;
    #1 inC = 1;
    #1 inB = 1;
    inA = 0;
    #2 $finish;
  end

endmodule
