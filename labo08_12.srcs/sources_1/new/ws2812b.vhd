library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WS2812B is
	generic (
		clock_frequency : integer := 50_000_000 -- Hertz
	);
	port (
		clk : in std_logic;
		-- data : out std_logic_vector(23 downto 0); -- for testbench validation only
		serial : out std_logic;
		change_led: in std_logic_vector(23 downto 0)
	);
end entity WS2812B;

architecture Behavioral of WS2812B is
	constant T0H : integer := 20;
	constant T0L : integer := 42; -- compensate for state changes
	constant T1H : integer := 40;
	constant T1L : integer := 22; -- compensate for state changes
	constant RES : integer := 2500;
	
	constant NLEDS : integer := 16; -- first row: 16 LEDs
	type LEDValues is array (0 to 16) of std_logic_vector(23 downto 0); -- first row: 16 LEDs
	type state_machine is (load_led, load_bit, send_bit, reset);
	
	signal LEDs : LEDValues := (
        0  => x"FF0000", -- Green
        1  => x"00FF00", -- Red
        2  => x"0000FF", -- Blue
        3  => x"FFFFFF", -- White
        4  => x"330000", 
        5  => x"003300", 
        6  => x"000033", 
        7  => x"660000", 
        8  => x"006600", 
        9  => x"000066", 
        10 => x"AA0000", 
        11 => x"000000", 
        12 => x"0000AA", 
        13 => x"333333", 
        14 => x"666666", 
        15 => x"AAAAAA", 
        others => (others => '0') -- All other LEDs set to zero
    );

begin
	process(clk)
		variable state : state_machine := load_led;
		variable GRB : std_logic_vector(23 downto 0) := x"000000"; -- Green,Red,Blue 
		variable delay_high_counter : integer := 0;
		variable delay_low_counter : integer := 0;
		variable index : integer := 0;
		variable bit_counter : integer := 0;
		variable led_change_check:std_logic_vector(23 downto 0) := x"000000";

	begin
		if rising_edge(clk) then -- wait until rising_edge(clk)
            --data <= GRB; -- temporary testing only
            case state is
                when load_led => -- load data of 1 RGB LED
                            GRB := LEDs(index);
                            bit_counter := 24;
                            state := load_bit;
                when load_bit => -- determine 1 of 24 bit : 0 or 1
                        if (bit_counter > 0) then 
                            bit_counter := bit_counter - 1;
                            if GRB(bit_counter) = '1' then
                                delay_high_counter := T1H;
                                delay_low_counter := T1L;
                            else
                                delay_high_counter := T0H;
                                delay_low_counter := T0L;
                            end if;
                            state := send_bit;
                        else -- go to next led / reset
                            if (index < NLEDS) then
                                index := index + 1;
                                state := load_led;
                            else
                                delay_low_counter := RES;
                                state := reset; -- reset: send reset signal >= 50 000 ns 
                            end if;
                        end if;
                when send_bit => -- send the 0 or 1 bit of the code
                        if (delay_high_counter > 0) then
                            serial <= '1';
                            delay_high_counter := delay_high_counter - 1;
                        elsif (delay_low_counter > 0) then
                                serial <= '0';
                                delay_low_counter := delay_low_counter - 1;
                        else
                            state := load_bit;
                        end if;
                when reset => -- reset: send reset signal >= 50 000 ns + wait for changes
                        serial <= '0';
                        if (delay_low_counter > 0) then
                            delay_low_counter := delay_low_counter - 1;
                        else
                            index := 0;
                            if change_led /= x"000000" and change_led /= led_change_check then
                                LEDs(index) <= change_led;
                                led_change_check := change_led;
                                state := load_led; -- possibly load new data for next cycle
                            end if;
                            --state := possibly load new data for next cycle
                        end if;
                when others => null;
            end case;
		end if;
	end process;
end Behavioral;

-- Started from:
-- Driver for WS2812 - 16 RGB LED RING
-- Steven J. Merrifield, 14 Jan 2017
-- http://stevenmerrifield.com