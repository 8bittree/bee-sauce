bee-sauce
=========

Operating System + Programming Language Bootstrapped from hex files.

**Version 0.3.1**: Fix "compilation."

**Version 0.3.0**: Load sector 1 of fdb into a memory array. Edit arbitrary
bytes in the first 510 bytes of that array. Write the array back to sector 1 of
fdb. Also this was a major rewrite.

Usage
-----

1. Boot. Preferably with a writable floppy disk in fdb. bee-sauce will attempt
   to read sector 1 from fdb and load it into memory for editing. It will print
   `OK` on success or an error code on a read failure.
2. The prompt displays the current byte location in the array and, in the
   brackets, the value of the current byte. both numbers are in hexadecimal.
3. Move to the next byte by pressing 'l' at the prompt. Move the the previous
   byte by pressing 'h' at the prompt. Note that you cannot move before byte 0
   or after byte 509 (bytes 510 and 511 are reserved for boot signature).
4. Edit the current byte by typing 2 hexadecimal characters [0-9a-f] at the
   prompt. There will be no feedback between typing the first character and
   typing the second. After typing the second, the cell value should update.
5. Press 'w' to write the memory array to sector 1 of fdb. `OK` will be printed
   on success and an error code otherwise.

To Build
--------

### Requirements

- `make`
- `xxd`
- `sed`
- `dd` (optional, for floppy disk image)
- `qemu` (optional, for testing)

### Steps... ish

1. In the project root directory, type `make`. This will make a `boot.bin` file
   in the bin directory. You can then move that file to a bootable medium, in
   theory (I make no guarantees that anything here will work.)
2. Alternatively, type `make floppy` in the project root directory. This will
   also produce the `boot.bin` file in the bin directory. It will also make a
   floppy disk image called `floppy.flp` in the bin directory. This in theory
   should be directly copyable to a standard 1.44MB floppy disk. Or you can use
   QEMU to directly boot from the disk image.

Near Future Plans
-----------------


Distant Future Plans
--------------------

- Make bootloader bring machine to similar state as GRUB. (Then dump it for
  GRUB)
- GUI!
- Networking!
- Accelerated Graphics Driver! (or at least VESA)
- Colored Screens of Death!
- Filesystems!
- Other drivers!
- More stuff! Probably!

Changelog
---------

### 0.3.1

- At some point, `xxd` stopped ignoring the stuff after the `#`s. This
  is just a small fix that strips that stuff out before passing it to
  `xxd`. Now requires `sed` to build.

### 0.3.0

- Pretty much a complete rewrite. Unfortunately still ended up longer than
  previous releases, despite vastly reducing nop density. On the bright side,
  we have a stack now. So calls and rets work.
- Loads sector 1 from fdb into memory for editing.
- Added a persistant prompt with current byte location and value.
- 'h' moves to the previous byte, 'l' moves to the next byte. Note that you
  can't move before byte 0 or after byte 509.
- Backspace no longer has special functionality as its previous function was
  obsoleted by 'h' and 'l'.
- 'q' also had its functionality removed. It was kind of pointless.
- Editing can continue after writing to disk (which now only happens when
  pressing 'w').
- If a read or a write succeeds, "OK" is printed. If it fails, the error code
  is printed.

### 0.2.0

- Characters [0-9a-f] are now converted to the expected byte value.
- Backspace can undo previous entered character pairs/bytes.

### 0.1.0

- Initial Release. Alpha = very yes.
- Converts input character pairs to binary, writes to sector 1 of fdb.
