---
layout: post
title: Setting up Mac OS X and iTerm2 for Emacs
categories: English
tags:
  - emacs
  - mac os x
language: en  
---
I've been taking the [Startup Engineering class on Coursera](https://class.coursera.org/startup-001/class/index), which gives me a reason to give Emacs a second chance. The class covers [setting up Terminal for Emacs in Mac OS X](https://d396qusza40orc.cloudfront.net/startup/lecture_slides%2Flecture4b-developer-environment.pdf). However, I use [iTerm2](http://www.iterm2.com/#/section/home) (a fantastic replacement for Terminal), so I have to do some research myself.

Emacs commands use the `control` key (referred to as `C-`) and the `META` key (referred to as `M-`), but in MAC OS X, by default, they are located far away from the center of the keyboard.

## Our goals are:

- Remap left `option` to `META`
- Switch left `option` and left `command`
- Remap `caps lock` to `control`


## Remap left option to META

Emacs interprets `esc` as `META` (`M-`), but `esc` is so inconveniently located. Thus we remap the left `option` key as `esc`.

iTerm2 -&gt; Preferences -&gt; Profiles

![iTerm2 Preferences Profiles](https://dl.dropboxusercontent.com/u/308058/blogimages/2013/07/iterm2_preferences_profiles.png)


## Switch left option and left command

Optional, but it is more convenient to place `META` right next to the `space bar`.

System Preferences -&gt; Accessibility

![System Preferences Accessibility](https://dl.dropboxusercontent.com/u/308058/blogimages/2013/07/system_preferences_accessibility.png)

iTerm2 -&gt; Preferences -&gt; Keys

![iTerm2 Preferences Keys](https://dl.dropboxusercontent.com/u/308058/blogimages/2013/07/iterm2_preferences_keys.png)


## Remap caps lock to control

`caps lock` is rarely used, so we put it into better use as the `control` key. Unfortunately, iTerm2 does not support remapping the `caps lock` key, [yet](https://groups.google.com/forum/#!topic/iterm2-discuss/GrqN0Hew5gY). So we have to change the mapping globally for the entire OS.

System Preferences -&gt; Keyboard

![System Preferences Keyboard](https://dl.dropboxusercontent.com/u/308058/blogimages/2013/07/system_preferences_keyboard.png)

## Acknowledgments

I am indebted to [this post](http://xor.lonnen.com/2013/01/04/emacs-on-osx.html) for the title, and [this post](http://xenodium.com/blog/?p=858) for the inspiration of using screenshots.
