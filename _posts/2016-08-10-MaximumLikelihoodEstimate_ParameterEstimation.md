---
layout: post
title: "参数估计之最大似然估计(Maximum Likelihood Estimate，MLE)"
date: 2016-08-08 
description: "机器学习入门篇"
tag: 机器学习  

---     

### 简介

设总体&nbsp;$X$&nbsp;的分布函数的形式已知，但它的一个或多个参数未知，借助于总体&nbsp;$X$&nbsp;的样本来估计总体未知的参数的值得问题称为**参数的点估计**问题。
  

点估计问题的一般提法如下：设总体&nbsp;$X$&nbsp;的分布函数&nbsp;$F(x;\theta)$&nbsp;的形式已知，$\theta$&nbsp;是待估计参数。$X_1,X_2,\cdots,X_n$&nbsp;是&nbsp;$X$&nbsp;的一个样本，$x_1,x_2,\cdots,x_n$&nbsp;是相应的一个样本值。点估计问题就是要构造一个适当的统计量&nbsp;$\hat{\theta}(X_1,X_2,\cdots,X_n)$，用它的观察值&nbsp;$\hat{\theta}(x_1,x_2,\cdots,x_n)$&nbsp;作为未知参数&nbsp;$\theta$&nbsp;的近似值。我们称&nbsp;$\hat{\theta}(X_1,X_2,\cdots,X_n)$&nbsp;为&nbsp;$\theta$&nbsp;的估计量，称&nbsp;$\hat{\theta}(x_1,x_2,\cdots,x_n)$&nbsp;为&nbsp;$\theta$&nbsp;的估计值。

### 最大似然估计法
利用已知的样本结果，反推最有可能（最大概率）导致这样结果的参数值，即“模型已定，参数未知”。

#### **离散型随机变量**
总体&nbsp;$X$&nbsp;属于离散型，其分布律&nbsp;$P\lbrace X=x \rbrace =p(x;\theta)$，$\theta \in \Theta$&nbsp;的形式为已知，$\theta$&nbsp;为待估计参数，$\Theta$&nbsp;是&nbsp;$\theta$&nbsp;可能的取值范围。设&nbsp;$X_1,X_2,\cdots,X_n$&nbsp;是来自&nbsp;$X$&nbsp;的样本，则&nbsp;$X_1,X_2,\cdots,X_n$&nbsp;的联合分布律为：
\begin{equation}
	\prod_{i=1}^{n}{p(x_i;\theta)}
\end{equation}

设&nbsp;$x_1,x_2,\cdots,x_n$&nbsp;是相应于样本&nbsp;$X_1,X_2,\cdots,X_n$&nbsp;的一个估计值。易知样本&nbsp;$X_1,X_2,\cdots,X_n$&nbsp;取到观察值&nbsp;$x_1,x_2,\cdots,x_n$&nbsp;的概率，亦即时间&nbsp;$\lbrace X_1=x_1, X_2=x_2,\cdots,X_n=x_n \rbrace$&nbsp;发生的概率为：
\begin{equation}
	L(\theta) = L(x_1,x_2,\cdots,x_n;\theta) = \prod_{i=1}^{n}{p(x_i;\theta)}, \theta \in \Theta
\end{equation}
这一概率随&nbsp;$\theta$&nbsp;的取值而变化，它是&nbsp;$\theta$&nbsp;的函数，$L(\theta)$&nbsp;称为样本的**似然函数**（注意，这里&nbsp;$x_1,x_2,\cdots,x_n$&nbsp;是已知的样本值，即已发生的时间，它是都是常数）。

关于最大似然估计法，我们有以下的直观想法：现在已经取到样本值&nbsp;$x_1,x_2,\cdots,x_n$&nbsp;了，这表明取到这一样本值得概率&nbsp;$L(\theta)$&nbsp;比较大。我们当然不会考虑那些不能使样本&nbsp;$x_1,x_2,\cdots,x_n$&nbsp;出现的&nbsp;$\theta \in \Theta$&nbsp;作为&nbsp;$\theta$&nbsp;的估计，再者，如果已知当&nbsp;$\theta=\theta_0 \in \Theta$&nbsp;时使&nbsp;$L(\theta)$&nbsp;取最大值，而&nbsp;$\Theta$&nbsp;中的其他&nbsp;$\theta$&nbsp;的值使&nbsp;$L(\theta)$&nbsp;取很小值，我们自然认为取&nbsp;$\theta_0$&nbsp;作为未知参数&nbsp;$\theta$&nbsp;的估计值，较为合理。由费希尔（R.A.Fisher）引进的最大似然估计法，就是固定样本观测值&nbsp;$x_1,x_2,\cdots,x_n$，在&nbsp;$\theta$&nbsp;取值的可能范围&nbsp;$\Theta$&nbsp;内挑选使似然函数&nbsp;$L(\theta) = L(x_1,x_2,\cdots,x_n;\theta)$&nbsp;达到最大的参数值&nbsp;$\hat{\theta}$&nbsp;，作为参数&nbsp;$\theta$&nbsp;的估计值。即取&nbsp;$\hat{\theta}$&nbsp;使：
\begin{equation}
	L(\theta) = L(x_1,x_2,\cdots,x_n;\hat{\theta}) = \max_{\theta \in \Theta}{L(x_1,x_2,\cdots,x_n;\theta)}
\end{equation}

这样得到的&nbsp;$\hat{\theta}$&nbsp;与样本值&nbsp;$x_1,x_2,\cdots,x_n$&nbsp;有关，常记为&nbsp;$\hat{\theta}(x_1,x_2,\cdots,x_n)$&nbsp;，称为参数&nbsp;$\theta$&nbsp;的**最大似然估计值**，而相应的统计量&nbsp;$\hat{\theta}(X_1,X_2,\cdots,X_n)$&nbsp;称为参数&nbsp;$\theta$&nbsp;的**最大似然估计量**。
\begin{equation}
	\hat{\theta} = \arg\max_{\theta \in \Theta}{L(\theta)} = \arg\max_{\theta \in \Theta}{\prod_{i=1}^{n}{p(x_i;\theta)}}
\end{equation}

#### **连续型随机变量**
总体&nbsp;$X$&nbsp;属于连续型，其概率密度&nbsp;$f(x;\theta)$，$\theta \in \Theta$&nbsp;的形式已知，$\theta$&nbsp;为待估参数，$\Theta$&nbsp;是&nbsp;$\theta$&nbsp;可能取值的范围。设&nbsp;$X_1,X_2,\cdots,X_n$&nbsp;是来自&nbsp;$X$&nbsp;的样本，则&nbsp;$X_1,X_2,\cdots,X_n$&nbsp;的联合密度为：
\begin{equation}\label{eqn:Probability Density Function of Continuous Variable}
	\prod_{i=1}^{n}{f(x_i,\theta)}
\end{equation}
设&nbsp;$x_1,x_2,\cdots,x_n$&nbsp;是相应于样本&nbsp;$X_1,X_2,\cdots,X_n$&nbsp;的一个样本值，则随机点&nbsp;$(X_1,X_2,\cdots,X_n)$&nbsp;落在点&nbsp;$(x_1,x_2,\cdots,x_n)$&nbsp;的邻域（边长分别为&nbsp;$\text{d}x_1,\text{d}x_2,\cdots,\text{d}x_n$&nbsp;的&nbsp;$n$&nbsp;维立方体）内的概率近似地为：
\begin{equation}\label{eqn:Approprixate Probability of a Sample for Continuous Variable}
	\prod_{i=1}^{n}{f(x_i;\theta)\text{d}x_i}
\end{equation}
其取值随&nbsp;$\theta$&nbsp;的取值而变化。与离散型的情况一样，我们取&nbsp;$\theta$&nbsp;的估计值&nbsp;$\hat{\theta}$&nbsp;使概率（\ref{eqn:Approprixate Probability of a Sample for Continuous Variable}）到最大值，但因子&nbsp;$\prod_{i=1}^{n}{\text{d}x_i}$&nbsp;不随&nbsp;$\theta$&nbsp;而变，故只需考虑函数：
\begin{equation}\label{eqn:Likelyhood Function of Continuous Variable}
	L(\theta) = L(x_1,x_2,\cdots,x_n;\theta) = \prod_{i=1}^{n}{f(x_i;\theta)}
\end{equation}
的最大值。这里&nbsp;$L(\theta)$&nbsp;称为样本的**似然函数**。若
\begin{equation}\label{eqn:Maximum Likelyhood Function of Continuous Variable}
	L(x_1,x_2,\cdots,x_n;\hat{\theta}) = \max_{\theta \in \Theta}{L(x_1,x_2,\cdots,x_n;\theta)}
\end{equation}
则称&nbsp;$\hat{\theta}(x_1,x_2,\cdots,x_n)$&nbsp;为&nbsp;$\theta$&nbsp;的**最大似然估计值**，称&nbsp;$\hat{\theta}(X_1,X_2,\cdots,X_n)$&nbsp;为&nbsp;$\theta$&nbsp;的**最大似然估计l量**。
\begin{equation}
	\hat{\theta} = \arg\max_{\theta \in \Theta}{L(\theta)} = \arg\max_{\theta \in \Theta}{\prod_{i=1}^{n}{f(x_i;\theta)}}
\end{equation}


#### **对数似然方程**
由上述分析，确定最大似然估计量的问题就归结为微分学中求最大值的问题了。
在很多情形下，$p(x;\theta)$&nbsp;和&nbsp;$f(x;\theta)$&nbsp;关于&nbsp;$\theta$&nbsp;可微，这时&nbsp;$\hat{\theta}$&nbsp;常可从方程：
\begin{equation}\label{eqn:Difference of Likelyhood Function}
	\frac{\text{d}}{\text{d}\theta}L(\theta)=0
\end{equation}
解得。又因&nbsp;$L(\theta)$&nbsp;与&nbsp;$\ln L(\theta)$&nbsp;在同一&nbsp;$\theta$&nbsp;处取到极值，因此，$\theta$&nbsp;的最大似然估计&nbsp;$\theta$&nbsp;也可以从方程：
\begin{equation}\label{eqn:Difference of Logarithm Likelyhood Function}
	\frac{\text{d}}{\text{d}\theta}\ln L(\theta)=0
\end{equation}
求得，而且从方程（\ref{eqn:Difference of Logarithm Likelyhood Function}）求解往往比较方便。方程（\ref{eqn:Difference of Logarithm Likelyhood Function}）称为**对数似然方程**。

\begin{equation}
	\hat{\theta} = \arg\max_{\theta \in \Theta}{\ln L(\theta)}
\end{equation}

#### **多未知参数的似然估计**
最大似然估计法也适用于分布中含有多个未知参数&nbsp;$\theta_1,\theta_2,\cdots,\theta_k$&nbsp;的情况。这时，似然函数&nbsp;$L$&nbsp;是这些未知参数的函数。分别令：
\begin{equation\*}
	\frac{\partial}{\partial\theta_i}L(\theta)=0,i=1,2,\cdots,k
\end{equation\*}
或者
\begin{equation}\label{eqn:Group of Logarithm Likelyhood Function}
	\frac{\partial}{\partial\theta_i}\ln L(\theta)=0,i=1,2,\cdots,k
\end{equation}
解上述由&nbsp;$k$&nbsp;个方程组成的方程组，即可得到各未知参数&nbsp;$\theta_i(i=1,2,\cdots,k)$&nbsp;的最大似然估计值&nbsp;$\hat{\theta}_i$。方程组（\ref{eqn:Group of Logarithm Likelyhood Function}）称为**对数似然方程组**。



### 举例
#### **例题一**
设&nbsp;$X \sim b(1,p)$。$X_1,X_2,\cdots,X_n$&nbsp;是来自&nbsp;$X$&nbsp;的一个样本，试求参数&nbsp;$p$&nbsp;的最大似然估计。

**解**：
设&nbsp;$x_1,x_2,\cdots,x_n$&nbsp;是相应于样本&nbsp;$X_1,X_2,\cdots,X_n$&nbsp;的一个样本值。&nbsp;$X$&nbsp;的分布律为：
\begin{equation\*}
	P\lbrace X=x \rbrace = p^{x}(1-p)^{1-x}, x = 0,1
\end{equation\*}
故似然函数为：
\begin{equation\*}
	L(p) = \prod_{i=1}^{n}{p^{x_i}(1-p)^{1-x_i}} = p^{\sum_{i=1}^{n}{~x_i}}~(1-p)^{n-\sum_{i=1}^{n}{~x_i}}
\end{equation\*}
而
\begin{equation\*}
	\ln L(p) = (\sum_{i=1}^{n}{x_i})\ln p + (n-\sum_{i=1}^{n}{x_i})\ln(1-p)
\end{equation\*}
令
\begin{equation\*}
	\frac{\text{d}}{\text{d}p}\ln L(p) = \frac{\sum_{i=1}^{n}{x_i}}{p} - \frac{n-\sum_{i=1}^{n}{x_i}}{1-p} = 0
\end{equation\*}
解得&nbsp;$p$&nbsp;的最大似然估计值：
\begin{equation\*}
	\hat{p} = \frac{1}{n}~\sum_{i=1}^{n}{x_i} = \bar{x}
\end{equation\*}
$p$&nbsp;的最大似然估计量为：
\begin{equation\*}
	\hat{p} = \frac{1}{n}~\sum_{i=1}^{n}{X_i} = \bar{X}
\end{equation\*}

### 小结
**最大似然估计法所求的解只是估计值，只有在样本数趋于无限多的时候，它才会接近于真实值**。
求解最大似然估计量&nbsp;$\hat{\theta}$&nbsp;的一般步骤：
* 根据概率分布写出似然函数；
* 对似然函数取对数，并整理；
* 对对数似然函数中所有待估计参数&nbsp;$\theta_i$&nbsp;求（偏）导数，并令倒数为零；
* 求解似然方程（组）；

<!--
-->



