---
layout: post
title: 常见的功能函数总结
date: 2013-03-11 
tag: 基础知识
---

### 目录

* [判断一个数是否为素数](#Check-whether-a-number-is-a-prime-number)


`备注`：以下函数实例中共有宏定义如下：
```
#define TRUE 1
#define FALSE 0
```


### <a name="Check-whether-a-number-is-a-prime-number"></a>判断一个数是否为素数？
&emsp;&emsp;质数（prime number）又称素数，有无限个。质数定义为在大于1的自然数中，除了1和它本身以外不再有其他因数。判断一个数是否为素数，如下所示：
```
bool Is_PrimeNumber(unsigned int n)
{
	int i;
	
	if( n <= 1) return FALSE;
	else
	{
		for(i = 2; i * i <= n; i++)
			if( n % i == 0 ) return FALSE;
		return TRUE;
	}
}
```
