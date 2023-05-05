.PHONY: build 

build: deps
	nim c src/main.nim
	gcc -o main build/*.o -static -nostdlib -nostdinc -Wl,-T,cosmo/ape.lds cosmo/crt.o cosmo/ape.o cosmo/cosmopolitan.a -o portablenim.ape
	objcopy -S -O binary portablenim.ape portablenim.com

deps:	
	curl -so cosmopolitan-amalgamation-2.2.zip -z cosmopolitan-amalgamation-2.2.zip https://worker.jart.workers.dev/cosmopolitan/cosmopolitan-amalgamation-2.2.zip && unzip -o cosmopolitan-amalgamation-2.2.zip -d cosmo
