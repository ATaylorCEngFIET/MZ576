library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity led_flasher is
    generic (
        CLK_FREQ : integer := 100000000  -- Default 100MHz
    );
    port (
        clk     : in  std_logic;
        rst     : in  std_logic;
        led_out : out std_logic
    );
end led_flasher;

architecture Behavioral of led_flasher is
    constant COUNT_MAX : integer := CLK_FREQ / 2; -- 0.5 Hz = 1 toggle per 2 seconds
    signal counter : integer range 0 to COUNT_MAX := 0;
    signal led_state : std_logic := '0';
begin
    process(clk, rst)
    begin
        if rst = '0' then
            counter <= 0;
            led_state <= '0';
        elsif rising_edge(clk) then
            if counter = COUNT_MAX - 1 then
                counter <= 0;
                led_state <= not led_state;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    led_out <= led_state;
end Behavioral;
