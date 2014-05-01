---
layout: post
title: Django logging with RotatingFileHandler error
categories: 
tags:
- django
- logging

language: en

---
When using RotatingFileHandler for django logging, the following error occurs:

    Traceback (most recent call last):
    File "C:\Python27\lib\logging\handlers.py", line 78, in emit
    self.doRollover()
    File "C:\Python27\lib\logging\handlers.py", line 141, in doRollover
    os.rename(self.baseFilename, dfn)
    WindowsError: [Error 32] The process cannot access the file because it is being used by another process

tl; dr

If you use settings.py to specify the logging configuration, and you are running django development server, run it with "--noreload" option may help, i.e.

    python manage.py runserver --noreload
    
The reason is that by default, two processes of Django servers are running. One is the actual server, while the other is to detect changes in the code and reload the server. Therefore, [settings.py is imported twice](http://blog.dscpl.com.au/2010/03/improved-wsgi-script-for-use-with.html), and consequently the two processes are accessing the log file at the same time.

***
Warning: the following is irrelavent.

I found out this simple solution through hours of googling. 

I came across multiple discusssions about this issue ([eg1](http://stackoverflow.com/questions/22852555/rotatingfilehandler-text-file-busy-in-windows), [eg2](http://stackoverflow.com/questions/19903928/unable-to-get-the-backup-log-file-when-using-rotatingfilehandler-from-python), [eg3](http://bugs.python.org/issue4749)), but none gave the solution. Amid continuous frustrations, this amused me:

![](http://imgs.xkcd.com/comics/wisdom_of_the_ancients.png)

At one point, I thought this was because [file handles are inherited by child processes in Python](http://legacy.python.org/dev/peps/pep-0433/), and I even [tried to overwrite the `__builtin__.open()` function](http://www.virtualroadside.com/blog/index.php/2013/02/06/problems-with-file-descriptors-being-inherited-by-default-in-python/comment-page-1/#comment-131039).

I also checked out [ConcurrentLogHandler](https://pypi.python.org/pypi/ConcurrentLogHandler/0.9.1), and thought about writing my own [log handler that uses socket](https://docs.python.org/2.7/howto/logging-cookbook.html#logging-to-a-single-file-from-multiple-processes).

Finally, [this answer](http://stackoverflow.com/a/2961074/1292238) enlightened me. I never knew settings.py was imported twice by Django development server!

Lessons learned:

1. Post the answer to your own question if you find out the solution. Someone may thank you one day, denvercoder9.

2. The most obvious solution is most easily neglected. 
