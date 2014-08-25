---
layout: post
title: Django permission_required returns 403
categories: 
tags:
- django
language: en

---

Django's [permission_required decorator](https://docs.djangoproject.com/en/1.5/topics/auth/default/#the-permission-required-decorator) will redirect user to `login_url` by default. Since Django 1.4, you can set the optional parameter `raise_exception=True` to raise [PermissionDenied](https://docs.djangoproject.com/en/1.5/ref/exceptions/#django.core.exceptions.PermissionDenied), i.e. return an HTTP 403 code.

Use it like this:

```python
from django.contrib.auth.decorators import permission_required
@permission_required('add_user', raise_exception=True)
def my_add_user_view_function(request):
    ...

@permission_required('delete_user', raise_exception=True)
def my_delete_user_view_function(request):
        ...
```
          
But how can you avoid typing `raise_exception=True` for every view function? Use [functools.partial](https://docs.python.org/2/library/functools.html#functools.partial):


```python
from django.contrib.auth.decorators import permission_required
from functools import partial
permission_required = partial(permission_required, raise_exception=True)
# Then just use:
@permission_required('add_user')
def my_add_user_view_function(request):
    ...

@permission_required('delete_user')
def my_add_user_view_function(request):
    ...
```
        
This seems trivial, but it saved me from typing (or pasting) `raise_exception=True` for ~100 times. Don't ask me why I have so many view functions. That's the story of another day ;)