import wiringPiNim
import strutils
import os

# Just checking that it changes whenever recompiling
# https://github.com/nim-lang/Nim/issues/6424
const build: string = staticExec("date +'%s'")

#import times
# const build: string = $getTime()
# I can't use getTime() or others due to:
# /root/.choosenim/toolchains/nim-1.4.2/lib/pure/times.nim(904, 13)
# Error: cannot 'importc' variable at compile time; clock_gettime


when isMainModule:
  echo build
  echo "On a raspberry pi"
  if piSetupGPIO() >= 0:
    echo "The RPi is ready"

  let ledPin: cint = 17

  piPinModeOutput(ledPin)

  for i in countup(0,10):
    echo "Blinking", i
    if i mod 2 == 0:
      piDigitalWrite(ledPin,1)
    else:
      piDigitalWrite(ledPin,0)
    sleep(1000)

  echo "Terminating..."
