----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2024 10:13:30
-- Design Name: 
-- Module Name: clock_adapt - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_adapt is
    Port ( clk : in STD_LOGIC;
           leds : out STD_LOGIC_VECTOR(3 downto 0));
end clock_adapt;

architecture Behavioral of clock_adapt is

signal inter_leds:  std_logic_vector(3 downto 0):=(others=>'0');
constant CLK_FREQ : integer := 125_000_000;  -- frequentie clock = 125 MHz (Pynq-Z2)
constant COUNT_MAX_01 : integer := CLK_FREQ / 2; --  complete cycle 1s '0' &  '1'
constant COUNT_MAX_02 : integer := CLK_FREQ / (2 * 2); -- => complete cycle = 2s
constant COUNT_MAX_05 : integer := CLK_FREQ / (2 * 5); -- => complete cycle = 5s
constant COUNT_MAX_10 : integer := CLK_FREQ / (2 * 10); -- => complete cycle = 10s

-- simple example with 10MHz device:
-- CLK_FREQ => 10 000 000 Hz (10MHz)
-- to 1 Hz =>   count to    (10 000 000 / 1)        /2 (clock has 1 and 0)  => 5 000 000
-- to 2 Hz =>   count to    (10 000 000 / 2)        /2                      => 2 500 000
-- to 5 Hz =>   count to    (10 000 000 / 5)        /2  => 2 000 000 / 2    => 1 000 000
-- to 10 Hz =>  count to    (10 000 000 / 10)       /2  => 1 000 000 /2     =>   500 000

begin
    
    led_process:process(clk)
        variable counter1 :  unsigned (31 downto 0):= (others=>'0');
        variable counter2 :  unsigned (31 downto 0):= (others=>'0');
        variable counter3 :  unsigned (31 downto 0):= (others=>'0');
        variable counter4 :  unsigned (31 downto 0):= (others=>'0');
        begin
            if(rising_edge(clk)) then
                counter1 := counter1 + 1;
                counter2 := counter2 + 1;
                counter3 := counter3 + 1;
                counter4 := counter4 + 1; -- and more ...
                if(counter1 >=COUNT_MAX_01) then
                    counter1:=(others=>'0');
                    inter_leds(0) <=not inter_leds(0);
                end if;
                if(counter2 >=COUNT_MAX_02) then
                    counter2:=(others=>'0');
                    inter_leds(1) <=not inter_leds(1);
                end if;
                if(counter3 >=COUNT_MAX_05) then
                    counter3:=(others=>'0');
                    inter_leds(2) <=not inter_leds(2);
                end if;
                if(counter4 >=COUNT_MAX_10) then
                    counter4:=(others=>'0');
                    inter_leds(3) <=not inter_leds(3);
                end if;
            end if;
            leds <= inter_leds;      
    end process;


end Behavioral;
