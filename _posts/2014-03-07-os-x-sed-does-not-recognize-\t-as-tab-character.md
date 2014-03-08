---
layout: post
title: OS X sed does not recognize \t as TAB character
categories: 
tags:
  - sed
  - OS X
  
---
Say you would like to replace multiple spaces with a tab (`\t`) in file with:

    sed -i 's/ \+ /\t/g' file

[ref](http://superuser.com/questions/241018/how-to-replace-multiple-spaces-by-one-tab)

On Linux it works fine. However, on Mac OS X, sed will not give what you want.

The reason is that Mac OS X sed does not understand "\t". You have to literally enter the tab by pressing `Ctrl + v` followed by `Tab`. 

Also you need to explicitly give an empty string as the extension to edit in place. 

Moreover, Mac OS X sed needs `-E` to recognize extended regular expressions. In this case, more than one spaces is the pattern ` + `. Note that you do not have to escape `+`.

With all the above changes, you'll have to write:

    sed -i '' -E 's/ + /     /g' file

[ref](http://stackoverflow.com/questions/5398395/how-can-i-insert-a-tab-character-with-sed-on-os-x)

It is a pain to take care of so many differences between Mac OS X sed and the GNU sed. You can install GNU core utilities and leave all the differences out of your mind:

Install [homebrew](http://brew.sh) if you haven't done so years ago already:

    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    
Then:    

    brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt

This will install GNU find, sed, awk with a g-prefix. So now

    gsed -i 's/ \+ /\t/g' file
    
will do exactly what you want.

If you absolutely need the GNU sed without the g-prefix, you can

    brew install gnu-seq --default-names

[ref](http://apple.stackexchange.com/questions/69223/how-to-replace-mac-os-x-utilities-with-gnu-core-utilities)

***

Bonus:

What if you want to run a script that calls sed on both Linux and OS X? You can do the following:

<script src="https://gist.github.com/azalea/9425036.js"></script>

