-- declaramos nuestra libreria ieee para poder utilizar std_logic y std_logic_vector 
library ieee; --declaramos nuestra libreria
use ieee.std_logic_1164.all;
use work.dl_bib.all; --ponemos nuestra biblioteca donde ya tenemos nuestros componentes a utilizar para poder alambrar

entity cpu4inst is
   port( 
       interna:in std_logic; --esto es igual al poner bit 
       inst:in std_logic_vector(7 downto 0); --lo mismo al poner bit_vector
       lcd:out std_logic_vector(11 downto 0);
       dr0:out std_logic_vector(6 downto 0);
       dr1:out std_logic_vector(6 downto 0);
       dr2:out std_logic_vector(6 downto 0);
       dr3:out std_logic_vector(6 downto 0);
       dt0:out std_logic_vector(6 downto 0);
       dt1:out std_logic_vector(6 downto 0);
       led:out std_logic;
       done:out std_logic );
end entity cpu4inst;

architecture beh of cpu4inst is
--con esta constante elegimos el tiempo del ciclo del clock
    constant maximo:integer:= 50000000; 
	 signal contador:integer range 0 to maximo;
	 signal ini:integer range 0 to maximo;

    signal cop:std_logic_vector(12 downto 0); --aqui es donde nosotros recibimos los codigos de operacion del control para asi asignarselos
--a cada entrada de nuestros registros.buses y el alu
    signal r0_b0:std_logic_vector(3 downto 0);  
    signal r1_b1:std_logic_vector(3 downto 0);
    signal r2_b2:std_logic_vector(3 downto 0);  
    signal r3_b3:std_logic_vector(3 downto 0);
    signal rt0_bt0:std_logic_vector(3 downto 0); 
    signal rt1_bt1:std_logic_vector(3 downto 0); 
    signal bus_alam:std_logic_vector(3 downto 0); 
    signal a0,a1:std_logic_vector(3 downto 0);

    signal lcds:std_logic_vector(11 downto 0):="000000000000";
    signal clk:std_logic:='0';
    signal int:std_logic:='0';
	 
	 
   begin
	--lcd(10)<=lcds(10);
	--led<=interna;
	  process(interna)
       begin
       if interna'event and interna='1' then
            if contador < maximo then
			    contador <= contador+1;
				 
			   else
				 contador <= 0;
				 clk<=not clk;
            end if; 
		end if;
     end process;
	  

led<=clk;	
	

	
	
	
    --declaramos nuestra unidad de control
    cont:control
    port map( 
       clk => clk,
       inst => inst,
       q => cop,
       done => done,
       busw => a1 );

    --declaramos nuestros registros con su respectivo buffer de 3 estados 
    r0:registro
    port map(
            clk => clk,
            ent => bus_alam,
            h => cop(12),
            sal => r0_b0 );
            
            
    b0:buffer3e
    port map( 
       ent => r0_b0,
       h => cop(11),
       sal => bus_alam );

    r1:registro
    port map(
            clk => clk,
            ent => bus_alam,
            h => cop(10),
            sal => r1_b1 );
    b1:buffer3e
    port map( 
       ent => r1_b1,
       h => cop(9),
       sal => bus_alam );

    r2:registro
    port map(
            clk => clk,
            ent => bus_alam,
            h => cop(8),
            sal => r2_b2 );
    b2:buffer3e
    port map( 
       ent => r2_b2,
       h => cop(7),
       sal => bus_alam );

    r3:registro
    port map(
            clk => clk,
            ent => bus_alam,
            h => cop(6),
            sal => r3_b3 );
    b3:buffer3e
    port map( 
       ent => r3_b3,
       h => cop(5),
       sal => bus_alam );

  --vamos siguiendo el diagrama estructural aqui entran datos al registro temporal 0 entran despues al alu y luego a otro registro
    rt0:registro
    port map(
            clk => clk,
            ent => bus_alam,
            h => cop(4),
            sal => rt0_bt0 );
  
    --declaramos nuestra alu
      alu0:alu
      port map(
      	      a => rt0_bt0,
	      b => bus_alam,
	      F => cop(1),
	      result => a0 );

      rt1:registro
      port map(
            clk => clk,
            ent => a0,
            h => cop(3),
            sal => rt1_bt1 );
 
      b4:buffer3e
      port map( 
            ent => rt1_bt1,
            h => cop(2),
            sal => bus_alam );

      b5:buffer3e
      port map( 
            ent => a1,
            h => cop(0),
            sal => bus_alam );

    u0:decobin2hex7seg
    port map(
			ent=>r0_b0,
			sal=>dr0
			);

    u1:decobin2hex7seg
    port map(
			ent=>r1_b1,
			sal=>dr1
			);
			
    u2:decobin2hex7seg
    port map(
			ent=>r2_b2,
			sal=>dr2
			);
			
			
    u3:decobin2hex7seg
    port map(
			ent=>r3_b3,
			sal=>dr3
			);			
			
			
							
    u4:decobin2hex7seg
    port map(
			ent=>rt0_bt0,
			sal=>dt0
			);	
	
    u5:decobin2hex7seg
    port map(
			ent=>rt1_bt1,
			sal=>dt1
			);	
    
end architecture beh;
