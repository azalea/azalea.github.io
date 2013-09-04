---
layout: post
title: Save R Objects to a File and Reload Saved Datasets
tags:
- programming
- R
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '604'
---
<strong>save()</strong>函数把R对象（列表、矩阵、数据框等等)保存到指定文件中

<strong>save.image()</strong>函数把R的当前工作空间保存到指定文件，等价于退出R的命令q("yes")

<strong>用法</strong>
save(..., list = character(0),
file = stop("'file' must be specified"),
ascii = FALSE, version = NULL, envir = parent.frame(),
compress = !ascii, eval.promises = TRUE)

save.image(file = ".RData", version = NULL, ascii = FALSE,
compress = !ascii, safe = TRUE)

<strong>举例</strong>
x &lt;- stats::runif(20)
y &lt;- list(a = 1, b = TRUE, c = "oops")
save(x, y, file = "xy.Rdata")
save.image()
unlink("xy.Rdata")
unlink(".RData")

# set save defaults using option:
options(save.defaults=list(ascii=TRUE, safe=FALSE))
save.image()
unlink(".RData")
<a href="http://stat.ethz.ch/R-manual/R-patched/library/base/html/save.html" target="_blank"> 更多...</a>

<strong>load()</strong>函数用来加载保存R对象的文件

<strong>用法:</strong>
load(file, envir = parent.frame())

<strong>举例:</strong>
## save all data
xx &lt;- pi # to ensure there is some data
save(list = ls(all=TRUE), file= "all.Rdata")
rm(xx)

## restore the saved values to the current environment
local({
load("all.Rdata")
ls()
})
## restore the saved values to the user's workspace
load("all.Rdata", .GlobalEnv)
unlink("all.Rdata")
<a href="http://stat.ethz.ch/R-manual/R-patched/library/base/html/load.html" target="_blank"> 更多...</a>