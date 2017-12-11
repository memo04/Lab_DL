#Hector Fabian Zacate Galicia

all:tb_cpu4inst

tb_cpu4inst: dl_bib.o alu.o buffer3e.o registro.o control.o cpu4inst.o tb_cpu4inst.o
	ghdl -e --ieee=synopsys $@  
	./$@ --stop-time=4000ns --vcd=$@.vcd
	gtkwave $@.vcd ondas.gtkw

dl_bib.o: dl_bib.vhdl
	ghdl -a $^

alu.o: alu.vhdl
	ghdl -a --ieee=synopsys $^

buffer3e.o: buffer3e.vhdl
	ghdl -a $^

registro.o: registro.vhdl
	ghdl -a $^

control.o: control.vhdl
	ghdl -a $^

cpu4inst.o: cpu4inst.vhdl
	ghdl -a $^

tb_cpu4inst.o: tb_cpu4inst.vhdl
	ghdl -a $^

clean:
	rm *.o *.vcd tb_cpu4inst *.cf  
