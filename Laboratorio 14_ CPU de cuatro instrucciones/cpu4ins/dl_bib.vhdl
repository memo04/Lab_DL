-- declaramos nuestra libreria ieee para poder utilizar std_logic y std_logic_vector 
library ieee; --declaramos nuestra libreria
use ieee.std_logic_1164.all;

package dl_bib is 


component decobin2hex7seg is
   port( 

	ent: in std_logic_vector(3 downto 0);
	sal: out std_logic_vector(6 downto 0)
       );
end component decobin2hex7seg;
--iniciamos nuestro buffer de 3 estados
 component buffer3e is
   port( 
       ent:in std_logic_vector(3 downto 0); --lo mismo al poner bit_vector
       h:in std_logic; --lo mismo al poner bit;
       sal:out std_logic_vector(3 downto 0) );
end component buffer3e;
   
   --inicamos nuestro registro
  component registro is
   port( 
       clk:in std_logic; --esto es igual al poner bit 
       ent:in std_logic_vector(3 downto 0); --lo mismo al poner bit_vector
       h:in std_logic;
       sal:out std_logic_vector(3 downto 0) );
end component registro;

   --inicamos nuestro control 
component control is
   port( 
       clk:in std_logic; --esto es igual al poner bit 
       inst:in std_logic_vector(7 downto 0);
       q:out std_logic_vector(12 downto 0);
       done:out std_logic;
       busw:out std_logic_vector(3 downto 0) );
end component control;

component alu is
	port
	(
	a:in std_logic_vector(3 downto 0);
	b:in std_logic_vector(3 downto 0);
	F:in std_logic;
	result:out std_logic_vector(3 downto 0) );
end component alu;

end package dl_bib;
