import std/[os, threadpool, locks]

## os

echo "Writing file..."

let text = "...probably..."

writeFile("test.txt", text)

assert fileExists("test.txt")

echo "...done."

## pthreads + mutexes
 
var L: Lock
var count {.guard: L.} = 0

proc threadedEcho() =
  withLock L:
    count.inc
  
for i in 0..7:
    spawn threadedEcho()

sync()

assert count == 8

#Should run on all x86-64 operating systems