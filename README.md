bee-sauce
=========

Operating System + Programming Language Bootstrapped from hex files.

**Version 0.1.0**: Input hex and write to disk.

Current Capabilities
--------------------

Boots up and accepts hexadecimal digit pairs (using characters [0-9:;<=>?]) and converts each pair into a single byte. After 510 such pairs, all converted bytes are written to the 1st sector of fdb. Characters other than the digits 0-9, colon, semicolon, left angle bracket, equals, right angle bracket, and question mark are accepted, but the results are mostly undefined. If the first character of the pair is 'q', then 'Bye' is printed and nothing else useful is done. If the first character of the pair is 'w', then all current input bytes are written to the 1st sector of fdb and the boot signature (0x55aa) is written to the end of the sector.

To Build
--------

### Requirements

- `make`
- `xxd`
- `dd` (optional, for floppy disk image)
- `qemu` (optional, for testing)

### Steps... ish

1. In the project root directory, type `make`. This will make a `boot.bin` file in the bin directory. You can then move that file to a bootable medium, in theory (I make no guarantees that anything here will work.)
2. Alternatively, type `make floppy` in the project root directory. This will also produce the `boot.bin` file in the bin directory. It will also make a floppy disk image called `floppy.flp` in the bin directory. This in theory should be directly copyable to a standard 1.44MB floppy disk. Or you can use QEMU to directly boot from the disk image.

Near Future Plans
-----------------

- Start using traditional hex characters [0-9a-f]
- Enable backspace
- Edit arbitrary locations in sector memory array
- Load existing sector from fdb and edit that instead of starting from scratch
