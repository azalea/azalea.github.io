---
layout: post
title: Adventures of a space in path
categories: 
tags:
  - ubuntu
  - virtualenv
  - celery
language: en
---

    Two names were proposed for a path, and I—
    I chose the one with a space,
    And that has made all the difference.
            -- in tribute to Robert Frost

On Ubuntu, I put my django + celery + virtualenv project in a path with a space, just being consistent with the Windows counterpart. It tured out to be a total adventure for me.

First, all the scripts in the virtual environment cannot be run.

Shell complains:

    zsh: ./pip: bad interpreter: "/opt/broken_path_preceding_a_space: no such file or directory"

This is [a known issue of virtualenv][https://github.com/pypa/virtualenv/issues/53], because space in shebang line of *nix system is [interpreted as separate arguments](https://github.com/pypa/virtualenv/issues/53#issuecomment-34074888).

So I fixed shebang line by:

    sudo sed -i '1 s|^.*$|#!/usr/bin/env python|' "$INSTDIR/venv/bin/celery"

where `$INSTDIR` is the path with space where virtual environment `venv` is installed, and the `sed` command just replaces the first line with `#!/usr/bin/env python`. This works because `activate` script prepends `$VIRTUAL_ENV` to `$PATH`. 

However, it does not work if running the scripts with sudo:

    > $INSTDIR/venv/bin/activate
    (venv)
    > which python
    > $INSTDIR/venv/bin/python
    > sudo which python
    > /usr/bin/python

Because activating `venv` only modifies the current user's `$PATH`. i.e.:

    > env | grep ^PATH
    PATH=$INSTDIR/venv/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/sbin:/bin
    > sudo env | grep ^PATH
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/sbin:/bin
    
See also [this](http://stackoverflow.com/questions/12996397/command-not-found-when-using-sudo).

Although it is fine to call the script with `$INSTDIR/venv/bin/python -m pip`, running celeryd requires sudo:

    sudo /etc/init.d/celeryd 

which cannot find python packages installed in the virtual environment.

Solution:

    sudo env "PATH=$PATH" /etc/init.d/celeryd

Possible alternative:

Use [supervisor](http://supervisord.org/).

Or keep calm and remove the space...

