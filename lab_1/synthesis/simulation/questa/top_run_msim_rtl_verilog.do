transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog  -work work +incdir+C:/Users/thyse/ECE3700Labs/lab_1/hdl {C:/Users/thyse/ECE3700Labs/lab_1/hdl/two_bit_computer.v}

vlog  -work work +incdir+C:/Users/thyse/ECE3700Labs/lab_1/synthesis/../hdl {C:/Users/thyse/ECE3700Labs/lab_1/synthesis/../hdl/tb_two_bit_computer.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_two_bit_computer

add wave *
view structure
view signals
run -all
