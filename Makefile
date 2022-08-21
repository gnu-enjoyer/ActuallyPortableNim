build:
	wget https://worker.jart.workers.dev/cosmopolitan-amalgamation-2.0.zip -O cosmopolitan-amalgamation-2.0.zip  && unzip -o cosmopolitan-amalgamation-2.0.zip -d cosmo && nim c -d:danger --opt:size \
--passC:"-Iinclude -static -nostdlib -nostdinc -fno-pie -no-pie -mno-red-zone -mno-tls-direct-seg-refs -include cosmo/cosmopolitan.h" \
--passL:"-static -nostdlib -nostdinc -Wl,-T,cosmo/ape.lds cosmo/crt.o cosmo/ape.o cosmo/cosmopolitan.a" \
-o:portablenim.ape src/main.nim && objcopy -S -O binary portablenim.ape portablenim.com
