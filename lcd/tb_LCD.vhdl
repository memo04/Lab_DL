library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_LCD is
end entity tb_LCD;

architecture beh of tb_LCD is
component LCD is
    port(
        clk:in std_logic;
        numins:in std_logic_vector(3 downto 0);
        palabra:out std_logic_vector(12 downto 0)
    );
end component;

    signal clk:std_logic := '0';
    signal numins:std_logic_vector(3 downto 0);
    signal palabra:std_logic_vector(12 downto 0);

begin
    u0:LCD
    port map(
        clk => clk,
        numins => numins,
        palabra => palabra
    );
    process
    begin
        wait for 20 ns;
            clk <= not clk;
        wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
         wait for 20 ns;
            clk <= not clk;
 
    end process;
end architecture beh;

