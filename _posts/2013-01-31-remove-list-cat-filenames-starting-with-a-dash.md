---
layout: post
title: Remove / list / cat filenames starting with a dash
tags:
- linux
language: en
---
Don't ask me how come one names a file with a leading dash!

    rm -- -weirdfilename

-- means the end of parameters, treats what's following as filename
Or:

    rm ./-weirdfilename

Similarly,

  ls -- -*

  cat -- -*
