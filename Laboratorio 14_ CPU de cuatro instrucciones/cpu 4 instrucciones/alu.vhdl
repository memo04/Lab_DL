library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
  port (
    f: in  std_logic;
    a: in  std_logic_vector(3 downto 0);
    b: in  std_logic_vector(3 downto 0);
    res: out std_logic_vector(3 downto 0)
  ) ;
end alu;

architecture beh of alu is

    signal aint,bint,resint:signed(3 downto 0);

begin
    aint <= signed(a);
    bint <= signed(b);
    res    <= std_logic_vector(resint);

    process( s,a,b )
    begin
        case( s ) is
        
            when '0' =>
            fint <= aint + bint;
            when '1' =>
            fint <= aint - bint;
        end case ;
        
    end process ; -- 
end beh ; -- beh