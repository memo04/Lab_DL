library ieee;
use ieee.std_logic_1164.all;

entity control is
  port (
    clk: in std_logic;
    swap: in std_logic;
    t0: out std_logic;
    t1: out std_logic;
    t2: out std_logic;
    done: out std_logic
  ) ;
end control ;

architecture beh of control is
signal estado : integer range 0 to 3 := 0; 
begin

    process( clk )
    begin
        if clk'event and clk = '1' then
            if swap = '1'  then
                case( estado ) is
                    when 0 =>
                        t0 <= '1';t1 <= '0';t2 <= '0';
                        estado <= 1;        
                    when 1 =>
                        t0 <= '0';t1 <= '1';t2 <= '0';
                        estado <= 2;
                    when 2 =>
                        t0 <= '0';t1 <= '0';t2 <= '1';
                        estado <= 3;
                    when 3 =>
                        estado <= 0;
                        done <= '1';
                end case ;
                else
                t0 <= '0';t1 <= '0';t2 <= '0';
                done <= '0';
            end if ;
        end if ;
    end process ;
 end architecture beh; 
