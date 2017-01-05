---
layout: post
title: jekyll tips
categories: 
tags:
  - jekyll
language: en
---

## Rename tags

    gsed -i 's/- old_tag/- new_tag/g' *.md

## Replace image links from Dropbox with local files

    gsed -i 's@https://dl.dropboxusercontent.com/u/308058/blogimages@/images@g' *.md

To be continued.
