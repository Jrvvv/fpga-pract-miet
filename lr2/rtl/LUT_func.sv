`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2024 12:30:03 PM
// Design Name: 
// Module Name: DFF
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

// Function y[3:0] = (~a[3:0]) | (~c[3:0])
// optomozation: ~(a[3:0] & c[3:0])
module LUT_func
(
    input  [3:0] a_i,
    input  [3:0] b_i,
    input        clk_i,
    input        clk_e_i,
    
    output [3:0] y_o
);

    logic [3:0] a;
    logic [3:0] b;
    logic [3:0] a_and_b;
    logic [3:0] res;
    
    assign a = a_i;
    assign b = b_i;
    
    FDSE #(
    .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
    ) FDSE_inst0 (
        .Q  (y_o[0]),    // 1-bit Data output
        .C  (clk_i),     // 1-bit Clock input
        .CE (clk_e_i),   // 1-bit Clock enable input
        .S  (1'b0),      // 1-bit Synchronous set input
        .D  (res[0])     // 1-bit Data input
    );
    
    FDSE #(
    .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
    ) FDSE_inst1 (
        .Q  (y_o[1]),    // 1-bit Data output
        .C  (clk_i),     // 1-bit Clock input
        .CE (clk_e_i),   // 1-bit Clock enable input
        .S  (1'b0),      // 1-bit Synchronous set input
        .D  (res[1])     // 1-bit Data input
    );

    FDSE #(
    .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
    ) FDSE_inst2 (
        .Q  (y_o[2]),    // 1-bit Data output
        .C  (clk_i),     // 1-bit Clock input
        .CE (clk_e_i),   // 1-bit Clock enable input
        .S  (1'b0),      // 1-bit Synchronous set input
        .D  (res[2])     // 1-bit Data input
    );
    
    FDSE #(
    .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
    ) FDSE_inst3 (
        .Q  (y_o[3]),    // 1-bit Data output
        .C  (clk_i),     // 1-bit Clock input
        .CE (clk_e_i),   // 1-bit Clock enable input
        .S  (1'b0),      // 1-bit Synchronous set input
        .D  (res[3])     // 1-bit Data input
    );

    // ---------- a&b implememntation ----------
    LUT2 #(
    .INIT(4'b1000)
    ) LUT2_inst_a_and_b_0 (
        .O(a_and_b[0]),   // LUT general output
        .I0(a[0]),        // LUT input
        .I1(b[0])         // LUT input
    );

    LUT2 #(
    .INIT(4'b1000)
    ) LUT2_inst_a_and_b_1 (
        .O(a_and_b[1]),   // LUT general output
        .I0(a[1]),        // LUT input
        .I1(b[1])         // LUT input
    );
    
    LUT2 #(
    .INIT(4'b1000)
    ) LUT2_inst_a_and_b_2 (
        .O(a_and_b[2]),   // LUT general output
        .I0(a[2]),        // LUT input
        .I1(b[2])         // LUT input
    );
    
    LUT2 #(
    .INIT(4'b1000)
    ) LUT2_inst_a_and_b_3 (
        .O(a_and_b[3]),   // LUT general output
        .I0(a[3]),        // LUT input
        .I1(b[3])         // LUT input
    );

    // ---------- ~(a&b) implememntation ----------
    LUT1 #(
    .INIT(2'b01)
    ) LUT1_inst_n_a_and_b_0 (
        .O(res[0]),           // LUT general output
        .I0(a_and_b[0])       // LUT input
    );
        
    LUT1 #(
    .INIT(2'b01)
    ) LUT1_inst_n_a_and_b_1 (
        .O(res[1]),           // LUT general output
        .I0(a_and_b[1])       // LUT input
    );

    LUT1 #(
    .INIT(2'b01)
    ) LUT1_inst_n_a_and_b_2 (
        .O(res[2]),           // LUT general output
        .I0(a_and_b[2])       // LUT input
    );

    LUT1 #(
    .INIT(2'b01)
    ) LUT1_inst_n_a_and_b_3 (
        .O(res[3]),           // LUT general output
        .I0(a_and_b[3])       // LUT input
    );
    
endmodule