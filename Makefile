.DEFAULT_GOAL := all

.PHONY: all fmt lint build

all: fmt lint build

fmt:
	(fd -e nix -X nixfmt {} \; -X alejandra -q {})
	(fd -e cabal -x cabal-fmt -i)
	(fd -e hs -x ormolu -i)

lint:
	(cd src && hlint .)

build:
	(cd src && cabal build)
