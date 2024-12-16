{pkgs}:
pkgs.mkShell {
  packages =
    (with pkgs; [
      gnumake
      fd
      shellcheck

      alejandra
      nixfmt-rfc-style
      nodePackages_latest.prettier

      hlint
    ])
    ++ (
      let
        ghcPkgs = pkgs.haskell.packages.ghc9101;
      in (with ghcPkgs; [
        (ghcWithPackages (haskellPackages: with haskellPackages; [hspec]))

        cabal-install
        haskell-language-server
        ormolu
        cabal-fmt
        hspec-discover
      ])
    );
}
