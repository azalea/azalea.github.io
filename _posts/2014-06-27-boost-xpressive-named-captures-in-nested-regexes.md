---
layout: post
title: boost xpressive: named captures in nested regexes
categories: 
tags:
- C++
- regular expression
language: en

---

I need to port a lot of regular expressions from Python to C++. [boost xpressive](http://www.boost.org/doc/libs/1_55_0/doc/html/xpressive/user_s_guide.html) supports named captures, so I decided to give it a try.

boost xpressive has [static regexes](http://www.boost.org/doc/libs/1_55_0/doc/html/xpressive/user_s_guide.html#boost_xpressive.user_s_guide.creating_a_regex_object.static_regexes), which looks like the following:


```cpp

#include <iostream>
#include <boost/xpressive/xpressive.hpp>
using namespace boost::xpressive;

int main()
{
    std::string str = "Hello123";
    smatch what;

    mark_tag word(1), number(2);
    sregex ex = (word=+alpha) >> (number=+_d);

    if(regex_search(str, what, ex))
    {
        std::cout << what[0] << std::endl;
        std::cout << what.size() << std::endl;
        std::cout << what[word] << std::endl;
        std::cout << what[number] << std::endl;

    }
    return 0;
}

```

The program outputs:

```
Hello123
3
Hello
123
```

[static named captures](http://www.boost.org/doc/libs/1_55_0/doc/html/xpressive/user_s_guide.html#boost_xpressive.user_s_guide.named_captures.static_named_captures) is created with `mark_tag word(1)`, and accessed by `what[word]` where `what` is a [match_results<>](http://www.boost.org/doc/libs/1_55_0/doc/html/boost/xpressive/match_results.html) iterator.

The above code works perfectly. However, when I try to use [nested regex](http://www.boost.org/doc/libs/1_55_0/doc/html/xpressive/user_s_guide.html#boost_xpressive.user_s_guide.grammars_and_nested_matches.embedding_a_regex_by_value):


```cpp

#include <iostream>
#include <boost/xpressive/xpressive.hpp>
using namespace boost::xpressive;

int main()
{
    std::string str = "Hello123";
    smatch what;

    mark_tag word(1), number(2);
    sregex WORD = (word=+alpha);
    sregex NUMBER = (number=+_d);
    
    sregex ex = WORD >> NUMBER;

    if(regex_search(str, what, ex))
    {
        std::cout << what[0] << std::endl;
        std::cout << what.size() << std::endl;
        std::cout << what[word] << std::endl;
        std::cout << what[number] << std::endl;
    }

    return 0;
}


The program now outputs:

```
Hello123
1


```

Note that named captures in the nested regex cannot be accessed by `what[word]` any more.

The reason is that "each invocation of a nested regex gets its own scope" ([quote](http://boost-sandbox.sourceforge.net/libs/xpressive/doc/html/boost_xpressive/user_s_guide/grammars_and_nested_matches.html#boost_xpressive.user_s_guide.grammars_and_nested_matches.nested_regexes_and_sub_match_scoping)).

So far, I have not figured out a way to access the named captures in nested regexes. Any suggestions?

[This discussion](http://lists.boost.org/boost-users/2014/01/81101.php) seems relavant, but I don't understand the solution.



 