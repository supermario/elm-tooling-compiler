#!/usr/bin/env bash
set -ex                                                   # Be verbose and exit immediately on error instead of trying to continue

buildTag="elm-0.19.1-macos-arm64"

ghcup install ghc 9.0.2 --set
ghcup install cabal 3.6.2.0 --set

opt --version                                             # The arm64 build currently requires llvm until we get to GHC 9.4+

scriptDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd "$scriptDir/.."                                        # Move into the project root

ffiLibs="$(xcrun --show-sdk-path)/usr/include/ffi"        # Workaround for GHC9.0.2 bug until we can use GHC9.2.3+
export C_INCLUDE_PATH=$ffiLibs                            # https://gitlab.haskell.org/ghc/ghc/-/issues/20592#note_436353


cabal update
cabal build -j4                                           # Build with concurrency 4

mkdir -p distribution/dist                                # Ensure the dist directory is present

bin=distribution/dist/$buildTag
cp "$(cabal list-bin .)" $bin                             # Copy built binary to dist
strip $bin                                                # Strip symbols to reduce binary size (90M -> 56M)
