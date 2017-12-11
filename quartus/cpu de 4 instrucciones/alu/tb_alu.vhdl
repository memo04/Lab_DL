-- declaramos nuestra libreria ieee para poder utilizar std_logic y std_logic_vector 
library ieee; --declaramos nuestra libreria
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_alu is
end entity tb_alu;

architecture beh of tb_alu is

component alu is 
  port(
        a:in std_logic_vector(3 downto 0);
	b:in std_logic_vector(3 downto 0);
	F:in std_logic;
	result:out std_logic_vector(3 downto 0) );

end component alu;

signal botona:std_logic_vector(3 downto 0):="0000";
signal botonb:std_logic_vector(3 downto 0):="0000";
signal botonF:std_logic:='0';
signal ledr:std_logic_vector(3 downto 0);

begin
--instanciamos el adder en nuestro test bench
   alu4:alu
    port map(
            a => botona,
            b => botonb,
            F => botonF,
	    result => ledr );

estimuloa:process  --proceso  para  a
begin
wait  for 35 ns;
botona  <=  "1110";
end  process  estimuloa;

estimulob:process  --proceso  para b
begin
wait  for 35 ns;
botonb  <=  "1010";
end  process  estimulob;

estimulof:process  --proceso  para f
begin
wait  for 50 ns;
botonF  <=  '1';
wait  for 50 ns;
botonF  <=  '0';
end process  estimulof;
end architecture beh;
