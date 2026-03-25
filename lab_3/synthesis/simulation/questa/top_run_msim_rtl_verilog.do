transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog  -work work +incdir+C:/Users/thyse/ECE3700Labs/lab_3/hdl {C:/Users/thyse/ECE3700Labs/lab_3/hdl/top.v}
vlog  -work work +incdir+C:/Users/thyse/ECE3700Labs/lab_3/hdl {C:/Users/thyse/ECE3700Labs/lab_3/hdl/comparator_4bit.v}

vlog  -work work +incdir+C:/Users/thyse/ECE3700Labs/lab_3/synthesis/../hdl {C:/Users/thyse/ECE3700Labs/lab_3/synthesis/../hdl/tb_4bitcomp.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_4bitcomp

add wave *
view structure
view signals
run -all
