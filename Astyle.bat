::-f 在两行不相关的代码之间插入空行
::-p 在操作符两边插入空格，如=、+、-等
::-P 在括号两边插入空格。另，-d只在括号外面插入空格，-D只在里面插入
::-U 移除括号两边不必要的空格
::-N 被namespace包含的block，一个tab的缩进
::-n 格式化后不对源文件做备份
::-C 类中public,pretected,private关键字，一个tab的缩进
::-S switch中case关键字，一个tab的缩进
::-K switch中case关键字，无缩进
::-w 格式化多行的宏定义
::-l 处理定义和函数中的大括号
::-a 大括号保留在上一行
::-x 删除多余空行（3.x版本中没有）
@echo off
echo 当前批处理全路径：%~f0
echo 请按任意键键继续格式化此路径下所有代码
pause
for /R ./ %%f in (*.c;*.h) do C:\AStyle\bin\AStyle.exe --style=ansi -f -p -D -U -N -S -n "%%f" 
pause