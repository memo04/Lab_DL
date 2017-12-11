library ieee;
use ieee.std_logic_1164.all;

entity registro is
  port (
    clk: in  std_logic;
    ent: in  std_logic_vector(3 downto 0);
    h :  in  std_logic;
    sal: out std_logic_vector(3 downto 0)
  ) ;
end registro ;

architecture beh of registro is
begin
        process( clk )
        begin
            if clk'event and clk = '1' then
                if h = '1' then
                    sal <= ent;
                end if ;
            end if ;
        end process ;
end architecture beh ; 