all: clean floppy

floppy: bin/boot.bin bin/floppy.flp
	dd conv=notrunc if=bin/boot.bin of=bin/floppy.flp

bin/floppy.flp:
	dd if=/dev/zero of=bin/floppy.flp bs=512 count=2880

bin/boot.bin: src/boot.hex
	xxd -r -p src/boot.hex bin/boot.bin

clean:
	rm -rf bin/floppy.flp bin/boot.bin

test: all
	qemu-system-x86_64 -fda bin/floppy.flp
