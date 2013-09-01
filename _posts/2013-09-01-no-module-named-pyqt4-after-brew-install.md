---
layout: post
title: No module named PyQt4 after brew install
categories: 
tags:
  - python
  - pyqt
  
---
I used homebrew to intall PyQt on Mac OS X. `brew install pyqt` ran successfully. `brew list` includes pyqt, but in Python, `import PyQt4` gives the error: `
ImportError: No module named PyQt4`

Solution:

Add 

```
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
```

to ~/.bash_profile (if bash)

or ~/.zprofile (if zsh)


References:

[https://github.com/mxcl/homebrew/issues/6176] (https://github.com/mxcl/homebrew/issues/6176)

`brew info pyqt`