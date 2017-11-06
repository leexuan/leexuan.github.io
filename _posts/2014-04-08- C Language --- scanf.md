---
layout: post
title: C 语言之 scanf 个人解析
date: 2014-04-08 
tag: 基础知识
---

一直以来，对 C 语言中格式化输入函数 scanf 的机理都很模糊。下面就个人对 scanf 的原理进行小结。

### scanf 函数介绍
&emsp;&emsp;如同 printf 函数用于格式化显示输出一样，scanf 用于根据特定格式读取输入。scanf 函数的格式串包括普通字符和转换说明（以%开头的部分，用来表示打印过程中填充了值的占位符，如 %d）两部分。


### scanf 函数工作方法
&emsp;&emsp;scanf 函数本质上是一种“模式匹配”函数，也就是说试图把`输入的字符组`与`转换说明`匹配成组。

&emsp;&emsp;具体而言，scanf 会把用户的输入看成一条连续的字符流。在调用 scanf 函数时从左边还是处理字符流中的信息。对于 scanf 中格式串中的每一个转换说明，函数努力`从输入的数据中定位适当类型的项，并且跳过必要的空白`。然后，scanf 函数读入数据项，并且在遇到不可能属于此项的字符时停止。如果读入数据成功，那么 scanf 函数会继续处理格式串的剩余部分。如果任何项都不能成功的读入，那么 scanf 函数将不再查看格式串的剩余部分而是立即返回。在寻找数的起始位置时，scanf 函数会自动忽略空白字符，如空格符、制表符、换行符等。如下例：
```
//调用下面 scanf 函数
scanf("%d%d%f%f", &i, &j, &x, &y);
//用户输入：
  1
-20   .3
   -4.0e3
```
&emsp;&emsp;scanf 函数会把他们看做一条连续的字符流：&spades;&spades;1&hearts;-20&spades;&spades;&spades;.3&hearts;&spades;&spades;&spades;-4.0e3&hearts;，其中 &spades; 表示空格，&hearts; 表示换行符。scanf 处理如下：
* 转换说明 %d : 首先跳过前两个 &spades;，处理第一个非空输入字符 1；因为整数可以从1开始，故 scanf 读取下一个字符，即 &hearts;。scanf 函数识别字符 &hearts; 不能出现在整数内，所以把 1 存入变量 i 中,而把 &hearts; 放回原处。
* 转换说明 %d : 首先跳过 &hearts;，随后 scanf 函数读取 -、2、0，随后读取 &spades;。 因为 %d 整数不能包含 &spades;，所以 scanf 把 -20 存入变量 j 中，而把 &hearts; 放回原处。
* 转换说明 %f : 首先跳过空白字符，读取 .、3 和 &hearts;。因为 &hearts; 不能放入浮点数中，所以 scanf 把 0.3 放入变量 x 中。
* 转换说明 %f : 首先跳过空白字符，读取 -、4、.、0、e、3 和 &hearts;。因为 &hearts; 不能放入浮点数中，所以 scanf 把 -4.0\*10 放入变量 y 中。把 &hearts; 放回原处，等待下一次 scanf 函数调用。

### scanf 函数识别整数或浮点数的原则
* 在要求读入整数时，scanf 函数首先识别一个数字、正号或者负号；然后，继续读取字符直至读取到第一个非数字字符时才停止。
* 在要求读入浮点数时，考虑到用户可能输入普通格式小数也可能采用指数形式输入小数，故 1）scanf 识别一串数字（可能含有小数点）；2） 函数首先寻找一串数字，随后是e或者E，接着是一串数字，再然后直至读取到第一个非数字字符时才停止。

