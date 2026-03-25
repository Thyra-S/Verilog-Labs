transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog  -work work +incdir+C:/Users/thyse/ECE3700Labs/lab_4/hdl {C:/Users/thyse/ECE3700Labs/lab_4/hdl/top.v}
vlog  -work work +incdir+C:/Users/thyse/ECE3700Labs/lab_4/hdl {C:/Users/thyse/ECE3700Labs/lab_4/hdl/dflipflop.v}
vlog  -work work +incdir+C:/Users/thyse/ECE3700Labs/lab_4/hdl {C:/Users/thyse/ECE3700Labs/lab_4/hdl/counter.v}
vlog  -work work +incdir+C:/Users/thyse/ECE3700Labs/lab_4/hdl {C:/Users/thyse/ECE3700Labs/lab_4/hdl/clk_divider.v}
vlog  -work work +incdir+C:/Users/thyse/ECE3700Labs/lab_4/hdl {C:/Users/thyse/ECE3700Labs/lab_4/hdl/bcd_to_seven_seg.v}

vlog  -work work +incdir+C:/Users/thyse/ECE3700Labs/lab_4/hdl {C:/Users/thyse/ECE3700Labs/lab_4/hdl/tb_top_counter.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_top_counter

add wave *
view structure
view signals
run -all
