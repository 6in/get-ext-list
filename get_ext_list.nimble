# Package

version       = "0.1.0"
author        = "Satoshi Ohya"
description   = "find file's extension from directories"
license       = "MIT"

# Mainとして起動するファイル
let mainFile = "get_ext_list"

srcDir = "src"
binDir = "bin"
bin = @[mainFile]

task test, "execute unit" :
    exec "nim c -r tests/tester"

task clean, "clean files" :
    exec "rm -rf src/nimcache"
    exec "rm -rf bin"

# Dependencies

requires "nim >= 0.17.0"
