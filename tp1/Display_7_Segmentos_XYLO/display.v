module display (entrada, saida);

    input wire [3:0] entrada;
    output reg [6:0] saida;

    initial begin
        saida = 7'b1000000;
    end

    always @(entrada) begin
        case(entrada)
            4'b0000: saida = 7'b1000000;
            4'b0001: saida = 7'b1111001;
            4'b0010: saida = 7'b0100100;
            4'b0011: saida = 7'b0110000;
            4'b0100: saida = 7'b0011001;
            4'b0101: saida = 7'b0010010;
            4'b0110: saida = 7'b0000010;
            4'b0111: saida = 7'b1111000;
            4'b1000: saida = 7'b0000000;
            4'b1001: saida = 7'b0011000;
            4'b1010: saida = 7'b0001000;
            4'b1011: saida = 7'b0000011;
            4'b1100: saida = 7'b1000110;
            4'b1101: saida = 7'b0100001;
            4'b1110: saida = 7'b0000110;
            4'b1111: saida = 7'b0001110;
        endcase
    end
endmodule
