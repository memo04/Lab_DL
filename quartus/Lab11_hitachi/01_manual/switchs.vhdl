--Manuel Eduardo Hernandez Ruiz
--Ing. en Electronica 
--Matricula: 2152000347

entity switchs is 
	port(
		ent:  in bit_vector (11 downto 0);
		lent: out bit_vector (11 downto 0);
		sal: out bit_vector (11 downto 0)
		);
end entity;

architecture manolo of switchs is 
begin 
--11 10 9  8  7  6  5  4  3  2  1  0
--ON E RS RW  D7 D6 D5 D4 D3 D2 D1 D0
--------------------------------------
-- 1 0  0  0  0  0  1  1  1  1  0  0 	dos lineas
-- 1 1  0  0  0  0  1  1  1  1  0  0	
-- 1 0  0  0  0  0  0  0  1  1  0  1	cursor parapdear
-- 1 1  0  0  0  0  0  0  1  1  0  1
-- 1 0  0  0  0  0  0  0  0  0  0  1 	borra y home
-- 1 1  0  0  0  0  0  0  0  0  0  1 	borra y home
-- 1 0  1  0  0  1  0  0  1  1  1  1   0	 



	lent <= ent;
	sal <= ent;

end architecture manolo;
