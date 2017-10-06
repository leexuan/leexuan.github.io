---
layout: post
title: 常见的位操作总结
date: 2015-04-03 
tag: 嵌入式基础
---

　　无论是嵌入式编程还是应用开发，位操作都是一种常见的操作，其精妙的操作、简洁的风格，增加了程序的可读性。下面就常用的位操作进行总结，如果读者发现有待完善之处，还请告知。

### 乘以 2 的 n 次方

```
#define		MULTWO(m, n)	( n << m )
```

### 除以 2 的 n 次方

```
#define		DIVTWO(m, n)	( m>>n )
```


### 取绝对值运算

```
#define		ABS(n)	(( n^(n>>31) ) - (n>>31))
```

### 变量交换

```
#define SWAP(*m, *n)(*m ^= *n; *n ^= *m; *m ^= *n;)
```

### 变量奇偶判断

```
#define		ISODDNUM(n)	(n & 1 == 1)
```

### 两数比较取大

```
#define		MAX(m, n)	(n & ((m-n) >> 31) | m & (~(m-n) >> 31))
```

### 两数比较取小

```
#define		MIN(m, n)	(m & ((m-n) >> 31) | n & (~(m-n) >> 31))
```

### 判断两数符号是否相同

```
#define ISSAMESIGN(m, n)((m^n) >= 0)
```

### 取 n 的第 m 位

```
#define		GETBIT(n, m)	((n>>(m-1)) & 1)
```

### n 的第 m 位置位和清零

```
#define		SETBIT(n, m)	(n I (1 << (m-1)))
#define		CLRBIT(n, m)	(n & (~(1 << (m-1))))
```

### x 的第 m ~ n 位置位和清零

```
#define		SETBIT_1(x, m, n)		(x | ( ( (1<<n+1)-1) & (~0<<m) ) )
#define		SETBIT_2(x, m, n)		(x | (~(~0<<n+1) & (~0<<m) ) )
#define		CLRBIT_1(x, m, n)		(x & ( ( ~((1<<n+1)-1) | ~(~0<<m) ) ) )
#define		CLRBIT_2(x, m, n)		(x & ( (~0<<n+1) | ( (1<<m)-1) ) )
```


