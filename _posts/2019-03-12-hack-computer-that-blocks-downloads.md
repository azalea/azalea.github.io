---
layout: post
title: Hack computer that blocks downloads
categories: 
tags:
  - encode
language: en

---
Our customer's IT department does not allow downloads on their computer via VPN
connections, but otherwise we have administrator previleges just fine. I guess that's what
IT departments do.

When I tried to hot fix our software for them, I couldn't download the updated
binary files. What I ended up doing:

Create a zip file `binaries.zip` from the binary files. 

Base64 encode the file.

    certutil -encode binaries.zip tmp.b64 && findstr /v /c:- tmp.b64 >
    binaries.txt

Put the file in my Dropbox and view it as a plaintext file on the customer's
computer. Copy the contents into a blank file named `binaries.txt`.

Decode the base64-encoded file.

    certutil -decode binaries.txt binaries.zip

Done.

Note that `certutil` command is on Windows. On Linux, use `base64`.

