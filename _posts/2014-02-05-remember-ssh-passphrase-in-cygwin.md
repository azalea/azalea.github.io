---
layout: post
title: Remember SSH passphrase in Cygwin
categories: 
tags:
  - Cygwin
  - ssh
  
---
Linux will remember your passphrase after you have entered it once. Unfortunately, this is not the case in Cygwin. Thanks to [this post](http://codeshavings.blogspot.com/2013/01/remember-ssh-passphrase-in-cygwin.html) and [this post](http://www.edwardawebb.com/web-development/keys-putty-cygwin-passwordless-login-ssh-scp#repetitiveentryavoidanceakaenterthepassphraseonceandonlyonce), I found the following workaround which lets Cygwin asks for the passphrase only once at login. This is not exactly the same behavior as in Linux, when the passphrase is asked for when needed (not at every login), but it is close. 

Just add the following script to your .bash_profile:
 
<script src="https://gist.github.com/azalea/8828636.js"></script>