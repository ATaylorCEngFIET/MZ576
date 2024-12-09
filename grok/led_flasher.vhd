library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LED_Flasher is
    Generic (
        CLK_FREQ_HZ : positive := 100_000_000  -- Default to 100 MHz for Arty S7-50
    );
    Port (
        clk : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        led : out STD_LOGIC
    );
end LED_Flasher;

architecture Behavioral of LED_Flasher is
    constant MAX_COUNT : integer := CLK_FREQ_HZ / 2;  -- for 0.5 Hz, toggle every second
    signal count : integer range 0 to MAX_COUNT := 0;
    signal led_state : STD_LOGIC := '0';
begin
    process(clk, reset)
    begin
        if reset = '0' then
            count <= 0;
            led_state <= '0';
            led <= '0';
        elsif rising_edge(clk) then
            if count = MAX_COUNT - 1 then
                count <= 0;
                led_state <= not led_state;  -- Toggle LED state
            else
                count <= count + 1;
            end if;
            led <= led_state;
        end if;
    end process;
end Behavioral;