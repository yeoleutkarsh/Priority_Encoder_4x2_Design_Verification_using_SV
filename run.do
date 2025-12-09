

vlog run.svh
vopt work.top +cover=fcbest -o first
vsim -coverage first +testname=first
coverage save onexit run.ucdb 
add wave -position insertpoint sim:/top/vif/*
run -all
 