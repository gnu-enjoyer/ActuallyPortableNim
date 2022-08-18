import std/os

echo "Writing file..."

let text = "...probably..."

writeFile("test.txt", text)

assert fileExists("test.txt")

echo "...done."

#Should run on all x86-64 operating systems