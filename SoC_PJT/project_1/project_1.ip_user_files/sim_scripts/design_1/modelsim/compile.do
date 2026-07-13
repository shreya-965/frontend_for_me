vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/blk_mem_gen_v8_4_12
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/util_vector_logic_v2_0_5

vmap xpm modelsim_lib/msim/xpm
vmap blk_mem_gen_v8_4_12 modelsim_lib/msim/blk_mem_gen_v8_4_12
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap util_vector_logic_v2_0_5 modelsim_lib/msim/util_vector_logic_v2_0_5

vlog -work xpm -64 -incr -mfcu  -sv "+incdir+../../../../../../../../../run/media/shreya/Ultra Touch/Vivado/ubuntu_vivado/2025.2/data/rsb/busdef" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" \
"/run/media/shreya/Ultra Touch/Vivado/ubuntu_vivado/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/run/media/shreya/Ultra Touch/Vivado/ubuntu_vivado/2025.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/run/media/shreya/Ultra Touch/Vivado/ubuntu_vivado/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vlog -work blk_mem_gen_v8_4_12 -64 -incr -mfcu  "+incdir+../../../../../../../../../run/media/shreya/Ultra Touch/Vivado/ubuntu_vivado/2025.2/data/rsb/busdef" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" \
"../../../../project_1.gen/sources_1/bd/design_1/ip/design_1_picorv32_core_0_0/src/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../../../../../../run/media/shreya/Ultra Touch/Vivado/ubuntu_vivado/2025.2/data/rsb/busdef" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" \
"../../../bd/design_1/ip/design_1_picorv32_core_0_0/src/sim/blk_mem_gen_0.v" \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/4006/src/picorv32.v" \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/4006/src/picorv32_core.v" \
"../../../bd/design_1/ip/design_1_picorv32_core_0_0/sim/design_1_picorv32_core_0_0.v" \
"/home/shreya/frontend_for_me/SoC_PJT/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_axi_uartlite_0_0/design_1_axi_uartlite_0_0_sim_netlist.v" \
"/home/shreya/frontend_for_me/SoC_PJT/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_axi_quad_spi_0_0/design_1_axi_quad_spi_0_0_sim_netlist.v" \
"/home/shreya/frontend_for_me/SoC_PJT/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_axi_gpio_0_0/design_1_axi_gpio_0_0_sim_netlist.v" \
"/home/shreya/frontend_for_me/SoC_PJT/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_proc_sys_reset_0_0/design_1_proc_sys_reset_0_0_sim_netlist.v" \
"/home/shreya/frontend_for_me/SoC_PJT/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_axi_bram_ctrl_0_0/design_1_axi_bram_ctrl_0_0_sim_netlist.v" \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_0/sim/design_1_blk_mem_gen_0_0.v" \
"/home/shreya/frontend_for_me/SoC_PJT/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_sim_netlist.v" \

vlog -work util_vector_logic_v2_0_5 -64 -incr -mfcu  "+incdir+../../../../../../../../../run/media/shreya/Ultra Touch/Vivado/ubuntu_vivado/2025.2/data/rsb/busdef" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/e056/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../../../../../../run/media/shreya/Ultra Touch/Vivado/ubuntu_vivado/2025.2/data/rsb/busdef" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/a415" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" \
"../../../bd/design_1/ip/design_1_util_vector_logic_0_0/sim/design_1_util_vector_logic_0_0.v" \
"/home/shreya/frontend_for_me/SoC_PJT/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_axi_interconnect_0_upgraded_ipi_imp_xbar_0/design_1_axi_interconnect_0_upgraded_ipi_imp_xbar_0_sim_netlist.v" \
"/home/shreya/frontend_for_me/SoC_PJT/project_1/project_1.gen/sources_1/bd/design_1/ip/design_1_axi_interconnect_0_imp_auto_pc_0/design_1_axi_interconnect_0_imp_auto_pc_0_sim_netlist.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

