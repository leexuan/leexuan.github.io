---
layout: post
title: Markdown格式样板
date: 2015-01-03 
tag: 工具使用
---

### 目录

* [什么时候应用神经网络？](#When-to-apply-neural-net)
* [通常神经网络能解决的问题](#solve-problems)


### <a name="When-to-apply-neural-net"></a>什么时候用神经网络？

### <a name="solve-problems"></a>通常神经网络解决的问题

### 文本环境

打包 `.ipa` 时，包体积会小很多。

**粗体** 或者 *斜体* 


标题            
H1 :# Header 1            
H2 :## Header 2           
H3 :### Header 3           
H4 :#### Header 4           
H5 :##### Header 5            
H6 :###### Header 6      
链接 :[Title](URL)        
加粗 :**Bold**        
斜体字 :*Italics*         
*删除线 :~~text~~          
段落 : 段落之间空一行           
换行符 : 一行结束时输入两个空格           
列表 :* 添加星号成为一个新的列表项。          
引用 :> 引用内容               
内嵌代码 : `alert('Hello World');`        
画水平线 (HR) :-------- 

>* 后台看注册系统?      
>　有些麻烦，需要后台去数据库里查看，还要做成数据可视化的才方便看。

### 表格环境

|    | 文件名 | 标签 |
| -- |:-----:| ---:|
|  0 | 0.png |  4  |
|  1 | 1.png |  9  |

### 列表环境

列表1：
* 检查它是否为 神经网络 ，把它看成一个传统的算法问题
* 做一个调查，哪个 神经网络 框架最适合解决这个问题

列表1：
* 1、获取Wifi列表功能由于是需要申请后台权限，所以能后台激活App(应用程序)，而且激活后App的进程能存活几个小时。
* 2、整个获取Wifi列表不需要App用户授权，也就是在App用户无感知下获取设备的Wifi列表信息，使用时请正当使用。

列表2：
>* 1、向 Apple 申请开发 Network Extension 权限
>* 2、申请包含 Network Extension 的描述文件

列表3：
>* SSID：Wifi 名称 
>* BSSID：站点的 MAC 地址
>* signalStrength： Wifi信号强度，该值在0.0-1.0之间  


### 图片环境
图片1：
![](/images/posts/Wifilist/PastedGraphic.png)

图片2：
<img src="/images/posts/Wifilist/WLAN.png" height="360" width="200"> 

图片3：
<div align="center">
	<img src="/images/posts/tfimg/logo.jpg" height="300" width="500">  
</div> 

### 链接环境

[https://developer.apple.com/contact/network-extension/](https://developer.apple.com/contact/network-extension/)


<br>
转载请注明：[潘柏信的博客](http://baixin) » [Wifi 定位原理及 iOS Wifi 列表获取](http://baixin.io/2017/01/iOS_Wifilist/) 