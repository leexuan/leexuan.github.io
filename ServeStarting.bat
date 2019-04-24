:: 关闭echo回显
@echo off

rem Blog 路径定义
set BlogPath=D:\leexuan.github.io

rem 当前路径
rem echo %cd%

rem 切换到blog所在路径
cd %BlogPath%

rem 执行当前行
bundle exec jekyll serve
echo %0
