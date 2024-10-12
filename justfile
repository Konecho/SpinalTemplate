spinal:
    -git submodule deinit -f lib/SpinalHDL
    -rmdir lib/SpinalHDL
    mkdir -p lib
    cd lib && git submodule add -f --depth 1 -b dev https://github.com/SpinalHDL/SpinalHDL.git

test:
    mill projectname.runMain projectname.MyTopLevelVerilog
    mill projectname.runMain projectname.MyTopLevelFormal
    mill projectname.runMain projectname.MyTopLevelSim