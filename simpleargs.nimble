# Package

version       = "0.1.0"
author        = "edoardo.giacopuzzi"
description   = "Simple command line arguments parsing"
license       = "MIT"

srcDir        = "src"
skipDirs      = @["tests"]

# Dependencies
requires "nim >= 1.4.8"

import os, strutils

task docs, "Builds documentation":
  mkDir("docs")
  exec "nim doc2 --verbosity:0 --hints:off --outdir:docs src/simpleargs/arg_parse.nim"