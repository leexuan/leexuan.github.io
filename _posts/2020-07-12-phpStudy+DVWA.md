---
layout: post
title: 利用phpStudy搭建DVWA漏洞测试环境
date: 2020-07-12 
tag: 网络安全
typora-root-url: ..
---

本文讲述如何利用**phpStudy**配合**DVWA**搭建漏洞测试环境

### phpStudy简介

phpStudy是一个PHP调试环境的程序集成包。该程序包集成最新的Apache+PHP+MySQL+phpMyAdmin+ZendOptimizer，一次性安装，无须配置即可使用，是非常方便、好用的PHP调试环境。该程序不仅包括PHP调试环境，还包括了开发工具、开发手册等。其中，8.1.0.6版本的主界面如下：

<img src="/images/posts/2020-07-12-phpStudy+DVWA.assets/image-20200712211940890.png" alt="image-20200712211940890" style="zoom:80%;" />



### DVWA简介

DVWA（Damn Vulnerable Web App）是一个基于PHP/MySql搭建的Web应用程序，旨在为安全专业人员测试自己的专业技能和工具提供合法的 环境，帮助Web开发者更好的理解Web应用安全防范的过程。DVWA一共包含Bruce Force、Command Injection、CSRF等安全测试模块。官方下载地址：[http://www.dvwa.co.uk/](http://www.dvwa.co.uk/)。其主界面如图：

<img src="/images/posts/2020-07-12-phpStudy+DVWA.assets/image-20200712212413737.png" alt="image-20200712212413737" style="zoom:80%;" />



### phpStudy下载安装

下载地址[https://www.xp.cn/](https://www.xp.cn/)。

下载Windows版本phpStudy工具，解压并运行*phpstudy_x64_8.1.0.6.exe*可执行文件。安装完毕之后，会在磁盘上创建phpstudy_pro文件目录：

![image-20200712213141180](/images/posts/2020-07-12-phpStudy+DVWA.assets/image-20200712213141180.png)

运行**phpstudy_pro**启动文件，即可运行phpStudy，通过打开各种套件，即可模拟各类环境。比如开启Apache、MySQL套件，即可模拟Apache和MySQL环境。

<img src="/images/posts/2020-07-12-phpStudy+DVWA.assets/image-20200712211940890.png" alt="image-20200712211940890" style="zoom:80%;" />

在**数据库**导航栏中，记录了数据库的参数信息。

![image-20200712213722676](/images/posts/2020-07-12-phpStudy+DVWA.assets/image-20200712213722676.png)

通过url访问：http://localhost:0/，出现如下界面

![image-20200712214022426](/images/posts/2020-07-12-phpStudy+DVWA.assets/image-20200712214022426.png)

访问url中端口为0，是因为phpStudy系统设置中端口默认为0。





### DVWA下载与安装

下载地址：[http://www.dvwa.co.uk/](http://www.dvwa.co.uk/)

github项目：[https://github.com/ethicalhack3r/DVWA](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Fethicalhack3r%2FDVWA)

![img](https://upload-images.jianshu.io/upload_images/4866277-5d6e2c5d3408702f.png?imageMogr2/auto-orient/strip|imageView2/2/w/982/format/webp)

下载后从压缩包`DVWA-mater.zip`解压出的文件夹名字是`DVWA-master`，为了方便url输入访问，可以把此名字修改为`dvwa`，然后把它存放到phpStudy的网站目录之下：

![image-20200712214222473](/images/posts/2020-07-12-phpStudy+DVWA.assets/image-20200712214222473.png)

通过url链接 [http://localhost:0/dvwa/](https://links.jianshu.com/go?to=http%3A%2F%2Flocalhost%3A801%2Fdvwa%2F) 测试访问dvwa站点，发现系统出现异常提示信息**“DVWA System error - config file not found. Copy config/config.inc.php.dist to config/config.inc.php and configure to your environment.”**

![image-20200712214430072](/images/posts/2020-07-12-phpStudy+DVWA.assets/image-20200712214430072.png)

修改：把`config.inc.php.dist`文件的后缀`.dist`去掉，就变成`config.inc.php`文件。再次访问： [http://localhost:0/dvwa/](https://links.jianshu.com/go?to=http%3A%2F%2Flocalhost%3A801%2Fdvwa%2F)，

<img src="/images/posts/2020-07-12-phpStudy+DVWA.assets/image-20200712214834161.png" alt="image-20200712214834161" style="zoom:80%;" />

这里记录了初始的DVWA登录用户名和密码：admin/password。点击：`Create/Reset Database`，出现如下错误：

<img src="/images/posts/2020-07-12-phpStudy+DVWA.assets/image-20200712215022409.png" alt="image-20200712215022409" style="zoom:80%;" />

分析：是MySQL服务器连接不上。检查`config.inc.php`配置文件配置是否正确。

<img src="/images/posts/2020-07-12-phpStudy+DVWA.assets/image-20200712215235976.png" alt="image-20200712215235976" style="zoom:80%;" />

配置文件`config.inc.php`中MySQL的用户名和密码都需要与上述安装phpStudy时所设置的Mysql账户密码不一致。这里修改`config.inc.php`配置文件中MySQL用户名和密码都为`root`，具体根据每个人不同设置的情况进行修改。

保存修改之后，再次刷新点击`Create/Reset Database`，出现如下界面：

<img src="https://upload-images.jianshu.io/upload_images/4866277-280ff87c021df3e1.png?imageMogr2/auto-orient/strip|imageView2/2/w/378/format/webp" alt="img" style="zoom:80%;" />

系统提示users表和guestbook表已经创建ok，数据导入ok，即DVWA环境安装成功。然后会自动跳转到DVWA的登录界面：

<img src="/images/posts/2020-07-12-phpStudy+DVWA.assets/image-20200712215638879.png" alt="image-20200712215638879" style="zoom:80%;" />

### 访问DVWA

此时，需要从安装DVWA的页面上所提示的账户密码（admin // password）用来登录DVWA。登录成功界面：

![image-20200712215959197](/images/posts/2020-07-12-phpStudy+DVWA.assets/image-20200712215959197.png)

左侧导航栏上：`Brute Force` ~ `JavaScript` 列出了测试用的**Web**安全漏洞类型。通过`DVWA Security`按钮可设置（Impossible、High、Medium、Low）漏洞安全等级进行测试。