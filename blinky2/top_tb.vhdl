library ieee;
  use ieee.std_logic_1164.all;

entity top_tb
is
end top_tb;

architecture behaviour of top_tb
is
    component top
      port (
        CLK : in std_logic;
        LED : in std_logic;
        USBPU : in std_logic
      );
    end component;

    for uut: top use entity work.top;
    signal CLK : std_logic;
    signal LED : std_logic;
    signal USBPU : std_logic;
begin
    uut: top port map (
        CLK => CLK,
        LED => LED,
        USBPU => USBPU
      );

    -- TODO run a test
end behaviour;
