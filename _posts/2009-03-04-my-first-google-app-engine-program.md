---
layout: post
title: 我的第一个Google App Engine程序
tags:
- GAE
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  ratings_users: '1'
  ratings_score: '1'
  ratings_average: '1'
  views: '524'
---
<a href="http://mooo.appspot.com/" target="_blank">http://mooo.appspot.com/</a>

自娱自乐，完全没用。其实是<a href="http://www.kangye.org/gae-hello-world-3/#comment-12472" target="_blank">康爷出的练习题</a>的解答。顺便推荐下<a href="http://www.kangye.org/" target="_blank">康爷的博客</a>，有很多关于Google App Engine的东东。

以下是源代码：

```python
from google.appengine.ext import webapp
from google.appengine.ext.webapp.util import run_wsgi_app

def fibonacci(n):
    if n==0:
        return [0]
    fibls=[0]*(n+1)
    fibls[0]=0
    fibls[1]=1
    for i in range(2,n+1):
        fibls[i]=fibls[i-1]+fibls[i-2]
    return fibls

fibsrc = '''
def fibonacci(n):
    if n==0:
        return [0]
    fibls=[0]*(n+1)
    fibls[0]=0
    fibls[1]=1
    for i in range(2,n+1):
        fibls[i]=fibls[i-1]+fibls[i-2]
    return fibls
'''

class MainPage(webapp.RequestHandler):
    def get(self):
        self.response.headers['Content-Type'] = 'text/html'
        self.response.out.write(
        r'&lt;a href = "fibonacci"&gt;Fib&lt;/a&gt;&lt;br&gt;&lt;a href = "source"&gt;Src&lt;/a&gt;')

class Fib(webapp.RequestHandler):
    def get(self):
        self.response.headers['Content-Type'] = 'text/plain'
        self.response.out.write('n'.join(map(str,fibonacci(100))))

class Src(webapp.RequestHandler):
    def get(self):
        self.response.headers['Content-Type'] = 'text/plain'
        self.response.out.write(fibsrc)

ROUTE = [('/', MainPage),
         ('/fibonacci', Fib),
         ('/source', Src)]

application = webapp.WSGIApplication(ROUTE,debug=True)

def main():
    run_wsgi_app(application)

if __name__ == "__main__":
    main()
```
