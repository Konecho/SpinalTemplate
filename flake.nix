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
      ];
      packages = with pkgs; [
        ## managed by sbt
        # scala_2_12
        ## sbt will invoke a more recent version of openjdk
        sbt
        verilator
        ## formal
        symbiyosys
        yices
        ## sim
        openjdk17
        gtkwave
      ];
    };
  };
}
