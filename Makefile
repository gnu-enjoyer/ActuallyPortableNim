build:
	nim c -d:release --passC:"-Iinclude -static -nostdlib -nostdinc -fno-pie -no-pie -mno-red-zone -include include/cosmopolitan.h" \
--passL:"-static -nostdlib -nostdinc -Wl,-T,cosmo/ape.lds cosmo/crt.o cosmo/ape.o cosmo/cosmopolitan.a" \
-o:portablenim.ape src/main.nim && objcopy -S -O binary portablenim.ape portablenim.com