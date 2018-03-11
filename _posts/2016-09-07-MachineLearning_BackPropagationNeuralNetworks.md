---
layout: post
title: "BP&nbsp;神经网络之初步理解举例 (Backpropagation Neural Networks)"
date: 2016-08-08 
description: "机器学习入门篇"
tag: 机器学习  

---     

看到深度学习如此火爆，神经网络相关资料层出不穷，不禁想起研究生阶段上过的神经网络课程，似懂非懂。这次兴起，仔细看了下应用最广泛的神经网络之一的&nbsp;BP&nbsp;神经网络，介绍如下文所示。

### 简介
BP&nbsp;(back propagation)&nbsp;神经网络是1986年由&nbsp;Rumelhart&nbsp;和&nbsp;McClelland&nbsp;为首的科学家提出的概念，是一种按照误差逆向传播算法训练的多层前馈神经网络。

### 基本原理
BP&nbsp;神经网络是一种按误差反向传播训练的多层前馈网络，其算法称为&nbsp;BP&nbsp;算法。利用梯度下降法，调整神经网络中的权重参数，以期使网络的实际输出值和期望输出值的误差均方差为最小，即使得预测输出跟踪给定输出。

### 计算过程
BP&nbsp;神经网络的计算包括两个过程：正向计算和反向计算。
* 正向计算：输入层数据经隐含层逐层处理，最终转向输出层，得出实际输出；
* 反向计算：将实际输出与期望输出间的误差信号沿着网络连接通路反向传播，辅助修正各神经元的权重，以期误差信号最小。

现在以一个典型的三层神经网络为例说明参数的计算推理调整过程。
![](/images/posts/2016-09-07-MachineLearning_BackPropagationNeuralNetworks/BPDemo3.png){:height="450px" width="900px"}


如图所示三层神经网络：输入层&nbsp;$Layer_1$、隐含层&nbsp;$Layer_2$、输出层&nbsp;$Layer_3$．输入层包括三个神经元，即输入为&nbsp;$\boldsymbol{x}=\lbrace x_1,x_2,x_3 \rbrace$，样本数据集为&nbsp;$$\mathcal{D}=\lbrace (\boldsymbol{x}_i,y_i)\rbrace$$，目标输出为&nbsp;$$o^{\text{T}}_1$$&nbsp;和&nbsp;$$o^{\text{T}}_2$$．$$\omega^{\text{L}_k}_{ij}$$&nbsp;为第&nbsp;$$k-1$$&nbsp;层的第&nbsp;$$i$$&nbsp;个神经元到第&nbsp;$$k$$&nbsp;层的第&nbsp;$$j$$&nbsp;个神经元之间的权重．$$\boldsymbol{b}^{\text{L}_k}=\{b^{\text{L}_k}_{i}\}$$&nbsp;为第&nbsp;$$k$$&nbsp;层神经元偏移量集合，$$b^{\text{L}_k}_{i}$$&nbsp;为第&nbsp;$$k$$&nbsp;层第&nbsp;$$i$$&nbsp;个神经元的偏移量．$$net^{\text{L}_k}_{i}$$&nbsp;表示第&nbsp;$$k$$&nbsp;层网络的第&nbsp;$$i$$&nbsp;个神经元的输入，$$o^{\text{L}_k}_{i}$$&nbsp;表示第&nbsp;$$k$$&nbsp;层网络的第&nbsp;$$i$$&nbsp;个神经元的输出，$$f^{\text{L}_k}_{i}(\cdot)$$&nbsp;表示第&nbsp;$k$&nbsp;层网络的第&nbsp;$i$&nbsp;个神经元的激活函数．

假设采用常见的激活函数&nbsp;sigmoid&nbsp;函数：
\begin{equation}
f(x) = \frac{1}{1+e^{-x}}
\end{equation}
其导数为：
\begin{equation}
f'(x) = f(x)(1-f(x))
\end{equation}

对于&nbsp;$Layer_2$&nbsp;层第&nbsp;$j$&nbsp;个神经元的输入：

$$\begin{equation}
net^{\text{L}_2}_{j} = \sum_{i=1}^{3}{\omega^{\text{L}_1}_{ij} \times x_i} + b^{\text{L}_2}_{j}
\end{equation}$$

对于&nbsp;$Layer_3$&nbsp;层的第&nbsp;$j$&nbsp;个神经元的输入：

$$\begin{equation}
net^{\text{L}_3}_{j} = \sum_{i=1}^{3}{\omega^{\text{L}_2}_{ij} \times o^{\text{L}_2}_i} + b^{\text{L}_3}_{j}
\end{equation}$$

第&nbsp;$$\text{L}_i$$&nbsp;层的第&nbsp;$$j$$&nbsp;个神经元的输出：

 $$\begin{equation}
 o^{\text{L}_i}_{j} = f^{\text{L}_i}_{j}{(net^{\text{L}_i}_j)} = \frac{1}{1+e^{-net^{\text{L}_i}_j}}
 \end{equation}$$

输出的总误差为：

$$\begin{equation}
E_{\text{Total}} = \frac{1}{2}\sum_{j=1}^{2}{(o^{\text{T}}_j - o^{\text{L}_3}_{j})^2} = \frac{1}{2}((o^{\text{T}}_1 - o^{\text{L}_3}_{1})^2 + (o^{\text{T}}_2 - o^{\text{L}_3}_{2})^2)
\end{equation}$$

总误差为是&nbsp;$$o^{\text{L}_3}_{1}$$&nbsp;和&nbsp;$$o^{\text{L}_3}_{2}$$&nbsp;的函数



#### **A．$Layer_2$&nbsp;与&nbsp;$Layer_3$&nbsp;间参数调整**
调整&nbsp;$Layer_2$&nbsp;与&nbsp;$Layer_3$&nbsp;间的权重&nbsp;$$\omega^{\text{L}_2}_{ij}$$．总误差对&nbsp;$$\omega^{\text{L}_2}_{ij}$$&nbsp;的偏导数为：

$$\begin{align}
\frac{\partial E_{\text{Total}}}{\partial \omega^{\text{L}_2}_{ij}} 
&= \frac{\partial E_{\text{Total}}}{\partial o^{\text{L}_3}_{j}} \cdot \frac{\partial o^{\text{L}_3}_{j}}{\partial net^{\text{L}_3}_{j}} \cdot \frac{\partial net^{\text{L}_3}_{j}}{\partial \omega^{\text{L}_2}_{ij}} \\
&= -(o^{\text{T}}_{j} - o^{\text{L}_3}_{j}) \cdot f^{\text{L}_3}_{j}{(net^{\text{L}_3}_j)}(1 - f^{\text{L}_3}_{j}{(net^{\text{L}_3}_j)}) \cdot o^{\text{L}_2}_{i} \nonumber\\
&= -(o^{\text{T}}_{j} - o^{\text{L}_3}_{j}) \cdot o^{\text{L}_3}_{j}(1 - o^{\text{L}_3}_{j}) \cdot o^{\text{L}_2}_{i} \nonumber
\end{align}$$

令&nbsp;$$\delta^{\text{L}_2}_{ij}$$&nbsp;表示&nbsp;$Layer_2$&nbsp;层第&nbsp;$i$&nbsp;个神经元与&nbsp;$Layer_3$&nbsp;层第&nbsp;$j$&nbsp;个神经元间权重的梯度项，则

$$\begin{equation}
\delta^{\text{L}_2}_{ij} = \frac{\partial E_{\text{Total}}}{\partial o^{\text{L}_3}_{j}} \cdot \frac{\partial o^{\text{L}_3}_{j}}{\partial net^{\text{L}_3}_{j}} = -(o^{\text{T}}_{j} - o^{\text{L}_3}_{j}) \cdot o^{\text{L}_3}_{j}(1 - o^{\text{L}_3}_{j}) 
\end{equation}$$

可以看出，&nbsp;$Layer_2$&nbsp;层第&nbsp;$i$&nbsp;个神经元与&nbsp;$Layer_3$&nbsp;层第&nbsp;$j$&nbsp;个神经元间权重的梯度项是与&nbsp;$i$&nbsp;无关的，故连接至&nbsp;$Layer_3$&nbsp;层第&nbsp;$j$&nbsp;个神经元相对应的权重的梯度向均为&nbsp;$$\delta^{\text{L}_2}_{ij}$$，用&nbsp;$$\delta^{\text{L}_2}_{\cdot j}$$&nbsp;表示，

$$\begin{equation}
\delta^{\text{L}_2}_{\cdot j} = \delta^{\text{L}_2}_{ij} = -(o^{\text{T}}_{j} - o^{\text{L}_3}_{j}) \cdot o^{\text{L}_3}_{j}(1 - o^{\text{L}_3}_{j})
\end{equation}$$

则整体误差&nbsp;$$E_{\text{Total}}$$&nbsp;对&nbsp;$$\omega^{\text{L}_2}_{ij}$$&nbsp;的偏导数公式写作：

$$\begin{equation}
\frac{\partial E_{\text{Total}}}{\partial \omega^{\text{L}_2}_{ij}}
= \delta^{\text{L}_2}_{\cdot j} \cdot o^{\text{L}_2}_{i}
\end{equation}$$

则权重&nbsp;$$\omega^{\text{L}_2}_{ij}$$&nbsp;的学习公式为：

$$\begin{align}\label{eqn:Self-updating formular for weights between L2 and L3}
\widehat{\omega}^{\text{L}_2}_{ij} 
&= \omega^{\text{L}_2}_{ij} - \eta \cdot \frac{\partial E_{\text{Total}}}{\partial \omega^{\text{L}_2}_{ij}} \\
&= \omega^{\text{L}_2}_{ij} - \eta \cdot \delta^{\text{L}_2}_{\cdot j} \cdot o^{\text{L}_2}_{i} \nonumber
\end{align}$$

其中，$\eta$&nbsp;为学习速率．

调整&nbsp;$Layer_3$&nbsp;的偏移量参数．$Layer_3$&nbsp;的第&nbsp;$j$&nbsp;个神经元的偏移量&nbsp;$$b^{\text{L}_3}_{j}$$&nbsp;的梯度为：

$$\begin{align}
\frac{\partial E_{\text{Total}}}{\partial b^{\text{L}_3}_{j}}
&= \frac{\partial E_{\text{Total}}}{\partial o^{\text{L}_3}_{j}} \cdot \frac{\partial o^{\text{L}_3}_{j}}{\partial net^{\text{L}_3}_{j}} \cdot \frac{\partial net^{\text{L}_3}_{j}}{\partial b^{\text{L}_3}_{j}} \\
&= -(o^{\text{T}}_{j} - o^{\text{L}_3}_{j}) \cdot f^{\text{L}_3}_{j}{(net^{\text{L}_3}_j)}(1 - f^{\text{L}_3}_{j}{(net^{\text{L}_3}_j)}) \cdot 1 \nonumber\\
&= -(o^{\text{T}}_{j} - o^{\text{L}_3}_{j}) \cdot o^{\text{L}_3}_{j}(1 - o^{\text{L}_3}_{j}) \nonumber\\
&= \delta^{\text{L}_2}_{\cdot j} \nonumber
\end{align}$$

偏移&nbsp;$$b^{\text{L}_3}_{j}$$&nbsp;的学习公式为：

$$\begin{equation}\label{eqn:Self-updating formular for bias in L3}
\hat{b}^{\text{L}_3}_{j} = b^{\text{L}_3}_{j} - \eta \cdot \frac{\partial E_{\text{Total}}}{\partial b^{\text{L}_3}_{j}}
= b^{\text{L}_3}_{j} - \eta \cdot \delta^{\text{L}_2}_{\cdot j}
\end{equation}$$

**例如**，依据公式（\ref{eqn:Self-updating formular for weights between L2 and L3}），对于权重&nbsp;$$\omega^{\text{L}_2}_{11}$$&nbsp;的更新学习公式为：

$$\begin{align*}
\widehat{\omega}^{\text{L}_2}_{11} 
&= \omega^{\text{L}_2}_{11} - \eta \cdot \frac{\partial E_{\text{Total}}}{\partial \omega^{\text{L}_2}_{11}} \\
&= \omega^{\text{L}_2}_{11} - \eta \cdot \delta^{\text{L}_2}_{11} \cdot o^{\text{L}_2}_{1} \\
&= \omega^{\text{L}_2}_{11} - \eta \cdot \big(-(o^{\text{T}}_{1} - o^{\text{L}_3}_{1}) \cdot o^{\text{L}_3}_{1}(1 - o^{\text{L}_3}_{1})\big) \cdot o^{\text{L}_2}_{1} \\
&= \omega^{\text{L}_2}_{11} + \eta \cdot (o^{\text{T}}_{1} - o^{\text{L}_3}_{1}) \cdot o^{\text{L}_3}_{1}(1 - o^{\text{L}_3}_{1}) \cdot o^{\text{L}_2}_{1}
\end{align*}$$

**例如**，依据公式（\ref{eqn:Self-updating formular for bias in L3}），对于偏移&nbsp;$$b^{\text{L}_3}_{1}$$&nbsp;的更新学习公式为：

$$\begin{align*}
\hat{b}^{\text{L}_3}_{1} 
&= b^{\text{L}_3}_{1} - \eta \cdot \frac{\partial E_{\text{Total}}}{\partial b^{\text{L}_3}_{1}} \\
&= b^{\text{L}_3}_{1} + \eta \cdot (o^{\text{T}}_{1} - o^{\text{L}_3}_{1}) \cdot o^{\text{L}_3}_{1}(1 - o^{\text{L}_3}_{1}) 
\end{align*}$$

#### **B．$Layer_1$&nbsp;与&nbsp;$Layer_2$&nbsp;间参数调整**
调整&nbsp;$Layer_1$&nbsp;与&nbsp;$Layer_2$&nbsp;间的权重&nbsp;$$\omega^{\text{L}_1}_{ij}$$．总体误差对&nbsp;$$\omega^{\text{L}_1}_{ij}$$&nbsp;的偏导数为：

$$\begin{align}
\frac{\partial E_{\text{Total}}}{\partial \omega^{\text{L}_1}_{ij}}
&= (\sum_{k=1}^{2}{\frac{\partial E_{\text{Total}}}{\partial o^{\text{L}_3}_{k}} \frac{\partial o^{\text{L}_3}_{k}}{\partial net^{\text{L}_3}_k} \frac{\partial net^{\text{L}_3}_k}{\partial o^{\text{L}_2}_{j}}})  \cdot \frac{\partial o^{\text{L}_2}_{j}}{\partial net^{\text{L}_2}_j} \cdot \frac{\partial net^{\text{L}_2}_j}{\partial \omega^{\text{L}_1}_{ij}} \\
&= (\sum_{k=1}^{2}{\delta^{\text{Layer}_2}_{\cdot k} \omega^{\text{L}_2}_{3k}}) \cdot f^{\text{L}_2}_{j}{(net^{\text{L}_2}_j)}(1 - f^{\text{L}_2}_{j}{(net^{\text{L}_2}_j)}) \cdot x_i \nonumber\\
&= (\sum_{k=1}^{2}{\delta^{\text{Layer}_2}_{\cdot k} \omega^{\text{L}_2}_{3k}}) \cdot o^{\text{L}_2}_{j}(1 - o^{\text{L}_2}_{j}) \cdot x_i \nonumber
\end{align}$$

令&nbsp;$$\delta^{\text{L}_1}_{ij}$$&nbsp;表示&nbsp;$Layer_1$&nbsp;层第&nbsp;$i$&nbsp;个神经元与&nbsp;$Layer_2$&nbsp;层第&nbsp;$j$&nbsp;个神经元间权重的梯度项，则

$$\begin{align}
\delta^{\text{L}_1}_{ij} 
&= (\sum_{k=1}^{2}{\frac{\partial E_{\text{Total}}}{\partial o^{\text{L}_3}_{k}} \frac{\partial o^{\text{L}_3}_{k}}{\partial net^{\text{L}_3}_k} \frac{\partial net^{\text{L}_3}_k}{\partial o^{\text{L}_2}_{j}}})  \cdot \frac{\partial o^{\text{L}_2}_{j}}{\partial net^{\text{L}_2}_j} \\
&= (\sum_{k=1}^{2}{\delta^{\text{Layer}_2}_{\cdot k} \omega^{\text{L}_2}_{3k}}) \cdot o^{\text{L}_2}_{j}(1 - o^{\text{L}_2}_{j}) \nonumber
\end{align}$$

可以看出，&nbsp;$Layer_1$&nbsp;层第&nbsp;$i$&nbsp;个神经元与&nbsp;$Layer_2$&nbsp;层第&nbsp;$j$&nbsp;个神经元间权重的梯度项是与&nbsp;$i$&nbsp;无关的，故连接至&nbsp;$Layer_2$&nbsp;层第&nbsp;$j$&nbsp;个神经元相对应的权重的梯度向均为&nbsp;$$\delta^{\text{L}_1}_{ij}$$，用&nbsp;$$\delta^{\text{L}_1}_{\cdot j}$$&nbsp;表示，

$$\begin{equation}
\delta^{\text{L}_1}_{\cdot j} = \delta^{\text{L}_1}_{ij} = (\sum_{k=1}^{2}{\delta^{\text{Layer}_2}_{\cdot k} \omega^{\text{L}_2}_{3k}}) \cdot o^{\text{L}_2}_{j}(1 - o^{\text{L}_2}_{j})
\end{equation}$$

则整体误差&nbsp;$$E_{\text{Total}}$$&nbsp;对&nbsp;$$\omega^{\text{L}_1}_{ij}$$&nbsp;的偏导数公式写作：

$$\begin{equation}
\frac{\partial E_{\text{Total}}}{\partial \omega^{\text{L}_1}_{ij}}
= \delta^{\text{L}_1}_{\cdot j} \cdot x_i
\end{equation}$$

则权重&nbsp;$$\omega^{\text{L}_1}_{ij}$$&nbsp;的学习公式为：

$$\begin{equation}\label{eqn:Self-updating formular for weights between L1 and L2}
\widehat{\omega}^{\text{L}_1}_{ij} = \omega^{\text{L}_1}_{ij} - \eta \cdot \frac{\partial E_{\text{Total}}}{\partial \omega^{\text{L}_1}_{ij}} 
= \omega^{\text{L}_1}_{ij} - \eta \cdot \delta^{\text{L}_1}_{\cdot j} \cdot x_i
\end{equation}$$

$$\begin{align}
\frac{\partial E_{\text{Total}}}{\partial b^{\text{L}_2}_{j}}
&= (\sum_{k=1}^{2}{\frac{\partial E_{\text{Total}}}{\partial o^{\text{L}_3}_{k}} \frac{\partial o^{\text{L}_3}_{k}}{\partial net^{\text{L}_3}_k} \frac{\partial net^{\text{L}_3}_k}{\partial o^{\text{L}_2}_{j}}})  \cdot \frac{\partial o^{\text{L}_2}_{j}}{\partial net^{\text{L}_2}_j} \cdot \frac{\partial net^{\text{L}_2}_j}{\partial b^{\text{L}_2}_{j}} \\
&= (\sum_{k=1}^{2}{\delta^{\text{Layer}_2}_{\cdot k} \omega^{\text{L}_2}_{3k}}) \cdot f^{\text{L}_2}_{j}{(net^{\text{L}_2}_j)}(1 - f^{\text{L}_2}_{j}{(net^{\text{L}_2}_j)}) \cdot 1 \nonumber\\
&= (\sum_{k=1}^{2}{\delta^{\text{Layer}_2}_{\cdot k} \omega^{\text{L}_2}_{3k}}) \cdot o^{\text{L}_2}_{j}(1 - o^{\text{L}_2}_{j}) \nonumber\\
&= \delta^{\text{L}_1}_{\cdot j} \nonumber
\end{align}$$

偏移&nbsp;$$b^{\text{L}_2}_{j}$$&nbsp;的学习公式为：

$$\begin{equation}\label{eqn:Self-updating formular for bias in L2}
\hat{b}^{\text{L}_2}_{j} = b^{\text{L}_2}_{j} - \eta \cdot \frac{\partial E_{\text{Total}}}{\partial b^{\text{L}_2}_{j}}
= b^{\text{L}_2}_{j} - \eta \cdot \delta^{\text{L}_1}_{\cdot j}
\end{equation}$$

**例如**，依据公式（\ref{eqn:Self-updating formular for weights between L1 and L2}）对于权重&nbsp;$$\omega^{\text{L}_1}_{23}$$&nbsp;的更新学习公式为：

$$\begin{align}\label{eq2:description}
\widehat{\omega}^{\text{L}_1}_{23} 
&= \omega^{\text{L}_2}_{23} - \eta \cdot \frac{\partial E_{\text{Total}}}{\partial \omega^{\text{L}_1}_{23}} \\
&= \omega^{\text{L}_2}_{23} - \eta \cdot \big((\sum_{j=1}^{2}{\frac{\partial E_{\text{Total}}}{\partial o^{\text{L}_3}_{j}} \frac{\partial o^{\text{L}_3}_{j}}{\partial net^{\text{L}_3}_j} \frac{\partial net^{\text{L}_3}_j}{\partial o^{\text{L}_2}_{3}}})  \cdot \frac{\partial o^{\text{L}_2}_{3}}{\partial net^{\text{L}_2}_3} \cdot \frac{\partial net^{\text{L}_2}_3}{\partial \omega^{\text{L}_1}_{23}}\big) \nonumber\\
&= \omega^{\text{L}_2}_{23} - \eta \cdot (\sum_{j=1}^{2}{\delta^{\text{Layer}_2}_{\cdot j} \omega^{\text{L}_2}_{3j}}) \cdot f^{\text{L}_2}_{3}{(net^{\text{L}_2}_3)}(1 - f^{\text{L}_2}_{3}{(net^{\text{L}_2}_3)}) \cdot x_2 \nonumber\\
&= \omega^{\text{L}_2}_{23} - \eta \cdot (\sum_{j=1}^{2}{\delta^{\text{Layer}_2}_{\cdot j} \omega^{\text{L}_2}_{3j}}) \cdot o^{\text{L}_2}_{3}(1 - o^{\text{L}_2}_{3}) \cdot x_2 \nonumber
\end{align}$$

**例如**，依据公式（\ref{eqn:Self-updating formular for bias in L2}），对于偏移&nbsp;$$b^{\text{L}_2}_{3}$$&nbsp;的更新学习公式为：

$$\begin{align}\label{eq1:description}
\hat{b}^{\text{L}_2}_{3} &= b^{\text{L}_3}_{1} - \eta \cdot \frac{\partial E_{\text{Total}}}{\partial b^{\text{L}_2}_{3}} \\
&= b^{\text{L}_2}_{3} - \eta \cdot \big((\sum_{j=1}^{2}{\frac{\partial E_{\text{Total}}}{\partial o^{\text{L}_3}_{j}} \frac{\partial o^{\text{L}_3}_{j}}{\partial net^{\text{L}_3}_j} \frac{\partial net^{\text{L}_3}_j}{\partial o^{\text{L}_2}_{3}}})  \cdot \frac{\partial o^{\text{L}_2}_{3}}{\partial net^{\text{L}_2}_3} \cdot \frac{\partial net^{\text{L}_2}_3}{\partial b^{\text{L}_2}_{3}}\big) \nonumber\\ 
&=  b^{\text{L}_2}_{3} - \eta \cdot (\sum_{j=1}^{2}{\delta^{\text{Layer}_2}_{\cdot j} \omega^{\text{L}_2}_{3j}}) \cdot f^{\text{L}_2}_{3}{(net^{\text{L}_2}_3)}(1 - f^{\text{L}_2}_{3}{(net^{\text{L}_2}_3)}) \cdot 1 \nonumber\\ 
&= b^{\text{L}_2}_{3} - \eta \cdot (\sum_{j=1}^{2}{\delta^{\text{Layer}_2}_{\cdot j} \omega^{\text{L}_2}_{3j}}) \cdot o^{\text{L}_2}_{3}(1 - o^{\text{L}_2}_{3}) \nonumber
\end{align}$$

结合上述公式，根据样本参数计算总体误差；根据总体误差，更新神经网络参数；这样，实现信号的正向传递，误差的反向传播，参数的自适应．如此，进行不停的迭代直至满足停止条件．


<!--
-->



