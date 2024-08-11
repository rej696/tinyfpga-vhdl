library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_div_pow2 is
    port (clock_in     : in  std_logic;
          clock_div2   : out std_logic;
          clock_div4   : out std_logic;
          clock_div8   : out std_logic;
          clock_div16  : out std_logic;
          clock_div32  : out std_logic;
          clock_div64  : out std_logic;
          clock_div128 : out std_logic;
          clock_div256 : out std_logic
      );
end;

architecture RTL of clock_div_pow2 is
    signal clock_divider : unsigned(7 downto 0) := (others => '0');
begin
    p_clock_divider: process (clock_in)
    begin
        if rising_edge(clock_in) then
            clock_divider <= clock_divider + 1;
        end if;
    end process p_clock_divider;


    clock_div2 <= clock_divider(0);
    clock_div4 <= clock_divider(1);
    clock_div8 <= clock_divider(2);
    clock_div16 <= clock_divider(3);
    clock_div32 <= clock_divider(4);
    clock_div64 <= clock_divider(5);
    clock_div128 <= clock_divider(6);
    clock_div256 <= clock_divider(7);
end;
