{
  description = "Nix development shell for the Pizzakaufen profile repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            git
            lua
            lua-language-server
            dotnet-sdk_8
            clang-tools
            cmake
            pkg-config
            nixfmt-rfc-style
          ];

          shellHook = ''
            echo "Entered the Pizzakaufen Nix development shell"
          '';
        };
      });
}
