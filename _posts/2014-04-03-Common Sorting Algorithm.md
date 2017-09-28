---
layout: post
title: 常见排序算法
date: 2014-05-03 
tag: 数据结构及算法
---

在日常编程或者求职面试中，排序算法都是及其常见的。下文就常见排序算法【C语言版】进行总结，并比较。


### 冒泡排序
```
// a[]: 待排序的数组
// len: 待排序元素个数
// order: 1-升序排列；0-降序排列；
void BubbleSort(int a[], int len, bool order)
{
	unsigned int i, j;
	int temp;
	if(order)
	{
		for(i=0; i<len; i++)
			for(j=0; j<len-i-1; j++)
			{
				if(a[j] > a[j+1])
				{
					temp = a[j+1]; a[j+1] = a[j]; a[j] = temp;
				}
			}
	}
	else
	{
		for(i=0; i<len; i++)
			for(j=0; j<len-i-1; j++)
			{
				if(a[j] < a[j+1])
				{
					temp = a[j+1]; a[j+1] = a[j]; a[j] = temp;
				}
			}
	}
}
```

### 选择排序
```
// a[]: 待排序的数组
// len: 待排序元素个数
// order: 1-升序排列；0-降序排列；
void SelectionSort(int a[], int len, bool order)
{
	unsigned int i, j;
	int temp, index;
	if(order)
	{
		for(i=0; i<len; i++)
		{
			index = i;
			for(j=i+1; j<len; j++)
			{
				if(a[index] > a[j])
				{
					index = j;
				}
			}
			if(index != i)
			{
				temp = a[i]; a[i] = a[index]; a[index] = temp;
			}
		}	
	}
	else
	{
		for(i=0; i<len; i++)
		{
			index = i;
			for(j=i+1; j<len; j++)
			{
				if(a[index] < a[j])
				{
					index = j;
				}
			}
			if(index != i)
			{
				temp = a[i]; a[i] = a[index]; a[index] = temp;
			}
		}
	}
}
```

**有待补充**


