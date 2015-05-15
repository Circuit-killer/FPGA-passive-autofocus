// megafunction wizard: %LPM_CLSHIFT%VBB%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: LPM_CLSHIFT 

// ============================================================
// File Name: lpm_clshift2.v
// Megafunction Name(s):
// 			LPM_CLSHIFT
//
// Simulation Library Files(s):
// 			
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 13.0.1 Build 232 06/12/2013 SP 1 SJ Full Version
// ************************************************************

//Copyright (C) 1991-2013 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.

module lpm_clshift2 (
	clock,
	data,
	distance,
	result);

	input	  clock;
	input	[29:0]  data;
	input	  distance;
	output	[29:0]  result;

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone III"
// Retrieval info: PRIVATE: LPM_SHIFTTYPE NUMERIC "0"
// Retrieval info: PRIVATE: LPM_WIDTH NUMERIC "30"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: lpm_widthdist NUMERIC "1"
// Retrieval info: PRIVATE: lpm_widthdist_style NUMERIC "1"
// Retrieval info: PRIVATE: new_diagram STRING "1"
// Retrieval info: PRIVATE: port_direction NUMERIC "0"
// Retrieval info: LIBRARY: lpm lpm.lpm_components.all
// Retrieval info: CONSTANT: LPM_PIPELINE NUMERIC "1"
// Retrieval info: CONSTANT: LPM_SHIFTTYPE STRING "LOGICAL"
// Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_CLSHIFT"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "30"
// Retrieval info: CONSTANT: LPM_WIDTHDIST NUMERIC "1"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: USED_PORT: data 0 0 30 0 INPUT NODEFVAL "data[29..0]"
// Retrieval info: USED_PORT: distance 0 0 0 0 INPUT NODEFVAL "distance"
// Retrieval info: USED_PORT: result 0 0 30 0 OUTPUT NODEFVAL "result[29..0]"
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: @data 0 0 30 0 data 0 0 30 0
// Retrieval info: CONNECT: @direction 0 0 0 0 GND 0 0 0 0
// Retrieval info: CONNECT: @distance 0 0 0 0 distance 0 0 0 0
// Retrieval info: CONNECT: result 0 0 30 0 @result 0 0 30 0
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_clshift2.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_clshift2.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_clshift2.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_clshift2.bsf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_clshift2_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL lpm_clshift2_bb.v TRUE
