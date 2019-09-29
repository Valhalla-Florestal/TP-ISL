// Esse módulo implementa a seguinte função:
// f(A,B,C,D) = AB + C'D'


module Exemplo(a, b, c, d, s);
  input wire a, b, c, d;
  output wire s;

  assign s = (a & b) | (~c & ~d);

endmodule

/*
Forma alternativa de definir as entradas e saídas

module Exemplo(
  input wire a, b, c, d,
  output wire s
);

  assign s = (a & b) | (~c & ~d);

endmodule

*/
