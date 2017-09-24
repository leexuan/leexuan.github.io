---
layout: post
title: Git常见问题汇总
date: 2015-03-03 
tag: 工具使用
---

### A计算机上修改未push，B计算机上修改后push：A在进行pull时的冲突处理
一般的错误输出：

```
error: Your local changes to the following files would be overwritten by merge: protected/config/main.php. Please, commit your changes or stash them before you can merge.
```

解决方法：
* 1 保留A、B需改:
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




