---
layout: post
title: jekyll & github 博客搭建之 jekyll 安装
date: 2016-10-14 
tags: 工具使用   
---

关于 jekyll & github 搭建个人博客，网上有很多教程，这里不多说明，例如[jekyll+github搭建个人博客](http://www.cnblogs.com/yehui-mmd/p/6286271.html)和[Windows安装Jekll](http://www.bijishequ.com/detail/429702)。这里主要介绍一下 jekyll 安装过程中可能的问题，以及不同版本ruby下，jekyll的运行问题。

### Ruby安装
Windows下官网下载 [Ruby](https://rubyinstaller.org/downloads/)，直接安装。安装过程中会出现一下界面：

![](/images/posts/JekyllGithub_20161020/Ruby-installation.png)

此窗口用来安装 MSYS2 的，安装过程出现“1, 2, 3”选项，直接选 3 进行安装，其他选项不用管。

安装完毕，查看 ruby 和 gem 安装的版本情况，在命令提示符中输入：
```
ruby -v
```
和
```
gem -v
```

### Jekyll 安装
利用 RubyInstaller 自带的 gem 安装 jekyll，在命令提示符中输入：
```
gem install jekyll
```
所有的 jekyll 的 gem 依赖包都会被自动安装。

### bundler 安装
在命令提示符中输入：
```
gem install bundler
```
到此为止，jekyll 基本安装完毕。

### 创建自己的第一个博客
命题提示符中将目录切换到想创建目录的环境，然后利用 jekyll 创建：
```
cd d:
jekyll new blog //创建名为 blog 的博客
```
然后，进入 blog 目录，输入：
```
jekyll serve  //开启服务器，可以按 Ctrl+c 停止
```
注意：jekyll服务器的默认端口是4000，所以浏览器输入：http://localhost:4000 就可以看到生成的博客页面，如下：

![](/images/posts/JekyllGithub_20161020/BlogTemplate.png)

至此，可以根据个人喜好，编辑个人博客了。

### Ruby 版本对模拟本地博客环境的影响
利用不同版本的 Ruby 搭建了的 Jekyll 模拟本地环境，当用于模拟同一套博客代码时，可能出现一些问题：
我在以前的一台电脑上采用的稍低版本（具体版本不记得了）的 Ruby 搭建该博客环境，后提交 github。由于需要，在另一台计算机上搭建同样的环境，由于此次搭建仍然采用最新的 Ruby (与之前的版本不一样)，但是在此环境下，模拟从 github 上 clone下的博客代码，运行：
```
jekyll serve
```
出现如下图所示错误：

![](/images/posts/JekyllGithub_20161020/ProblemDuetoVersion.png)
其解决方法如下：
命令行输入以下代码：
```
bundle --full-index
```
如下图所示：
![](/images/posts/JekyllGithub_20161020/Step1.png)

再次运行
```
jekyll serve
```
出现以下：
![](/images/posts/JekyllGithub_20161020/Step2.png)

然后，依据提示，输入：
```
bundle exec jekyll serve
```
输出如下所示：
![](/images/posts/JekyllGithub_20161020/Step3.png)
可以看到，本地模拟环境成功。

对于不同版本的 Ruby 搭建的 jekyll & Github 博客环境 时，当需要模拟本地的博客环境时，需要利用下列命令：
```
bundle exec jekyll serve
```

参考链接：\\
[Is there a fix for the “Could not find *gem* in any of the sources” error that doesn't involve deleting Gemfile.lock?](https://stackoverflow.com/questions/11885398/is-there-a-fix-for-the-could-not-find-gem-in-any-of-the-sources-error-that-d)\\
[You have already activated X, but your Gemfile requires Y](https://stackoverflow.com/questions/6317980/you-have-already-activated-x-but-your-gemfile-requires-y)。

