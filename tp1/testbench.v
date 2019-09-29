`include "modulo.v"

module testbench();
  reg a,b,c,d,reset,ready;
  wire s0,s1,s2,s3,s4,s5,s6;

  Notas ex_instancia1(.a(a), .b(b), .c(c), .d(d), .s0(s0), .s1(s1), .s2(s2), .s3(s3), .s4(s4), .s5(s5), .s6(s6), .reset(reset), .ready(ready));

  initial begin
    a = 0;
    b = 0;
    c = 0;
    d = 0;

    $dumpfile("ondas_xylo.vcd");
    $dumpvars(0, testbench);
    $display("a b c d = s0 s1 s2 s3 s4 s5 s6");
    $monitor("%b%b%b%b = %b %b %b %b %b %b %b ",a,b,c,d,s0,s1,s2,,s3,s4,s5,s6);


    //always @ ( * ) begin
    //  #1; clock = ~clock;
    //end

               //#1; clock = 4'b1;
               //#1; reset = 1'b1;
               //#1; reset = 1'b0;
               reset = 0;
               ready = 0;
          #1;  reset = 1;

          #1;  ready = 0;  a = 0; b = 0; c = 0; d = 0; ready = 1;
          #1;  ready = 0;  a = 0; b = 0; c = 0; d = 1; ready = 1;
          #1;  ready = 0;  a = 0; b = 0; c = 1; d = 0; ready = 1;
          #1;  ready = 0;  a = 0; b = 0; c = 1; d = 1; ready = 1;

          #1;  ready = 0;  a = 0; b = 1; c = 0; d = 0; ready = 1;
          #1;  ready = 0;  a = 0; b = 1; c = 0; d = 1; ready = 1;
          #1;  ready = 0;  a = 0; b = 1; c = 1; d = 0; ready = 1;
          #1;  ready = 0;  a = 0; b = 1; c = 1; d = 1; ready = 1;

          #1;  ready = 0;  a = 1; b = 0; c = 0; d = 0; ready = 1;
          #1;  ready = 0;  a = 1; b = 0; c = 0; d = 1; ready = 1;
          #1;  ready = 0;  a = 1; b = 0; c = 1; d = 0; ready = 1;
          #1;  ready = 0;  a = 1; b = 0; c = 1; d = 1; ready = 1;

          #1;  ready = 0;  a = 1; b = 1; c = 0; d = 0; ready = 1;
          #1;  ready = 0;  a = 1; b = 1; c = 0; d = 1; ready = 1;
          #1;  ready = 0;  a = 1; b = 1; c = 1; d = 0; ready = 1;
          #1;  ready = 0;  a = 1; b = 1; c = 1; d = 1; ready = 1;

           $finish;
  end
endmodule
