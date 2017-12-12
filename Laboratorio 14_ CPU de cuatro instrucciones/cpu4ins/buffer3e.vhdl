
library ieee; --declaramos nuestra libreria
use ieee.std_logic_1164.all;

entity buffer3e is
   port( 
       ent:in std_logic_vector(3 downto 0); --lo mismo al poner bit_vector
       h:in std_logic; --lo mismo al poner bit;
       sal:out std_logic_vector(3 downto 0) );
end entity buffer3e;

architecture beh of buffer3e is
 begin
     process(ent,h) --recibimos la entrada y h en la lista de sensibilidad
     begin
           if h = '1' then
              sal <= ent;
           else
               sal <= (others => 'Z'); --hace que  alta inpedencia
        end if;    
     end process;
  end architecture beh;
