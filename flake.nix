{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    typst = {
      url = "github:typst/typst/v0.2.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = with inputs; [
            devshell.overlays.default
            typst.overlays.default
          ];
        };
      in {
        packages.default = pkgs.stdenvNoCC.mkDerivation {
          name = "document";
          src = ./.;
          buildInputs = with pkgs; [
            typst
            source-han-serif
            fontconfig
          ];

          buildPhase = ''
            typst --font-path ${pkgs.source-han-serif} compile ./main.typ
          '';
          installPhase = ''
            mkdir $out
            cp ./main.pdf $out
          '';
        };
        devShells.default = pkgs.devshell.mkShell {
          packages = with pkgs; [
            alejandra
            typst
            typst-lsp
            source-han-serif
          ];
        };
      }
    );
}
