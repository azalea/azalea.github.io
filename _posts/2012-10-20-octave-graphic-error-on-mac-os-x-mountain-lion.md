---
layout: post
title: Octave graphic error on Mac OS X Mountain Lion
tags:
- octave
- programming
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  _oembed_87e2ca3e9304dcae1c3aa020dc80498a: '{{unknown}}'
  _oembed_e3bf0f2c77f236d41940ba844f6f40b0: '{{unknown}}'
---
Run hist() command in Octave, the error message says:

Reason: Incompatible library version: libfontconfig.1.dylib requires version 15.0.0 or later, but libfreetype.6.dylib provides version 13.0.0

Solution:
<pre>cd /Applications/Gnuplot.app/Contents/Resources/lib 
mv libfreetype.6.dylib libfreetype.6.dylib.bak 
ln -s /usr/X11/lib/libfreetype.6.dylib .</pre>
Reference:
http://octave.1599824.n4.nabble.com/Mac-OS-X-Mountain-Lion-Octave-can-not-execute-sombrero-td4643502.html

===========================================

Error:
gnuplot&gt; set terminal aqua enhanced title "Figure 1" size 560 420 font "*,6"
^
line 0: unknown or ambiguous terminal type; type just 'set terminal' for a list

Solution:
Create .octaverc file in your home directory, and add the following:

<pre>setenv GNUTERM x11</pre>

Reference:

http://bits.lot42.com/2013/01/plotting-problems-in-octave-on-mac-os-x
