{pkgs}:
pkgs.mkShell {
  packages =
    (with pkgs; [
      gnumake
      fd
      shellcheck

      alejandra
      nixfmt-rfc-style

      hlint
    ])
    ++ (
      let
        ghcPkgs = pkgs.haskell.packages.ghc9101;
      in (with ghcPkgs; [
        cabal-install
        ghc
        haskell-language-server
        ormolu
        cabal-fmt
      ])
    );
}
