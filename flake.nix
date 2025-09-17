{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs =
    { nixpkgs, ... }:
    {
      packages =
        let

          forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
        in
        forAllSystems (
          system:
          let
            pkgs = nixpkgs.legacyPackages.${system};
          in
          {
            tree-sitter-sieve = pkgs.tree-sitter.buildGrammar {
              language = "sieve";
              version = "0.1";
              src = ./.;
            };

            topiary-sieve =
              pkgs.runCommand "topiary-sieve"
                {
                  version = "0.1";

                  src = ./.;
                }
                ''
                  install -D --target-directory $out/share/queries/ $src/topiary/sieve.scm
                '';
          }
        );

      devShells.x86_64-linux.default =
        let
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        in
        pkgs.mkShell {
          packages = [
            pkgs.nodejs
            pkgs.tree-sitter
          ];
        };
    };
}
