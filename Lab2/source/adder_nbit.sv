// $Id: $
// File name:   adder_nbit.sv
// Created:     1/25/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: adder_nbit
`timescale 1ns / 100ps
module adder_nbit
#(
	parameter BIT_WIDTH = 4
)
(
	input wire [BIT_WIDTH-1:0] a,
	input wire [BIT_WIDTH-1:0] b,
	input wire carry_in,
	output wire [BIT_WIDTH-1:0] sum,
	output wire overflow
);

wire [BIT_WIDTH:0] carrys;
genvar i;

assign carrys[0] = carry_in;
generate
	for(i=0; i<=BIT_WIDTH - 1; i = i + 1)
	begin
		adder_1bit IX (.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));
			always @ (a[i], b[i], carry_in)
			begin
				assert((a[i] == 1'b1) || (a[i] == 1'b0))
				else $error("Input 'a[i]' of component is not a digital logic value");
				assert((b[i] == 1'b1) || (b[i] == 1'b0))
				else $error("Input 'b[i]' of component is not a digital logic value");
				assert((carry_in == 1'b1) || (carry_in == 1'b0))
				else $error("Input 'carry_in' of component is not a digital logic value");
			end
	end
endgenerate
assign overflow = carrys[BIT_WIDTH];
endmodule 
