// $Id: $
// File name:   sync_low.sv
// Created:     1/25/2016
// Author:      Akshay Sanjeev Daftardar
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: sync_low
module sync_low
(
	input wire clk,
	input wire n_rst,
	input wire async_in,
	output reg sync_out
);

reg mid = 1'b0;
always_ff @ (posedge clk, negedge n_rst)
begin
	if (1'b0 == n_rst)
	begin
		sync_out <= 1'b0;
		mid <= 1'b0;
	end
	else
	begin
		mid <= async_in;
		sync_out <= mid;
	end
end
endmodule 