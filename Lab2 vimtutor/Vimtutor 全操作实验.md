## Vimtutor 全操作实验

#### 一.实验环境配置

```
sudo apt-get update
# 安装asciinema
sudo apt install asciinema
# 将本地账户和在线账户关联
asciinema auth
# 开始录像
asciinema rec
```

#### 二.操作实验录像

[Lesson-1 vimtutor](https://asciinema.org/a/xUrIyG2Fg3G7Pf3g7z08jkRVt)

[Lesson-2 vimtutor](https://asciinema.org/a/c1fFo6DXXsQXjxQ3SepPgJ2KY)

[Lesson-3 vimtutor](https://asciinema.org/a/YuuwLWJu74SeqqbKSNUAS9Z8H)

[Lesson-4 vimtutor](https://asciinema.org/a/yc2ITz6lEj6uTP1D3N0fyIcPC)

[Lesson-5 vimtutor](https://asciinema.org/a/xUrIyG2Fg3G7Pf3g7z08jkRVt)

[Lesson-6 vimtutor](https://asciinema.org/a/qAehoyaB2q9r5eKUyIbCCtaqYt)

[Lesson-7 vimtutor](https://asciinema.org/a/r8f6UIYk3twv8BlwfQFU5GiSN)

#### 四.自查清单

- 你了解vim有哪几种工作模式？

  命令模式(command)

  插入模式(insert)

  可视模式(visual)

  正常模式(normal)

- Normal模式下，从当前行开始，一次向下移动光标10行的操作方法？如何快速移动到文件开始行和结束行？如何快速跳转到文件中的第N行？

  一次向下移动10行：```10j```

  快速移动带文件开始：```gg```

  快速移动到文件末尾：```G```

  快速跳转到文件中第N行：```N G```

- Normal模式下，如何删除单个字符、单个单词、从当前光标位置一直删除到行尾、单行、当前行开始向下数N行？

  删除单个字符：```x```

  删除单个单词：```dw```

  从光标删除到行尾：```d$```

  删除单行：```dd```

  删除向下N行：```Ndd```

- 如何在vim中快速插入N个空行？如何在vim中快速输入80个-？

  通过切换进出模式快速重复插入

  快速插入N个空行：```esc N o esc```

  快速输入80个-：```esc 80 i - esc```

- 如何撤销最近一次编辑操作？如何重做最近一次被撤销的操作？

  撤销最近一次编辑操作：```u```

  重做被撤销的操作：```Ctrl+R```

- vim中如何实现剪切粘贴单个字符？单个单词？单行？如何实现相似的复制粘贴操作呢？

  剪接粘贴单个字符：```x p```

  剪接粘贴单个单词：```dw p```

  剪切粘贴单行：```dd  p```

  相似内容的复制粘贴：```v选中要进行操作的部分y复制p粘贴```

- 为了编辑一段文本你能想到哪几种操作方式（按键序列）？

  ```vim filename```

  ```i/a 插入模式```

  ```编辑内容···```

  ```:wq!保存退出 :q!直接退出```

- 查看当前正在编辑的文件名的方法？查看当前光标所在行的行号的方法？

  指令皆为：```Ctrl+G```

- 在文件中进行关键词搜索你会哪些方法？如何设置忽略大小写的情况下进行匹配搜索？如何将匹配的搜索结果进行高亮显示？如何对匹配到的关键词进行批量替换？

  关键字搜索：```/keyword 向后搜索 ?keyword向前搜索```

  忽略大小写：```:set ic```

  高亮搜索结果：```:set hls is #hls是对所有搜索结果进行高亮，is则是对当前输入内容的第一个匹配信息进行高亮，输入enter后消失```

  设置批量替换：```：s/old/new/g```

- 在文件中最近编辑过的位置来回快速跳转的方法？

  ```Ctrl+O/Ctrl+I```

- 如何把光标定位到各种括号的匹配项？例如：找到(, [, or {对应匹配的),], or }

  将光标悬停在想要匹配的符号上，使用```%```则光标跳转到匹配符合上

- 在不退出vim的情况下执行一个外部程序的方法？

  ```:! command```

- 如何使用vim的内置帮助系统来查询一个内置默认快捷键的使用方法？如何在两个不同的分屏窗口中移动光标？

  利用帮助查询内置快捷键：```:help +快捷键```

  在不同分屏窗口中移动光标：```Ctrl+w```