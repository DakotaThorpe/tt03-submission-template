/* 
This file provides the mapping from the Wokwi modules to Verilog HDL

It's only needed for Wokwi designs

*/
`define default_netname none

module buffer_cell (
    input wire in,
    output wire out
    );
    assign out = in;
endmodule

module and_cell (
    input wire a,
    input wire b,
    output wire out
    );

    assign out = a & b;
endmodule

module or_cell (
    input wire a,
    input wire b,
    output wire out
    );

    assign out = a | b;
endmodule

module xor_cell (
    input wire a,
    input wire b,
    output wire out
    );

    assign out = a ^ b;
endmodule

module nand_cell (
    input wire a,
    input wire b,
    output wire out
    );

    assign out = !(a&b);
endmodule

module not_cell (
    input wire in,
    output wire out
    );

    assign out = !in;
endmodule

module mux_cell (
    input wire a,
    input wire b,
    input wire sel,
    output wire out
    );

    assign out = sel ? b : a;
endmodule

module dff_cell (
    input wire clk,
    input wire d,
    output reg q,
    output wire notq
    );

    assign notq = !q;
    always @(posedge clk)
        q <= d;

endmodule

module dffsr_cell (
    input wire clk,
    input wire d,
    input wire s,
    input wire r,
    output reg q,
    output wire notq
    );

    assign notq = !q;

    always @(posedge clk or posedge s or posedge r) begin
        if (r)
            q <= 0;
        else if (s)
            q <= 1;
        else
            q <= d;
    end
endmodule

module counter (input clk,      // Declare input port for the clock to allow counter to count up  
                  input rstn,              // Declare input port for the reset to allow the counter to be reset to 0 when required  
                  output reg[63:0] out);    // Declare 4-bit output port to get the counter values  
  
 // This always block will be triggered at the rising edge of clk (0->1)  
  // Once inside this block, it checks if the reset is 0, then change out to zero   
  // If reset is 1, then the design should be allowed to count up, so increment the counter   
  
  always @ (posedge clk) begin  
    if (! rstn)  
      out <= 0;  
    else  
      out <= out + 1;  
  end  
endmodule
