`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2024 01:06:11 PM
// Design Name: 
// Module Name: tb_LUT_func
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_demo ();

  logic           clk;
  logic [4:0]     cntr;

  logic [3:0]     a;
  logic [3:0]     b;
  logic [3:0]     res;
  logic [3:0]     res_tb;
  logic           clk_e;

  LUT_func DUT (
    .a_i(a),
    .b_i(b),
    .clk_e_i(clk_e),
    .clk_i(clk),
    .y_o(res)
  );

  initial begin
    clk   = 1'b0;
    clk_e = 1'b0;
  end

  initial begin
     #200
     a = 4'b1010;
     b = 4'b1100;
     res_tb = (~a) | ~(b);
//     #1
     clk_e = 1'b1;
     #2
     clk_e = 1'b0;
     #1
     if(res_tb != res)  $display("\nERROR!!!\n");
     
     #4
     a = 4'b1010;
     b = 4'b1100;
     res_tb = (~a) | ~(b);
//     #1
     clk_e = 1'b1;
     #2
     clk_e = 1'b0;
     #1
     if(res_tb != res)  $display("\nERROR!!!\n");
     
     #4
     a = 4'b1001;
     b = 4'b1100;
     res_tb = (~a) | ~(b);
//     #1
     clk_e = 1'b1;
     #2
     clk_e = 1'b0;
     #1
     if(res_tb != res)  $display("\nERROR!!!\n");     
     
     #4
     a = 4'b1000;
     b = 4'b1001;
     res_tb = (~a) | ~(b);
//     #1
     clk_e = 1'b1;
     #2
     clk_e = 1'b0;
     #1
     if(res_tb != res)  $display("\nERROR!!!\n");  
     
     #4
     a = 4'b1111;
     b = 4'b1101;
     res_tb = (~a) | ~(b);
//     #1
     clk_e = 1'b1;
     #2
     clk_e = 1'b0;
     #1
     if(res_tb != res)  $display("\nERROR!!!\n"); 
      #4  

     #4
     a = 4'b1001;
     b = 4'b1100;
     #3
     if(res_tb != res)  $display("\nERROR!!!\n"); 
      #4
     $finish;   
  end


  always begin
    #1
    clk <= ~clk;
  end


endmodule

