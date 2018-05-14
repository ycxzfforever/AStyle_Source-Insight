# 一、破解Source Insight4.0	
## 1.1 SI4.0破解补丁
[source insight 4.0 破解补丁](https://bbs.pediy.com/thread-215669.htm)
## 1.2 破解方法：
	1. 安装原版软件：Source Insight Version 4.0.0093
	2. 替换原主程序：sourceinsight4.exe
	3. 导入授权文件：si4.pediy.lic
## 1.3 其他破解参考
[三步完成Source Insight 4.0 破解安装](https://blog.csdn.net/biubiuibiu/article/details/78044232)
# 二、Source Insight 4.0 一些设置
## 2.1 SI-4.0文件类型设置
[Source Insight 4.0 文件类型、编码格式、tab转空格、tab键自动补全设置](https://www.cnblogs.com/bluestorm/p/6864540.html)
## 2.2 设置参考
[source insight辅助工具+配置及快捷键](https://blog.csdn.net/wustzjf/article/details/39379985)
## 2.3 Source Insight使用Artistic Style时参数设置
`C:\AStyle\bin\AStyle.exe --style=ansi -f -p -D -s4 -S -N -L -m0 -M40 -U --convert-tabs --suffix=.pre %f`<br>
[Artistic Style参数说明1](https://www.cnblogs.com/maodouzi/archive/2010/09/26/1835356.html)<br>
[Artistic Style参数说明2](https://blog.csdn.net/fengbingchun/article/details/46828821)<br>
[Artistic Style参数说明3](https://github.com/ycxzfforever/AStyle_Source-Insight/blob/master/Astyle.bat)<br>
# 三、解决Source Insight中文乱码
[source insight 4 中文乱码问题](https://blog.csdn.net/xiaohuima_dong/article/details/73224474)
# 四、Source Insight 4.0注释
## 4.1 将下列代码加入base项目中的utils.em中，然后设置菜单和快捷键
```c
//注释选择的字符串 Ctrl+Alt+C
macro ChoseStr()
{

    hbuf = GetCurrentBuf()

    ln = GetBufLnCur(hbuf)

    str = GetBufSelText(hbuf)

    str = cat("/*",str)

    str = cat(str,"*/")

    SetBufSelText (hbuf, str)

}

//注释选中的行 Ctrl+Alt+S
macro SingleLine()
{

    hbuf = GetCurrentBuf()

    ln = GetBufLnCur(hbuf)

	str = GetBufLine (hbuf, ln)

    str = cat("/*",str)

    str = cat(str,"*/")

    PutBufLine (hbuf, ln, str)

}

//多行注释 Ctrl+Alt+m
macro MultiLineComment()
{
    hwnd = GetCurrentWnd()
    selection = GetWndSel(hwnd)
    LnFirst =GetWndSelLnFirst(hwnd)      //取首行行号
    LnLast =GetWndSelLnLast(hwnd)      //取末行行号
    hbuf = GetCurrentBuf()
    if(GetBufLine(hbuf, 0) =="//magic-number:tph85666031")
	{
        stop
    }
    Ln = Lnfirst
    buf = GetBufLine(hbuf, Ln)
    len = strlen(buf)
    while(Ln <= Lnlast) 
	{
        buf = GetBufLine(hbuf, Ln)  //取Ln对应的行
        if(buf ==""){                   //跳过空行
            Ln = Ln + 1
            continue
    }

	if(StrMid(buf, 0, 1) == "/"){       //需要取消注释,防止只有单字符的行
		if(StrMid(buf, 1, 2) == "/"){
			PutBufLine(hbuf, Ln, StrMid(buf, 2, Strlen(buf)))
		}

	}

	if(StrMid(buf,0,1) !="/"){          //需要添加注释
		PutBufLine(hbuf, Ln, Cat("//", buf))
	}
	Ln = Ln + 1
    }
    SetWndSel(hwnd, selection)
}

//使用if 0注释选中的代码 Ctrl+Alt+0
macro If0endif_MacroComment()

{

    hwnd=GetCurrentWnd()

    sel=GetWndSel(hwnd)

    lnFirst=GetWndSelLnFirst(hwnd)

    lnLast=GetWndSelLnLast(hwnd)

    hbuf=GetCurrentBuf()

    if (LnFirst == 0) {

            szIfStart = ""

    } else {

            szIfStart = GetBufLine(hbuf, LnFirst-1)
    }

    szIfEnd = GetBufLine(hbuf, lnLast+1)

    if (szIfStart == "#if 0" && szIfEnd =="#endif") {

            DelBufLine(hbuf, lnLast+1)

            DelBufLine(hbuf, lnFirst-1)

            sel.lnFirst = sel.lnFirst – 1

            sel.lnLast = sel.lnLast – 1

    } else {

            InsBufLine(hbuf, lnFirst, "#if 0")

            InsBufLine(hbuf, lnLast+2, "#endif")

            sel.lnFirst = sel.lnFirst + 1

            sel.lnLast = sel.lnLast + 1

    }
    SetWndSel( hwnd, sel )
}
```
