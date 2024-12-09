library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LED_Flasher is
    generic (
        CLK_FREQ : integer := 50_000_000 -- Default clock frequency in Hz
    );
    port (
        clk    : in  std_logic; -- Input clock
        reset  : in  std_logic; -- Active-high reset
        led    : out std_logic  -- Output LED signal
    );
end LED_Flasher;

architecture Behavioral of LED_Flasher is
    -- Calculate the number of clock cycles for 0.5Hz (1s period)
    constant CYCLES_PER_HALF_PERIOD : integer := CLK_FREQ / 2;
    signal counter : integer range 0 to CYCLES_PER_HALF_PERIOD := 0;
    signal led_state : std_logic := '0';
begin
    process(clk, reset)
    begin
        if reset = '0' then
            counter <= 0;
            led_state <= '0';
        elsif rising_edge(clk) then
            if counter = CYCLES_PER_HALF_PERIOD then
                counter <= 0;
                led_state <= not led_state; -- Toggle the LED state
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    -- Assign the LED output
    led <= led_state;
end Behavioral;
