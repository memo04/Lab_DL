library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_alu74381 is
    end entity tb_alu74381 ;

    architecture beh of tb_alu74381 is

        component alu74381 is
        port (
                s : in std_logic_vector (2 downto 0);
                a : in std_logic_vector (3 downto 0);
                b : in std_logic_vector (3 downto 0);
                f : out std_logic_vector (3 downto 0)
                );
                end component alu74381 ;

                signal es : std_logic_vector (2 downto 0):="000";
                signal ea : std_logic_vector (3 downto 0):="1010";
                signal eb : std_logic_vector (3 downto 0):= x"b";
                signal sf : std_logic_vector (3 downto 0);
                
                
                begin
        u0 : alu74381
        port map (
        s => es,
        a => ea,
        b => eb,
        f => sf
        );
        process -- proceso para selector
        variable sel : signed (2 downto 0) := "000" ;
        variable uno : signed (2 downto 0) := "001" ;
       begin
        wait for 20 ns ;
        es <= std_logic_vector ( sel ) ;
        sel := sel + uno ;
   end process ;
end architecture beh ;
                
                