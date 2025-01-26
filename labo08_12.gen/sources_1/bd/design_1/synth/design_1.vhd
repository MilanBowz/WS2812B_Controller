--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
--Date        : Sun Jan 26 14:04:53 2025
--Host        : 5CD437BZ85 running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    BTN0_0 : in STD_LOGIC;
    BTN1_0 : in STD_LOGIC;
    BTN2_0 : in STD_LOGIC;
    clk_in1_0 : in STD_LOGIC;
    data_out_0 : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1 : entity is "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=None}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of design_1 : entity is "design_1.hwdef";
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_clk_wiz_0_0 is
  port (
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC
  );
  end component design_1_clk_wiz_0_0;
  component design_1_Colorchooser_0_0 is
  port (
    clk : in STD_LOGIC;
    BTN0 : in STD_LOGIC;
    BTN1 : in STD_LOGIC;
    BTN2 : in STD_LOGIC;
    color : out STD_LOGIC_VECTOR ( 23 downto 0 )
  );
  end component design_1_Colorchooser_0_0;
  component design_1_WS2812B_0_0 is
  port (
    clk : in STD_LOGIC;
    serial : out STD_LOGIC;
    change_led : in STD_LOGIC_VECTOR ( 23 downto 0 )
  );
  end component design_1_WS2812B_0_0;
  signal BTN0_0_1 : STD_LOGIC;
  signal BTN1_0_1 : STD_LOGIC;
  signal BTN2_0_1 : STD_LOGIC;
  signal Colorchooser_0_color : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal WS2812B_0_serial : STD_LOGIC;
  signal clk_in1_0_1 : STD_LOGIC;
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
  signal clk_wiz_0_clk_out2 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_in1_0 : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_in1_0 : signal is "XIL_INTERFACENAME CLK.CLK_IN1_0, CLK_DOMAIN design_1_clk_in1_0, FREQ_HZ 120000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  BTN0_0_1 <= BTN0_0;
  BTN1_0_1 <= BTN1_0;
  BTN2_0_1 <= BTN2_0;
  clk_in1_0_1 <= clk_in1_0;
  data_out_0 <= WS2812B_0_serial;
Colorchooser_0: component design_1_Colorchooser_0_0
     port map (
      BTN0 => BTN0_0_1,
      BTN1 => BTN1_0_1,
      BTN2 => BTN2_0_1,
      clk => clk_wiz_0_clk_out2,
      color(23 downto 0) => Colorchooser_0_color(23 downto 0)
    );
WS2812B_0: component design_1_WS2812B_0_0
     port map (
      change_led(23 downto 0) => Colorchooser_0_color(23 downto 0),
      clk => clk_wiz_0_clk_out1,
      serial => WS2812B_0_serial
    );
clk_wiz_0: component design_1_clk_wiz_0_0
     port map (
      clk_in1 => clk_in1_0_1,
      clk_out1 => clk_wiz_0_clk_out1,
      clk_out2 => clk_wiz_0_clk_out2
    );
end STRUCTURE;
