library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_div is
    port (clock_in           : in  std_logic;
          reset_in           : in  std_logic;
          clock_divider_in   : in  std_logic_vector(7 downto 0);
          clock_out          : out std_logic
      );
end;

architecture RTL of clock_div is
    signal clock_counter      : unsigned(7 downto 0);
    signal clock_divider      : unsigned(7 downto 0);
    signal clock_divider_half : unsigned(7 downto 0);
begin
    p_clock_divider: process (reset_in, clock_in)
    begin
        if (reset_in = '0') then
            clock_counter <= (others => '0');
            clock_divider <= (others => '0');
            clock_divider_half <= (others => '0');
        elsif (rising_edge(clock_in)) then
            clock_divider <= unsigned(clock_divider_in) - 1;
            clock_divider_half <= unsigned('0' & clock_divider_in(7 downto 1));
            if (clock_counter < clock_divider_half) then
                clock_counter <= clock_counter + 1;
                clock_out <= '0';
            elsif (clock_counter = clock_divider) then
                clock_counter <= (others => '0');
                clock_out <= '1';
            else
                clock_counter <= clock_counter + 1;
                clock_out <= '1';
            end if;
        end if;
    end process p_clock_divider;
end;
