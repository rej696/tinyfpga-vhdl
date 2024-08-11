library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fstr is
    port (
             CLK : in std_logic;
             LED : out std_logic;
             USBPU : out std_logic
         );
end;

architecture RTL of fstr is
    signal clock : std_logic;
    signal counter : unsigned(24 downto 0) := (others => '0');

begin
    process (CLK)
    begin
        if (rising_edge(CLK)) then
            counter <= counter + 1;
        end if;
    end process;


    USBPU <= '0';

    LED <= counter(24);
end;
