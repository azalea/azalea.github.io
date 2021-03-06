---
layout: post
title: Install samtools in Cygwin
categories: 
tags:
- samtools
- cygwin

language: en

---

Start the Cygwin Installer, in the "Select Package" page, search and install gcc-g++, gdb, make, libncurses, zlib, zlib-devel.

Download and extract [samtools](http://sourceforge.net/projects/samtools/).

Append `-Dexpl=exp -Dlogl=log` to Makefile's default DFLAGS line, such as:

    DFLAGS= -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -D_CURSES_LIB=1 -Dexpl=exp -Dlogl=log

Run `make clean` to clean up previous build attempts. 

Then run `make`.

If it works, copy `samtools.exe` and misc folder to the system path. Or for samtools version 1.0 or later, run `make install`.

If it still does not work, change `-D_CURSES_LIB=1` to `-D_CURSES_LIB=0` in `DFLAGS` line, such as:

    DFLAGS= -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -D_CURSES_LIB=1 -Dexpl=exp -Dlogl=log

and comment out the line starting with `LIBCURSES =`. Then run `make`. This will compile samtools without the text-based viewer (tview).


 

