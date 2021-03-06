/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg inputA,
    output reg inputB,
    output reg inputC,
    input outSum,
    input outCarry
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [3-1:0] M_counter_count;
  reg [1-1:0] M_counter_sum;
  reg [1-1:0] M_counter_carry;
  reg [1-1:0] M_counter_clock;
  counter_2 counter (
    .clk(clk),
    .rst(rst),
    .sum(M_counter_sum),
    .carry(M_counter_carry),
    .clock(M_counter_clock),
    .count(M_counter_count)
  );
  wire [1-1:0] M_blinker_out;
  blinker_3 blinker (
    .clk(clk),
    .rst(rst),
    .out(M_blinker_out)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    led = 1'h1 << M_counter_count;
    M_counter_clock = M_blinker_out;
    M_counter_sum = outSum;
    M_counter_carry = outCarry;
    inputA = M_counter_count[0+0-:1];
    inputB = M_counter_count[1+0-:1];
    inputC = M_counter_count[2+0-:1];
  end
endmodule
