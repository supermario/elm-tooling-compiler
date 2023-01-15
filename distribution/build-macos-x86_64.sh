#!/usr/bin/env bash
set -ex                                                   # Be verbose and exit immediately on error instead of trying to continue

buildTag="elm-macos-x86_64"

ghcup install ghc 9.0.2 --set
ghcup install cabal 3.6.2.0 --set



scriptDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd "$scriptDir/.."                                        # Move into the project root





cabal update
cabal build -j4                                           # Build with concurrency 4

mkdir -p distribution/dist                                # Ensure the dist directory is present

bin=distribution/dist/$buildTag
cp "$(cabal list-bin .)" $bin                             # Copy built binary to dist
strip $bin                                                # Strip symbols to reduce binary size (90M -> 56M)
