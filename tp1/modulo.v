module Notas (a,b,c,d,s0,s1,s2,,s3,s4,s5,s6,reset,ready);
  input wire a,b,c,d,reset,ready;
  output reg s0,s1,s2,s3,s4,s5,s6;

  always @ (*) begin
    if (reset) begin
      s0 = 1;
      s1 = 1;
      s2 = 1;
      s3 = 1;
      s4 = 1;
      s5 = 1;
      s6 = 1;
    end
    else if (ready) begin
        if ((a & b & c) == 0) begin
          s0 = 1;
          s1 = 1;
          s2 = 1;
          s3 = 1;
          s4 = 1;
          s5 = 1;
          s6 = 1;
        end

        s0 = d | (~a & ~b & ~c);
        s1 = (a & ~c & d) | (~a & ~b & ~c) | (a & b & ~d) | (~a & b & c) | (~a & c & ~d);
        s2 = (~a & ~c) | (b & ~c) | (b & d) | (a & c & d);
        s3 = (~a & ~b) | (c & ~d) | (~a & ~d) | (~b & ~d);
        // ~a & ~b | a & b & ~c | b & ~c & d | ~a & c & ~d | ~b & c ~d
        s4 = (~a & ~b) | (a & b & ~c) | (b & ~c & d) | (~b & c & ~d);
        s5 = (~b & d) | (~a & b & c) | (~a & ~b & ~c) | (a & ~b & c) | (a & b & ~c & ~d);
        s6 = (~a & ~b & ~c) | (a & ~b &~d);

        //s0 = ((b | ~c | d) & (a | ~c | ~d) & (c | ~d));
        //s1 = ((~b | c | d) & (~a | b | ~c) & (a | c | d) & (a | ~b | ~d));
        //s2 = ((~a | ~b | c) & (c | ~d) & (a | ~b | ~c));
        //s3 = ((b | d) & (a | d) & (a | b | ~c));
        //s4 = ((b | c) & (~a | b | ~d) & (a | c | d) & (a | ~b | ~c));
        //s5 = ((~a | ~b | c | ~d) & (~a | b | ~c) & (a | b | d) & (a | b | c) & (a | ~b | ~c | ~d));
        //s6 = ((b) & (~a | c) & (a | d));
    end
  end
endmodule // Notas
