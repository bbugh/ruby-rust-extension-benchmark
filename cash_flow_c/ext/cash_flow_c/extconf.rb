require "mkmf"

CONFIG["debugflags"] = "-ggdb3"
CONFIG["optflags"] = "-O0"

create_makefile("cash_flow_c/cash_flow_c")
