---
layout: post
title: Python菊花文转换器
tags:
- programming
- python
status: publish
type: post
published: true
meta:
  _searchme: '1'
  _edit_last: '1'
  _relation_threshold: '1'
  original_post_id: '1715'
  _wp_old_slug: '1715'
---
感谢<a href="http://www.google.com/buzz/111023315324180581642/KeFJ984czcE/azaleasays-%E8%80%81%E5%AD%90%E5%9C%A8%E6%96%B0%E6%B5%AA%E5%8F%91%E4%B8%80%E6%9D%A1%E5%BE%AE%E5%8D%9A" target="_blank">Meng Li</a>同学莅临指导，我发现世界上除了火星文，还有菊花文（又名金星文，大概是看得眼冒金星的意思）

据说谷歌输入法可以输入，但是作为Linux党只好自己动手：

```python
import sys

inputstr = sys.argv[1]
inputlist = list(inputstr.decode('utf-8'))

# print repr('҉'.decode('ascii', 'xmlcharrefreplace'))
# Find the unicode for html character entity ҉
# It turns out to be u'҉'

decoration = u'҉'
encodedString = decoration + decoration.join(inputlist) + decoration

from BeautifulSoup import BeautifulStoneSoup
decodedString=unicode(BeautifulStoneSoup(encodedString,
    convertEntities=BeautifulStoneSoup.HTML_ENTITIES ))

print decodedString
```

用法：

```bash
python test.py 菊花文是个好东东
```

```
菊҉花҉文҉是҉个҉好҉东҉东҉<
```

原理：

菊花文其实就是在字符中间加入一个<a href="http://www.w3schools.com/html/html_entities.asp">html character entity</a> 即 <a href="http://www.whatsmyip.org/htmlcharacters/?full=yes" target="_blank">҉ </a>

Python做的就是读入正常的中文，每个字符之间插入这个符号，然后<a href="http://channel3b.wordpress.com/2007/07/04/how-to-convert-html-entities-to-real-unicode-in-python/" target="_blank">转换成 "real" unicode</a>输出。最后的转换需要第三方包 <a href="http://www.crummy.com/software/BeautifulSoup/" target="_blank">BeautifulSoup</a>

或者可以参考<a href="http://effbot.org/zone/re-sub.htm#unescape-html" target="_blank">这里</a>，自己写个函数

p.s. 偶觉得这个依然还是很容易被机器过滤的，还是火星文靠谱啊
