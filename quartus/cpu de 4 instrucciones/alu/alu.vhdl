-- declaramos nuestra libreria ieee para poder utilizar std_logic y std_logic_vector 
library ieee; --declaramos nuestra libreria
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu is
	port
	(
	a:in std_logic_vector(3 downto 0);
	b:in std_logic_vector(3 downto 0);
	F:in std_logic;
	result:out std_logic_vector(3 downto 0) );
end entity alu;

architecture beh of alu is
   begin
    result <= ( a - b ) when F = '1' else (a + b);
end architecture beh;


