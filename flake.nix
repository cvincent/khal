{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/09061f748ee21f68a089cd5d91ec1859cd93d0be";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      pythonPackages = pkgs.python314Packages;
      venvDir = "./.venv";
    in
    {
      devShell.${system} = pkgs.mkShell {
        inherit venvDir;

        packages = [
          pythonPackages.venvShellHook
        ];
      };
    };
}
