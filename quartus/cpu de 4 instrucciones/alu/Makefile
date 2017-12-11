#Hector Fabian Zacate Galicia

all:tb_alu

tb_alu: alu.o tb_alu.o
	ghdl -e --ieee=synopsys tb_alu 
	./tb_alu --stop-time=1000ns --vcd=tb_alu.vcd
	gtkwave tb_alu.vcd ondas.gtkw

alu.o:  alu.vhdl
	ghdl -a --ieee=synopsys alu.vhdl

tb_alu.o: tb_alu.vhdl
	ghdl -a --ieee=synopsys tb_alu.vhdl

clean:
	rm *.o *.vcd tb_alu *.cf  
