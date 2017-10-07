---
layout: post
title: 常见排序算法
date: 2014-05-03 
tag: 数据结构及算法
---

在日常编程或者求职面试中，排序算法都是极其常见的。下文就常见排序算法【C语言版】进行总结，并比较。


### 目录

* [冒泡排序](#BubbleSort)
* [选择排序](#SelectionSort)
* [快速排序](#QuickSort)
* [插入排序](#InsertSort)

### <a name="BubbleSort"></a>冒泡排序
&emsp;&emsp;冒泡排序是一种简单、入门级的排序算法。其核心思想是：比较相邻的两个元素，如果与期望的排序顺序（升序/降序）不一致，则交换这两个元素；从左到右，遍历某一序列时，则最小或最大的元素经过交换则慢慢`浮`到序列的尾部。因此，这种排序方法叫做冒泡排序。
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

### <a name="SelectionSort"></a>选择排序
&emsp;&emsp;选择排序是一种简答直观的排序算法。其原理如下：1）查找序列中最小（大）的一个元素，存放在序列的起始位置；2）再从剩余的序列中继续查找最小（大）的元素，然后放到剩余序列的起始位置。以此类推，直到所有元素均排列完毕。
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

### <a name="QuickSort"></a>快速排序
&emsp;&emsp;快速排序简介：快速排序是采用`分治递归`的思想，对整体数据集进行分区和递归处理。

&emsp;&emsp;具体而言，分区处理要点：取某一个值作为基准值，与区域内所有数据进行比较，将比基准值大的数据置于一侧，比基准值小的数据置于另一侧，基准值则位于中央。然后，采用递归的思想，对这两个分区进行类似的处理，直至排序结束。

&emsp;&emsp;举例说明：对于待排序序列：5 6 1 4 8 2 9 10 3。取基准值为第一个元素，即 key = 5，升序排列。则

>* **第零次排序结果：<font color="red">5</font> 6 1 4 8 2 9 10 <font color="blue">3</font>**
>* 从右往左搜索，直至找到比 key 值小的元素为 **<font color="blue">3</font>**，然后将 **<font color="blue">3</font>** 置于 **<font color="red">5</font>** 的位置，则\\
**第一次排序结果：3 <font color="blue">6</font> 1 4 8 2 9 10 <font color="red">3</font>**
>* 从左往右搜索，直至找到比 key 值大的元素为 **<font color="blue">6</font>**，然后将 **<font color="blue">6</font>** 置于 **<font color="red">3</font>** 的位置，则\\
**第二次排序结果：3 <font color="red">6</font> 1 4 8 <font color="blue">2</font> 9 10 6**
>* `接着前面，继续`从右往左搜索，直至找到比 key 值小的元素为 **<font color="blue">2</font>**，然后将 **<font color="blue">2</font> 置于 <font color="red">6</font>** 的位置，则\\
**第三次排序结果：3 2 1 4 <font color="blue">8</font> <font color="red">2</font> 9 10 6**
>* `接着前面，继续`从左往右搜索，直至找到比 key 值大的元素为 **<font color="blue">8</font>**，然后将 **<font color="blue">8</font> 置于 <font color="red">2</font>** 的位置，则\\
**第四次排序结果：3 2 1 4 <font color="red">8</font> 8 9 10 6**
>* 然后，将 key 值置于 **<font color="red">8</font>** 的位置，如此完成第一轮的排序，其结果为：**3 2 1 4 5 8 9 10 6**。
>* 接着，针对序列：**3 2 1 4** 和 **8 9 10 6** 进行同样的处理，按如此方式进行递归，直至排序完毕，即可完成最终的排序。


快速排序对应 C 语言函数代码如下：
```
// Array[]: 待排序的数组首地址
// low/high：对数组Array[low]~Array[high]这一段连续的元素进行快速排序
// order: 1-升序排列；0-降序排列；
void QuickSort(int Array[], int low, int high, bool order)
{
	int key;
	int index_low = low, index_high = high;
	if(index_low < index_high)
	{
		key = Array[index_low];
		if(order)
		{
			while(index_low < index_high)
			{
				while(index_low < index_high && Array[index_high] >= key)index_high--;
				Array[index_low] = Array[index_high];

				while(index_low < index_high && Array[index_low] <= key)index_low++;
				Array[index_high] = Array[index_low];
			}
		}
		else
		{
			while(index_low < index_high)
			{
				while(index_low < index_high && Array[index_high] <= key)index_high--;
				Array[index_low] = Array[index_high];

				while(index_low < index_high && Array[index_low] >= key)index_low++;
				Array[index_high] = Array[index_low];
			}
		}
		Array[index_low] = key;
	}

	if(low < index_low - 1)
	{
		QuickSort(Array, low, index_low-1, order);
	}
	if(index_low + 1 < high)
	{
		QuickSort(Array, index_low+1, high, order);
	}
}
```

### <a name="InsertSort"></a>插入排序
&emsp;&emsp;插入排序是将一个元素插入到一个已排序好的有序序列中，从而得到一个新的序列，并且序列的长度增加 1 。其具体原理：对于一个无需序列，将第一个元素看作为一个有序的子序列，然后从第二个元素开始，依次将每一个元素插入到该有序子序列中，直至所有元素遍历完毕。

&emsp;&emsp;举例说明：对于待排序序列 5 6 1 4 8 2 9 10 3，进行升序排列。
>* **第零次排序结果：<font color="blue">5</font> 6 1 4 8 2 9 10 3**
>* **第一次排序结果：<font color="blue">5 6</font> 1 4 8 2 9 10 3**
>* **第二次排序结果：<font color="blue">1 5 6</font> 4 8 2 9 10 3**
>* **第三次排序结果：<font color="blue">1 4 5 6</font> 8 2 9 10 3**
>* **第四次排序结果：<font color="blue">1 4 5 6 8</font> 2 9 10 3**
>* **第五次排序结果：<font color="blue">1 2 4 5 6 8</font> 9 10 3**
>* **第六次排序结果：<font color="blue">1 2 4 5 6 8 9</font> 10 3**
>* **第七次排序结果：<font color="blue">1 2 4 5 6 8 9 10</font> 3**
>* **第八次排序结果：<font color="blue">1 2 3 4 5 6 8 9 10</font>**

```
// Array[]: 待排序的数组首地址
// len: 待排序元素个数
// order: 1-升序排列；0-降序排列
void InsertSort(int Array[], int len, bool order)
{
	int i,j;
	int temp;
	if( order )//升序排列
	{
		for(i = 1; i < len; i++)
		{
			if(Array[i] < Array[i-1])
			{
				temp = Array[i];
				j = i - 1;
				do
				{
					Array[j+1] = Array[j];
					j--;
				}while(j >= 0 && Array[j] > temp);
				Array[j+1] = temp;
			}
		}
	}
	else//降序排列
	{
		for(i = 1; i < len; i++)
		{
			if(Array[i] > Array[i-1])
			{
				temp = Array[i];
				j = i-1;
				do
				{
					Array[j+1] = Array[j];
					j--;
				}while(j >= 0 && Array[j] < temp);
				Array[j+1] = temp;
			}
		}
	}
}
```

**有待补充**


