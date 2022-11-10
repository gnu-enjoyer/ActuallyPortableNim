.PHONY: build 

build:
	curl -so cosmopolitan-amalgamation-2.2.zip -z cosmopolitan-amalgamation-2.2.zip https://worker.jart.workers.dev/cosmopolitan/cosmopolitan-amalgamation-2.2.zip && unzip -o cosmopolitan-amalgamation-2.2.zip -d cosmo
	nim c --mm:orc --threads:on -d:useMalloc --nimcache:./build src/main.nim
	gcc -o main build/*.o -static -nostdlib -nostdinc -Wl,-T,cosmo/ape.lds cosmo/crt.o cosmo/ape.o cosmo/cosmopolitan.a -o portablenim.ape
	objcopy -S -O binary portablenim.ape portablenim.com

danger:
	nim c --noLinking:off -d:danger --opt:size --passL:"-static -nostdlib -nostdinc -Wl,-T,cosmo/ape.lds cosmo/crt.o cosmo/ape.o cosmo/cosmopolitan.a" -o:danger.ape src/main.nim
	objcopy -S -O binary danger.ape danger.com