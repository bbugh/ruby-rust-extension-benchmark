require "mkmf"

CONFIG["debugflags"] = "-ggdb3"
CONFIG["optflags"] = "-O0"

create_makefile("example_ext/example_ext")
