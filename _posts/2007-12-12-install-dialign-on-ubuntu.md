---
layout: post
title: Install Dialign on Ubuntu
tags:
- ubuntu
status: publish
type: post
published: true
meta:
  views: '496'
---
<a href="http://bibiserv.techfak.uni-bielefeld.de/dialign/" target="_blank">DIALIGN</a> is a software program for multiple alignment.

To install it on your Ubuntu,

Step 1: <a href="http://bibiserv.techfak.uni-bielefeld.de/download/tools/DIALIGN_221.html">Download</a>.I used the src file.

Step 2: Extract it.

Step 3: Create an environment variable DIALIGN2_DIR pointing to the directory

your_path/dialign2_dir

This is the most tricky step.

Go to the home folder, open the file named .bashrc

and add the following lines:

export PATH="$PATH:your_path/dialign2_dir"
DIALIGN2_DIR=your_path/dialign2_dir
export DIALIGN2_DIR

Your_path is where the dialign2_dir folder located. In my case, it's /home/azalea/Desktop

Step 4: Restart X (Ctrl+Alt+Backspace)

Step 5: Done!
