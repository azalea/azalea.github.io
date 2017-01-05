---
layout: post
title: 简单粗暴改写 git commit 作者信息
categories: 
tags:
  - git
  
---
昨天我才后知后觉的发现，我在 GitHub 上的屈指可数的贡献值

![](/images/2014/03/git_contributions_before.png)

原来是因为我在本地没有[关联邮箱到 GitHub](https://help.github.com/articles/why-are-my-contributions-not-showing-up-on-my-profile#have-you-linked-your-git-email-to-your-github-account)，而不是[@ztpala](https://twitter.com/ztpala)说的有延迟，都延迟了好几个月了好么！

那么显示出来的贡献是怎么回事？有以下3个可能：

- 在其他电脑上（我竟然在其他电脑上正确关联了邮箱，- -b）
- 用的 [GitHub for Mac](http://mac.github.com/)：记得第一次登录是必须要设置名字和邮箱的。
- 或是直接在 GitHub 网站上改的。

于是我立刻在终端[设置好了名字和邮箱](http://git-scm.com/book/en/Getting-Started-First-Time-Git-Setup#Your-Identity)，可是我以前的贡献值，怎么找回来？在 [contacted a human](https://github.com/contact) 以及阅读[各种攻略](http://stackoverflow.com/questions/750172/how-do-i-change-the-author-of-a-commit-in-git)之后，我终于研究出了简单粗暴找回贡献值的方法，那就是[篡改历史](http://git-scm.com/book/ch6-4.html)！

以上废话。

***

git 已经为我们准备好了篡改工具，[git filter-branch](http://git-scm.com/book/ch6-4.html#The-Nuclear-Option:-filter-branch)。动手吧，记得先备份哦！

先到 project 的文件夹，`git log`，就可以看到之前 commits 用的错误邮箱。然后运行下面的代码，查找错误的邮箱，改成正确的即可。

    git filter-branch --env-filter '
    if test "$GIT_AUTHOR_EMAIL" = "wrong@email"
    then
        GIT_AUTHOR_NAME="Correct Name"
        GIT_AUTHOR_EMAIL="correct@gmail.com"
    fi
    export GIT_AUTHOR_NAME
    export GIT_AUTHOR_EMAIL
    '

注：也可以用 `git filter-branch --commit-filter`，详见上面的各种链接。

如果 git 抱怨 “Cannot rewrite branches: You have unstaged changes.” 只需要 `git stash`再运行上面代码。

此时查看 `git log`，确认名字和邮箱改好以后，`git push origin master --force`，大功告成！

![](/images/2014/03/git_contributions.png)






