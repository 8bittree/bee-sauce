build: bin/boot.bin

clean-build: clean build

floppy: bin/boot.bin bin/floppy.flp
	dd conv=notrunc if=bin/boot.bin of=bin/floppy.flp

clean-floppy: clean floppy

bin/floppy.flp:
	dd if=/dev/zero of=bin/floppy.flp bs=512 count=2880

bin/boot.bin: src/boot.hex
	sed 's/#.*//' src/boot.hex | xxd -r -p >bin/boot.bin

clean:
	rm -rf bin/floppy.flp bin/boot.bin

test: all
	qemu-system-x86_64 -fda bin/floppy.flp
