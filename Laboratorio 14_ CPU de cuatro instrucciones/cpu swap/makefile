all: tb_cpuswap.vcd

tb_cpuswap.vcd: ac_bib.o registro.o buffer3e.o control.o cpuswap.o tb_cpuswap.o
	ghdl -e tb_cpuswap
	./tb_cpuswap --stop-time=5000ns --vcd=tb_cpuswap.vcd
	gtkwave tb_cpuswap.vcd ondas.gtkw

ac_bib.o: ac_bib.vhdl
	ghdl -a ac_bib.vhdl

registro.o: registro.vhdl
	ghdl -a registro.vhdl

buffer3e.o: buffer3e.vhdl
	ghdl -a buffer3e.vhdl

cpuswap.o: cpuswap.vhdl
	ghdl -a cpuswap.vhdl

control.o: control.vhdl
	ghdl -a control.vhdl

tb_cpuswap.o: tb_cpuswap.vhdl
	ghdl -a tb_cpuswap.vhdl

clean:
	rm *.o tb_cpuswap *.vcd *.cf
