library ieee;
use ieee.std_logic_1164.all;

entity clock_div_tb is
    end;

architecture behaviour of clock_div_tb is
    signal CLK : std_logic;
    signal clock : std_logic;
    signal reset : std_logic := '0';
    signal clock_divider : std_logic_vector(7 downto 0);
    signal clock_tmp : std_logic;
    signal clock_tmp_2 : std_logic;

    signal is_startup: std_logic := '1';

    component clock_div is
        port (clock_in : in std_logic;
              reset_in : in std_logic;
              clock_divider_in : in std_logic_vector(7 downto 0);
              clock_out : out std_logic
          );
    end component;
begin
    process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (is_startup = '1') then
                is_startup <= '0';
                reset <= '1';
                clock_divider <= (others => '1');
            end if;
        end if;
    end process;

    clockdiv : clock_div port map (clock_in => CLK,
                                   reset_in => reset,
                                   clock_divider_in => clock_divider,
                                   clock_out => clock_tmp);

    clockdiv2 : clock_div port map (clock_in => clock_tmp,
                                    reset_in => reset,
                                    clock_divider_in => clock_divider,
                                    clock_out => clock_tmp_2);

    clockdiv3 : clock_div port map (clock_in => clock_tmp_2,
                                    reset_in => reset,
                                    clock_divider_in => clock_divider,
                                    clock_out => clock);

    process
    begin
        CLK <= '1';
        wait for 5 ns;
        CLK <= '0';
        wait for 5 ns;
    end process;
end;
