# VHDL for TinyFPGA_BX


## Install
- Install apio (`pip install apio`)
- Install tinyprog (`pip install -U apio[tinyprog]`)
    - I had a bug in tinyprog, see this issue https://github.com/tinyfpga/TinyFPGA-Bootloader/issues/75
- Install apio toolchains (`apio install oss-cad-suite`)
- Install dependencies (dependencies include boost, gcc-ada, gtkwave etc.)
- Install Yosys (either build or from package manager)
- clone ghdl, build and install `cd ghdl/build && ../configure && make && sudo make install`
    - This installs into /usr/local/bin
- clone ghdl-yosys-plugin and build and install `cd ghdl-yosys-plugin && make && sudo make install`
    - This installs the plugin into the yosys plugin directory at /usr/share/yosys/plugins/
- Make sure paths in env.sh are correct and `source env.sh`
- `apio build` builds the project
- `apio sim` runs the simulator and launchs gtkwave



### Initial Code from FPGAWars/apio-examples:
Example project for [APIO](https://github.com/FPGAwars/apio) that has initial support for both VHDL and Verilog toolchains

It includes example code in VHDL and Verilog and a common SConstruct file.

Test benches and a top level for the ice40 (TinyFPGA BX) included as well.

For VHDL usage, first source the env.sh script.
Clean up left-over artifacts using the clean.sh script.

## Authors

* **Bastian Löher** - *Initial work*
