---
layout: post
title: Add Table of Contents to Markdown-converted html with Python-Markdown
categories: 
tags:
 - python
 - markdown
language: en 
---
So you finished writing a long article with Markdown and want a table of contents? Use [Python-Markdown](https://pythonhosted.org/Markdown/index.html)!

Just install it by:

    pip install markdown 

And add `[TOC]` to your markdown file, like this:

    # I like Python-Markdown
	[TOC]
	## What is Python-Markdown?
	## Why do I like it?
    ### I just like it.
    ### Try it and you'll like it too.
    
Now run the following command:

    python -m markdown -x toc input.md > output.html    
    
You can see for yourself the result in output.html

