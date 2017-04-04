---
layout: post
title: pip download now and install later
categories: 
tags:
  - python
  - pip
language: en
---

Download now, when there is Internet access:

    pip download -r requirements.txt -d src_dir

where `-r requirements.txt` is the requirements file, produced by `pip freeze`,

`-d src_dir` is optional, specifying the output directory for the downloaded files. Without it, output directory is the current directory.

Install later, even without Internet:

    pip install -r requirements.txt --no-index --find-links file://full_path_to_src_dir
    
e.g. 

Windows: `--find-links file://C:\Downloads\src_dir` or `--find-links file://"C:\Program Files\src_dir"` (quote when there is space in path)

*nix: `--find-links file:///home/user/src_dir`
