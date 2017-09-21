---
layout: post
title: Mac OS X - open iTerm here
categories: 
tags:
- iTerm
language: en

---
You can drag a folder from Finder onto the iTerm2 icon in the dock to open iTerm2 from the folder location.

How about saving some drag and opening iTerm2 by right click?

Here are the steps to create an `Open iTerm Here` context menu in Finder, like this:

![](/images/2017/09/finder_context_menu.png)

Step 1 
======

Open `Automator`

Step 2
======

`File` - `New` - `Service`

Set the top dropdown boxes to Service receives selected `files or folders` in `Finder.app`

Double click or drag `Run Shell Script` from the left panel, and enter the following:

    if [[ -d $1 ]]; then
        open -a iTerm $1
    elif [[ -f $1 ]]; then
        parentdir="$(dirname "$1")"
        open -a iTerm $parentdir
    fi

Like this:

![](/images/2017/09/automator.png)

Step 3
======

`File` - `Save` - Save service as `Open iTerm Here`

It is stored in `~/Library/Services`, in case it needs to be changed later.

That's it! Now you can see the `Open iTerm Here` context menu option by right click on a file or folder in Finder. Note if it is a folder, the option is under `Services`.

References:

[Create Customize Shortcut in Mac’s Right Click Menu](http://www.hongkiat.com/blog/customize-mac-right-click-menu/)

[Where are Services stored?](https://apple.stackexchange.com/questions/8607/where-are-services-stored)
  

