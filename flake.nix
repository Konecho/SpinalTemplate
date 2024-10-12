{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = inputs: let
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      inherit system;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        ## managed by sbt/mill
        # scala_2_12
        # bloop
        # sbt
        mill
        jre
        coursier
        ## formal
        symbiyosys
        yices
        ## sim
        verilator
        verilog
        ## ice40
        icestorm
        ## ecp5
        trellis
        ## gui
        gtkwave
        pulseview
        xdot
        ## cli
        just
        svls
        universal-ctags
        yosys
        nextpnr
        netlistsvg
        gum
        # nbstripout
        (python3.withPackages (
          p:
            with p; [
              pygments
              matplotlib
              ipykernel
              ipywidgets
              python-lsp-server
              black
              cocotb
              pytest
            ]
        ))
      ];
      DISPLAY = ":0";
    };
  };
}
