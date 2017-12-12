--Guillermo Del Rio B
--2112004585
--Ing en Computacion

library ieee;
use ieee.std_logic_1164.all;

entity control is
  port (
    clk  :in  std_logic;
    inst :in  std_logic_vector(7 downto 0);
    q    :out std_logic_vector(12 downto 0);
    done :out std_logic;
    buss :out std_logic_vector(3 downto 0) );
  ) ;
end control ;

architecture arch of control is



begin

process(clk)
    begin
        if clk'event and clk='1' then
            ep <= es;
        end if;
end process;



end architecture ; -- arch