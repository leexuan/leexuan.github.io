---
layout: post
title: Git常见问题汇总
date: 2014-04-03 
tag: 工具使用
---

### A计算机上修改未push，B计算机上修改后push：A再进行pull时的冲突处理
一般的错误输出：

```
error: Your local changes to the following files would be overwritten by merge: protected/config/main.php.
Please, commit your changes or stash them before you can merge.
```

解决方法：
* 1 均保留A、B修改
```
git stash
git pull
git stash pop
```

* 2 代码库中文件完全覆盖本地(A)
```
git reset --hard
git pull
```

[参考链接](http://blog.csdn.net/iefreer/article/details/7679631)

### 多个秘钥管理，同时支持 github 或 bitbucket 等多个账号
关于如何注册 github 或者 bitbucket 账号以及实现单一的支持这里就不在说明；这里仅在系统中已能够支持某一个账号的前提下，讨论如何添加另一个账号的支持。

1. git 客户端切换到 .ssh 目录下，利用如下指令创建秘钥：
```
ssh-keygen -t rsa -C "youremail@email.com"
```
2. 将 id_rsa_xxx 中内容添加到 github 或者 bitbucket 后台
3. 在 .ssh 目录下创建 config 文件，添加一个 Host ，内容如下：
* 1 针对 bitbucket 账号
```
Host bitbucket
HostName bitbucket.org
User git
IdentityFile ~/.ssh/id_rsa_bitbucket.pub    #创建的id_rsa文件名
```
* 2 针对 github 账号
```
Host github
HostName github.com
User git
IdentityFile ~/.ssh/id_rsa_github.pub    #创建的id_rsa文件名
```
4. 使用 ssh-add 添加新的 ssh
```
ssh-add id_rsa_github
```
此处已是在当前路径下操作，如果不在当前路径下，则需要给出完整路径，如

```
ssh-add C:/Users/Administrator/.ssh/id_rsa_github
```
如果出现提示：Could not open a connection to your authentication agent. 则先执行：
```
eval `ssh-agent`
```

注意：上述操作是在 git 客户端执行。在 cmd 窗口执行， eval 无法识别，原因目前尚未深入研究。


