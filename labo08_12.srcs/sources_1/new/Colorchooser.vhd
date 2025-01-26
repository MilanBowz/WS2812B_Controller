----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.01.2025 10:46:41
-- Design Name: 
-- Module Name: Colorchooser - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Colorchooser is
    Port ( clk : in STD_LOGIC;
           BTN0 : in STD_LOGIC;
           BTN1 : in STD_LOGIC;
           BTN2 : in STD_LOGIC;
           color : out STD_LOGIC_VECTOR (23 downto 0));
end Colorchooser;

architecture Behavioral of Colorchooser is
begin
    process(clk)
    begin
        -- If BTN0 is pressed, set red to all 1's
        if BTN1 = '1' then
            color <= "11111111" & "00000000" & "00000000"; -- Green
        -- If BTN1 is pressed, set green to all 1's
        elsif BTN0 = '1' then
            color <= "00000000" & "11111111" & "00000000"; -- Red 
        -- If BTN2 is pressed, set blue to all 1's
        elsif BTN2 = '1' then
            color <= "00000000" & "00000000" & "11111111"; -- Blue 
        -- If no button is pressed, set color to 0 (black)
        else
            color <= "00000000" & "00000000" & "00000000"; -- Black
        end if;
    end process;
end Behavioral;
