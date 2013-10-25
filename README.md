bee-sauce
=========

Operating System + Programming Language Bootstrapped from hex files.

**Version 0.2.0**: Input hex and write to disk. Now with traditional hex characters and backspace!

Usage
-----

Boot. Preferably with a writable floppy disk in fdb.
Enter up to 510 bytes via hex digit pairs (characters [0-9a-f], [A-F] will *not* work). Backspace can be used at the beginning of a character pair to undo the previous byte (character pair) entered.
Press 'w' at the beginning of a character pair to write all entered bytes to the 1st sector of fdb. This will happen automatically if 510 bytes are entered. A boot signature (0x55 0xaa) will also be written to the end of the sector.
Press 'q' at the beginning of a character pair to discard everything and do nothing until a reboot.

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

- Edit arbitrary locations in sector memory array.
- Load existing sector from fdb and edit that instead of starting from scratch.
- Refactor code because its a mess and hopefully it can be shortened because typing it all is a pain.

Distant Future Plans
--------------------

- Make bootloader bring machine to similar state as GRUB. (Then dump it for GRUB)
- GUI!
- Networking!
- Accelerated Graphics Driver! (or at least VESA)
- Colored Screens of Death!
- Filesystems!
- Other drivers!
- More stuff! Probably!

Changelog
---------

### 0.2.0

- Characters [0-9a-f] are now converted to the expected byte value.
- Backspace can undo previous entered character pairs/bytes.

### 0.1.0

- Initial Release. Alpha = very yes.
- Converts input character pairs to binary, writes to sector 1 of fdb.
