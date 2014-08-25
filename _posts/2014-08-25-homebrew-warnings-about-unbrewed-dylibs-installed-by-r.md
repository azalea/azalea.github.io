---
layout: post
title: Homebrew warnings about unbrewed dylibs installed by R
categories: 
tags:
- homebrew
- R
language: en

---

If you install R on Mac OS X from [the official binaries](http://cran.r-project.org/bin/macosx/), it will install tcl/tk to /usr/local/lib. The problem is, if you use homebrew to manage other packages, when running `brew doctor`, it complains:

```
Warning: Unbrewed dylibs were found in /usr/local/lib. If you didn't put them there on purpose they could cause problems when building Homebrew formulae, and may need to be deleted.

Unexpected dylibs:
/usr/local/lib/libtcl8.6.dylib
/usr/local/lib/libtk8.6.dylib

Warning: Unbrewed .pc files were found in /usr/local/lib/pkgconfig. If you didn't put them there on purpose they could cause problems when building Homebrew formulae, and may need to be deleted.

Unexpected .pc files:
/usr/local/lib/pkgconfig/tcl.pc
/usr/local/lib/pkgconfig/tk.pc

Warning: Unbrewed static libraries were found in /usr/local/lib. If you didn't put them there on purpose they could cause problems when building Homebrew formulae, and may need to be deleted.

Unexpected static libraries:
/usr/local/lib/libtclstub8.6.a
/usr/local/lib/libtkstub8.6.a
```

Although it does not break anything for now, it may if other homebrew packages depend on tcl/tk.

Simply deleting these files will cause R to complain:

```
> library("Rcmdr")
Error : .onLoad failed in loadNamespace() for 'tcltk', details:
...
```

So I first backed up these files, and then install tcl/tk with Homebrew:

```
brew tap homebrew/dupes
brew install tcl-tk --with-tk
```

Then link the files, so that R can find the tcl/tk installed by Homebrew:

```
ln -s /usr/local/Cellar/tcl-tk/8.6.1/lib/libtcl8.6.dylib /usr/local/lib/libtcl8.6.dylib
ln -s /usr/local/Cellar/tcl-tk/8.6.1/lib/libtk8.6.dylib /usr/local/lib/libtk8.6.dylib
```

Please double check that the linked location is where tcl-tk is installed.

Now both Homebrew and R are happy.

***

Further note:

The above solution does not completely remove the tcl/tk installed by R, so it may cause complications (please let me know if this is indeed the case). 

R installed through the official binaries can be removed as [is instructed here](http://cran.r-project.org/doc/manuals/r-release/R-admin.html#Uninstalling-under-OS-X). However, the tcl/tk files are not removed.

Running `pkgutil --files org.r-project.x86_64.tcltk.x11` will list all files installed by the specified package. Run `man pkgutil` for details. 

These files can be manually removed, but it is [advised against doing so](https://wincent.com/wiki/Uninstalling_packages_(.pkg_files)_on_Mac_OS_X).

***

Lesson learned:

Do not install things from .pkg files if possible. Use homebrew. 

To install R with Homebrew:

```
brew tap homebrew/science
brew install r
```


