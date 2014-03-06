---
layout: post
title: Replace file extension in git repository
categories: 
tags:
 - git
 - shell
 
---

The following shell script replaces one file extension with another in a git repository.

For example, you would like to replace all .md with .markdown:

<script src="https://gist.github.com/azalea/9393605.js"></script>

***
Bonuses:

What I learned while creating the above script:

Shell command to get the basename of a path `basename` and the path without basename `dirname`:

    › mypath=$(pwd)
    › echo $mypath
    /Users/azalea/Dropbox/Projects/azalea.github.io

    › basename $mypath
    azalea.github.io

    › dirname $mypath
    /Users/azalea/Dropbox/Projects 
    
And use [Shell parameter expansion](http://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html) to get file extension and file name without extension:

    › name=$(basename $mypath)
    › echo $name
    azalea.github.io
    
    › extension="${name##*.}"
    › echo $extension
    io

    › name_wo_ext="${name%.*}"
    › echo $name_wo_ext
    azalea.github

Explanation of `${name##*.}`:

${parameter##word}: if the beginning of the _parameter_ matches the pattern specified by _word_, the longest matching pattern is deleted from _parameter_. So in `${name##*.}`, when name="azalea.github.io", the longest matching pattern of "*." from the beginning of $name is "azalea.gitgub.", which is deleted, leaving "io".

Explanation of `${name%.*}`:

${parameter%word}: if the end of the _parameter_ matches the pattern specified by _word_, the shortest matching pattern is deleted from _parameter_. So in `${name%.*}`, when name="azalea.github.io", the shortest matching pattern of ".*" from the end of $name is ".io", which is deleted, leaving "azalea.github".

***
Quizzes

Q: How to get "azalea" out of "azalea.github.io". 

A:

    › echo ${name%%.*}
    azalea

Q: Use parameter expansion to achieve the function of basename:

A:

    › echo ${mypath##*/}
    azalea.github.io