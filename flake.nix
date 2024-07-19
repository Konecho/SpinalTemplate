{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = inputs: let
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      inherit system;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      nativeBuildInputs = with pkgs; [
        zlib
        boost
      ];
      packages = with pkgs; [
        ## managed by sbt
        # scala_2_12
        ## sbt will invoke a more recent version of openjdk
        # sbt
        mill
        openjdk17
        # bloop
        ## formal
        symbiyosys
        yices
        ## sim
        gtkwave
        verilator
        verilog
        yosys
        xdot
        # gv
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
            ]
        ))
      ];
    };
  };
}
