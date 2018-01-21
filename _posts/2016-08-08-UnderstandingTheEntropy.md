---
layout: post
title: "信息论中“熵”的理解"
date: 2016-08-08 
description: "机器学习入门篇"
tag: 机器学习  

---     

此文主体来自知乎大神的一篇为文章，外加个人的一点内容，在理解“熵”的意义上，个人觉得挺不错，特转载。

### “熵”的介绍

信息熵（Information entropy）是信息论中的概念，由香农（ mathematician Claude Shannon）在其论文“[A Mathematical Theory of Communication](https://dl.acm.org/citation.cfm?id=584093)”提出的。它衡量事件所包含的信息量。一般而言，事件的不确定性或者随机性越大，则它包含的信息越多。

例如，如果一个人被告知他已知道的信息，则他获取的信息是很少的。告知某人已知道的信息，是没有意义的，则说这些信息具有较低的熵；反之，如果一个人被告知他不知道的信息，则他获取的信息是很多的。这些信息对他而言是有价值的，表明这些信息具有加高的熵。

### “熵”的定义
这里讨论离散的情况。对于离散随机变量$X=\{x_1,x_2,\cdots,x_n\}$，其概率分布为$P(X)={p(x_1),p(x_2),\cdots,p(x_n)}$，则该离散随机变量$X$的熵定义为：
\begin{equation}
H(X)=\sum_{i=1}^{n}{p(x_i)\log_{b}{p(x_i)}}
\end{equation}
$H(X)=\sum_{i=1}^{n}{p(x_i)\log_{b}{p(x_i)}}$


<!--
数据学科竞赛：[DataCastle](http://www.pkbigdata.com/)、[天池](https://tianchi.aliyun.com/)。

### 知识交叉

![](/images/posts/2016-07-06-MachineLearning_outline/KnowledgeCross.png){:height="340px" width="360px"}

* Math & Statistics Knowledge: 数学相关知识，如高等数学、矩阵论、数理统计与概率等；
* Hacking Skills: 编程相关的技能；
* Substantive Expertise: 行业领域知识；
-->
