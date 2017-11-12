---
layout: post
title: Nondominated Sorting Genetic Algorithm II (NSGA-II)
date: 2014-05-03 
tag: 数据结构及算法
---
<!-- 法一：使用MathJax引擎制作数学公式
 <script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>-->
<!-- 法二：使用Google Chart的服务器制作数学公式
<img src="http://chart.googleapis.com/chart?cht=tx&chl= 在此插入Latex公式" style="border:none;">
<img src="http://chart.googleapis.com/chart?cht=tx&chl= O(MN^3)" style="border:none;">
 -->

<!-- 公式：
	行内公式：$$ a^2+b^2=c^2 $$
	行间公式（编号）：
		\\[E1: a^2+b^2=c^2\\]
		\begin{equation}
		E3: a^2+b^2=c^2
		\end{equation} 
-->

### 目录

* [NSGA-II&ensp;简介](#IntroductionofNSGA-II)
* [NSGA-II&ensp;主流程](#DetailedIntroductionofNSGA-II)
* [快速非支配排序](#FastNondominatedSortingApproach)
* [多样性保留](#DiversityPreservation)

### <a name="IntroductionofNSGA-II"></a>NSGA-II&ensp;简介
&emsp;&emsp;Nondominated Sorting Genetic Algorithm II (NSGA-II)，又名&ensp;a nondominated sorting-based multiobjective EA (MOEA)，是由&ensp;NSGA&ensp;改进而来的，用于解决复杂的、多目标优化问题。该算法是&ensp;K-Deb&ensp;在&ensp;2002&ensp;年论文《A Fast and Elitist Multiobjective Genetic Algorithm: NSGA-II》中提出。

&emsp;&emsp;针对&ensp;NSGA&ensp;中存在的问题：1）复杂度&ensp;$$O(MN^3)$$，$$M$$&ensp;为优化目标个数，$$N$$&ensp;为种群规模；2）非精英主义；3）需要指定共享参数，该参数将对种群的多样性产生很大的影响。与此相比，&ensp;NSGA-II&ensp;有几个特点：1）复杂度相对较低，为&ensp;$$O(MN^2)$$&ensp;；2）维护了精英个体，即在迭代过程中保留了最为精英的部分；3）不需要用户指定类似共享参数之列的参数，减少用户主观指定的参数，NSGA-II中从新定义了拥挤距离代替共享参数。

### <a name="DetailedIntroductionofNSGA-II"></a>NSGA-II&ensp;主流程
NSGA-II&ensp;主循环流程与一般的&ensp;GA&ensp;类似，在构建后代种群是方法尤其独特性，其具体步骤为：
* 构建新一代种群：父代&ensp;+&ensp;子代
* 对新一代种群进行非支配排序和拥挤距离评估
* 精选新一代种群个体：对于不同支配等级的个体，优选支配等级小的个体；对于拥有相同支配等级的，选择拥挤距离大的个体；
* 对该种群进行交叉、变异操作，产生子代种群；

其主要流程如下：
![](/images/posts/2014-04-08-NSGA-II Algorithm/NSGA-II procedure.jpg){:height="250px" width="500px"}

伪代码如下所示：
![](/images/posts/2014-04-08-NSGA-II Algorithm/MainLoop.jpg){:height="280px" width="700px"}

### <a name="FastNondominatedSortingApproach"></a>快速非支配排序
&emsp;&emsp;提及多目标优化，一般需要了解&ensp;Pareto Optimal，快速非支配排序就是依据此进行排序。对于&ensp;Pareto Optimal&ensp;的概念这里不做介绍，感兴趣的读者可以自行查阅。

快速非支配排序中的&ensp;2&ensp;个概念：
* 被支配个体集合&ensp;$$S_p$$: 解空间中，可以支配个体&ensp;$$p$$&ensp;的所有个体构成的集合； 
* 支配个体数&ensp;$$n_p$$: 解空间中，被个体&ensp;$$p$$&ensp;支配的所有个体的数量；

其主要步骤如下：
* 计算每个个体的&ensp;$$n_p$$&ensp;和&ensp;$$S_p$$&ensp;
* $$n_p$$=0&ensp;的个体归属于&ensp;$$\mathcal{F}_1$$；然后令这些个体的&ensp;$$S_p$$&ensp;所有个体的&ensp;$$n_p-1$$；
* $$n_p=0$$&ensp;的个体归属于&ensp;$$\mathcal{F}_2$$；以此类推，直到所有个体处理完毕；

其伪代码如下：
![](/images/posts/2014-04-08-NSGA-II Algorithm/FastNondominatedSort.jpg){:height="550px" width="550px"}

上述算法的时间复杂度为$$O(M(2N)^2)$$。

### <a name="DiversityPreservation"></a>多样性保留
在&ensp;NSGA&ensp;中通过共享参数保持解能相对均匀分布，也就是尽量要保持解的多样性。对于&ensp;NSGA-II&ensp;则是采用拥挤距离来维持种群多样性。

拥挤距离定义如下：拥挤距离等于解在各个目标函数的方向上的前后两个解的距离和。在二维时，就等于图像矩形轴周长的一半。
![](/images/posts/2014-04-08-NSGA-II Algorithm/Define of Crowding-distance.jpg){:height="200px" width="300px"}

其计算的伪代码如下：
![](/images/posts/2014-04-08-NSGA-II Algorithm/Crowding distance assignment.jpg){:height="200px" width="850px"}

上述算法的时间复杂度为$$O(M(2N)log(2N))$$。

注意：如果某个方向上的距离很大，就会很大程度上影响总的距离的大小。为了使每个方向上的目标函数对拥挤距离有等效的影响力（无量纲化），需要每个目标函数上的距离要规则化normalized。

在进行个体选择时，需要比较个体优劣，对于处于不同支配等级的个体，支配等级越低，则越优；对于处于同一支配等级的个体，则比较拥挤距离：距离越大，表明周围解的密度越小，则分布越均匀，则越优。其比较规则如下：
![](/images/posts/2014-04-08-NSGA-II Algorithm/Crowded comparison operator.jpg){:height="150px" width="400px"}


NSGA-II&ensp;的代码已在&ensp;K-Deb&ensp;实验室网站公布：[http://www.iitk.ac.in/kangal/codes.shtml](http://www.iitk.ac.in/kangal/codes.shtml)，可以下载下来学习。

