library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
  port (
    s: in  std_logic_vector(2 downto 0);
    a: in  std_logic_vector(3 downto 0);
    b: in  std_logic_vector(3 downto 0);
    f: out std_logic_vector(3 downto 0)
  ) ;
end alu;

architecture beh of alu is

    signal aint,bint,fint:signed(3 downto 0);

begin
    aint <= signed(a);
    bint <= signed(b);
    f    <= std_logic_vector(fint);

    process( s,a,b )
    begin
        case( s ) is
        
            when "000" =>
            fint <= "0000"
            when "001" =>
            fint <= aint - bint;
            when "010" =>
            fint <= bint - aint;
            when "011" =>
            fint <= aint + bint;
            when "100" =>
            fint <= aint xor bint;
            when "101" =>
            fint <= aint or bint;
            when "110" =>
            fint <= aint and bint;
        
            when others =>
                fint <= "1111";
        end case ;
        
    end process ; -- 
end beh ; -- beh