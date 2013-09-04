---
layout: post
title: 'R document: Student’s t-Test'
tags:
- programming
- R
status: publish
type: post
published: true
meta:
  views: '933'
---
<h2>Student's t-Test</h2>
<pre>zz from: <a href="http://sekhon.berkeley.edu/stats/html/t.test.html" target="_blank">http://sekhon.berkeley.edu/stats/html/t.test.html</a></pre>
<h3>Description</h3>
Performs one and two sample t-tests on vectors of data.
<h3>Usage</h3>
<pre>t.test(x, ...)## Default S3 method:<font color="#3366ff">t.test(x, y = NULL,</font>

<font color="#3366ff">       alternative = c("two.sided", "less", "greater"),</font>
<font color="#3366ff">
</font><font color="#3366ff">       mu = 0, paired = FALSE, var.equal = FALSE,</font>
<font color="#3366ff">
</font><font color="#3366ff">       conf.level = 0.95, ...)</font>

## S3 method for class 'formula':

t.test(formula, data, subset, na.action, ...)</pre>
<pre><!--more--></pre>
<h3>Arguments</h3>
<font color="#3366ff">x</font> 	a numeric vector of data values.

<font color="#3366ff">y</font> 	an optional numeric vector data values.

<font color="#3366ff">alternative</font> 	a character string specifying the alternative hypothesis, must be one of "two.sided" (default), "greater" or "less". You can specify just the initial letter.

<font color="#3366ff">mu </font>	a number indicating the true value of the mean (or difference in means if you are performing a two sample test).

<font color="#3366ff">paired</font> 	a logical indicating whether you want a paired t-test.

<font color="#3366ff">var.equal</font> 	a logical variable indicating whether to treat the two variances as being equal. If TRUE then the pooled variance is used to estimate the variance otherwise the Welch (or Satterthwaite) approximation to the degrees of freedom is used.

<font color="#3366ff">conf.level</font> 	confidence level of the interval.

<font color="#3366ff">formula </font>	a formula of the form lhs ~ rhs where lhs is a numeric variable giving the data values and rhs a factor with two levels giving the corresponding groups.

<font color="#3366ff">data </font>	an optional data frame containing the variables in the model formula.

<font color="#3366ff">subset</font> 	an optional vector specifying a subset of observations to be used.

<font color="#3366ff">na.action</font> 	a function which indicates what should happen when the data contain NAs. Defaults to getOption("na.action").

<font color="#3366ff">... </font>	further arguments to be passed to or from methods.
<h3>Details</h3>
The formula interface is only applicable for the 2-sample tests.

If <code>paired</code> is <code>TRUE</code> then both <code>x</code> and <code>y</code> must be specified and they must be the same length.  Missing values are removed (in pairs if <code>paired</code> is <code>TRUE</code>).  If <code>var.equal</code> is <code>TRUE</code> then the pooled estimate of the variance is used.  By default, if <code>var.equal</code> is <code>FALSE</code> then the variance is estimated separately for both groups and the Welch modification to the degrees of freedom is used.

If the input data are effectively constant (compared to the larger of the two means) an error is generated.
<h3>Value</h3>
A list with class <code>"htest"</code> containing the following components:

<font color="#3366ff">tatistic</font> 	the value of the t-statistic.
<font color="#3366ff"> </font>

<font color="#3366ff">parameter</font> 	the degrees of freedom for the t-statistic.

<font color="#3366ff">p.value</font> 	the p-value for the test.

<font color="#3366ff">conf.int</font> 	a confidence interval for the mean appropriate to the specified alternative hypothesis.

<font color="#3366ff">estimate</font> 	the estimated mean or difference in means depending on whether it was a one-sample test or a two-sample test.

<font color="#3366ff">null.value</font> 	the specified hypothesized value of the mean or mean difference depending on whether it was a one-sample test or a two-sample test.

<font color="#3366ff">alternative</font> 	a character string describing the alternative hypothesis.

<font color="#3366ff">method </font>	a character string indicating what type of t-test was performed.

<font color="#3366ff">data.name</font> 	a character string giving the name(s) of the data.
<h3>See Also</h3>
<code><a href="http://sekhon.berkeley.edu/stats/html/prop.test.html">prop.test</a></code>
<h3>Examples</h3>
<pre><font color="#3366ff">t.test(1:10,y=c(7:20))</font>      # P = .00001855<font color="#3366ff">t.test(1:10,y=c(7:20, 200))</font></pre>
<pre># P = .1245    -- NOT significant anymore</pre>
<pre>## Classical example: Student's sleep data

<font color="#3366ff">plot(extra ~ group, data = sleep)</font></pre>
<pre>## Traditional interface

<font color="#3366ff">with(sleep, t.test(extra[group == 1], extra[group == 2]))</font></pre>
<pre>## Formula interface

<font color="#3366ff">t.test(extra ~ group, data = sleep)</font></pre>