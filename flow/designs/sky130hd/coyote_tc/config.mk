export DESIGN_NICKNAME = coyote_tc
export DESIGN_NAME = coyote_tc

export PLATFORM    = sky130hd
# Clone Skywater library:
# git clone git@github.com:google/skywater-pdk.git --recursive
#

export SKY130_IO_VERSION ?= v0.2.0
export OPENRAMS_DIR = ./platforms/sky130ram
export IO_DIR       = ./platforms/sky130io

export VERILOG_FILES = ./designs/src/coyote_tc/coyote_tc.v \
                       ./designs/src/coyote/coyote.sv2v.v \
                       ./designs/$(PLATFORM)/coyote_tc/ios.v \
                       ./designs/$(PLATFORM)/coyote_tc/macros.v \
                       $(IO_DIR)/verilog/sky130_io.blackbox.v

export SDC_FILE          = ./designs/$(PLATFORM)/coyote_tc/constraint.sdc

export FOOTPRINT         = ./designs/$(PLATFORM)/coyote_tc/coyote_tc.package.strategy
export SIG_MAP_FILE      = ./designs/$(PLATFORM)/coyote_tc/coyote_tc.sigmap
export FOOTPRINT_LIBRARY = $(IO_DIR)/library.sky130_fd_io.tcl

export ADDITIONAL_LIBS = $(OPENRAMS_DIR)/sky130_sram_1rw1r_80x64_8/sky130_sram_1rw1r_80x64_8_TT_1p8V_25C.lib \
                         $(OPENRAMS_DIR)/sky130_sram_1rw1r_128x256_8/sky130_sram_1rw1r_128x256_8_TT_1p8V_25C.lib \
                         $(OPENRAMS_DIR)/sky130_sram_1rw1r_44x64_8/sky130_sram_1rw1r_44x64_8_TT_1p8V_25C.lib \
                         $(OPENRAMS_DIR)/sky130_sram_1rw1r_64x256_8/sky130_sram_1rw1r_64x256_8_TT_1p8V_25C.lib \
                         $(IO_DIR)/lib/sky130_dummy_io.lib

export ADDITIONAL_GDS  = $(OPENRAMS_DIR)/sky130_sram_1rw1r_80x64_8/sky130_sram_1rw1r_80x64_8.gds \
                         $(OPENRAMS_DIR)/sky130_sram_1rw1r_128x256_8/sky130_sram_1rw1r_128x256_8.gds \
                         $(OPENRAMS_DIR)/sky130_sram_1rw1r_44x64_8/sky130_sram_1rw1r_44x64_8.gds \
                         $(OPENRAMS_DIR)/sky130_sram_1rw1r_64x256_8/sky130_sram_1rw1r_64x256_8.gds

export ADDITIONAL_LEFS = \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__gpiov2_pad_wrapped.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__com_bus_slice_10um.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__com_bus_slice_1um.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__com_bus_slice_20um.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__com_bus_slice_5um.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__corner_pad.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__vccd_hvc_pad.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__vccd_lvc_pad.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__vdda_hvc_pad.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__vdda_lvc_pad.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__vddio_hvc_pad.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__vddio_lvc_pad.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__vssa_hvc_pad.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__vssa_lvc_pad.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__vssd_hvc_pad.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__vssd_lvc_pad.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__vssio_hvc_pad.lef \
                         $(SKY130_EF_PDK)/custom/sky130_fd_io/lef/sky130_ef_io__vssio_lvc_pad.lef \
                         $(OPENRAMS_DIR)/sky130_sram_1rw1r_80x64_8/sky130_sram_1rw1r_80x64_8.lef \
                         $(OPENRAMS_DIR)/sky130_sram_1rw1r_128x256_8/sky130_sram_1rw1r_128x256_8.lef \
                         $(OPENRAMS_DIR)/sky130_sram_1rw1r_44x64_8/sky130_sram_1rw1r_44x64_8.lef \
                         $(OPENRAMS_DIR)/sky130_sram_1rw1r_64x256_8/sky130_sram_1rw1r_64x256_8.lef \

# These values must be multiples of placement site
export DIE_AREA    = 0.0 0.0 5200 4609.14
export CORE_AREA   = 210 210 4990 4389.14

export ABC_CLOCK_PERIOD_IN_PS = 10000
export ABC_DRIVER_CELL = sky130_fd_sc_hd__buf_1
export ABC_LOAD_IN_FF = 3

export POST_SYNTHESYS_RENAMING = ./designs/$(PLATFORM)/coyote_tc/post_synthesis_rename.tcl

# Use custom power grid with core rings offset from the pads
export PDN_CFG = ./designs/$(PLATFORM)/coyote_tc/pdn.cfg

# Point to the RC file
export SETRC_FILE = $(PLATFORM_DIR)/setRC.tcl

export MIN_ROUTING_LAYER 2
export MAX_ROUTING_LAYER 6

export FASTROUTE_TCL $(PLATFORM_DIR)/fastroute.tcl

