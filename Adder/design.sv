
module full_adder(
    input a, b, cin,
    output sum, carry
);
    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (cin & a);
endmodule


module ones_counter_3bit(
  input [2:0] x,
  output [1:0] y  
);
    wire s, c_out;

    full_adder fa (
      .a(x[0]),
      .b(x[1]),
      .cin(x[2]),
        .sum(s),
        .carry(c_out)
    );

    assign y[0] = s;
    assign y[1] = c_out;

endmodule

