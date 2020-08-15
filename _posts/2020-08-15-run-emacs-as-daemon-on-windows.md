---
layout: post
title: Run emacs as daemon on Windows
categories: 
tags:
- emacs
language: en
---

I use emacs as the git editor. When editing rebasing or merging messages, it takes a while to start emacs. Therefore I looked into running emacs as daemon on Windows. Though I haven't found a perfect solution, the following works for me.

Win + R to open `Run`, type `shell:startup`, `right-click -> New -> Shortcut`, type `emacs --daemon` (assuming emacs is on `PATH` or select the path). Then `right-click -> Properties`.

![](/images/2020/08/emacs_shortcut.png)

Change Run to `Minimized`.

Then set git editor to `emacsclient`.

```
git config --global core.editor emacsclient
```
------

Alternative approach tried but failed: set git editor as emacsclient with alternate editor `runemacs`, as suggested on [EmacsWiki](https://www.emacswiki.org/emacs/EmacsMsWindowsIntegration#toc5). I had the issue of either not passing COMMIT_EDITMSG argument to `runemacs`, or passing `#*` as a buffer (which needs to be closed). i.e. not sure how to correctly pass argument such as COMMIT_EDITMSG to the alternate editor.

