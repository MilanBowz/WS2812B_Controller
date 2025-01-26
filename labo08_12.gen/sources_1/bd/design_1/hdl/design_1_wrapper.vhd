--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
--Date        : Sun Jan 26 14:04:53 2025
--Host        : 5CD437BZ85 running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    BTN0_0 : in STD_LOGIC;
    BTN1_0 : in STD_LOGIC;
    BTN2_0 : in STD_LOGIC;
    clk_in1_0 : in STD_LOGIC;
    data_out_0 : out STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    clk_in1_0 : in STD_LOGIC;
    data_out_0 : out STD_LOGIC;
    BTN0_0 : in STD_LOGIC;
    BTN1_0 : in STD_LOGIC;
    BTN2_0 : in STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      BTN0_0 => BTN0_0,
      BTN1_0 => BTN1_0,
      BTN2_0 => BTN2_0,
      clk_in1_0 => clk_in1_0,
      data_out_0 => data_out_0
    );
end STRUCTURE;
