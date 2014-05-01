---
layout: post
title: Cannot find python intepreter
tags:
- programming
- python
- special character
language: en
---
##Problem:

I wrote a python script and ran it like this:

    $ python myscript

Worked perfectly.

Then I wanted to execute the script without explicitly calling python, so following [this link](http://effbot.org/pyfaq/how-do-i-make-a-python-script-executable-on-unix.htm):


    $ chmod +x myscript.py
    $ which python
    /usr/bin/python

Add the following line to myscript:

    #!/usr/bin/python

However, when I do:

    $ ./myscript
    bash: ./myscript: /usr/bin/python^M: bad interpreter: No such file or directory

##Solution:

In [this post](http://forums.devshed.com/python-programming-11/bad-interpreter-no-such-file-or-directory-379366.html):

> That ^M would do the job of screwing things up. Windows uses a CRLF line ending scheme, so that ^M represents the CR from a windows newline format. Except, on Linux and *NIX systems, it's just LF. So that CR does not get translated as a newline, and instead as yet another character.

Following [this link](http://vim.wikia.com/wiki/File_format), I converted myscript from dos/unix to unix in Vim:

    :update              Save any changes.
    :e ++ff=dos          Edit file again, using dos file format ('fileformats' is ignored).
    :setlocal ff=unix    This buffer will use LF-only line endings when written.
    :w                   Write buffer using unix (LF-only) line endings.

Problem solved!
