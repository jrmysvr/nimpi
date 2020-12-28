# Package

version       = "0.1.0"
author        = "Jeremy Savor"
description   = "Do stuff on a raspberry pi zero"
license       = "MIT"
srcDir        = "src"
bin           = @["nimpi"]


# Dependencies

requires "nim >= 1.4.0"
requires "https://github.com/ThomasTJdev/nim_wiringPiNim"

task release, "Build a release":
  exec "nimble clean"
  exec "nim c src/nimpi.nim"

task clean, "Clean up":
  exec "rm -rf dist_rpi/ build_rpi/"
