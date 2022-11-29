# tjuthesis

天津大学学位论文 LaTeX 模板。依据《天津大学关于博士、硕士学位论文统一格式的规定（2021年修订）》编写。

## Introduction

目前 GitHub 上可见的天津大学学位论文模板，例如 [tjuthesis_master_2016](https://github.com/jiangqideng/tjuthesis_master_2016)、[TJUThesis_master_2021](https://github.com/a171232886/TJUThesis_master_2021)、[TJUThesisLatexTemplate](https://github.com/twtstudio/TJUThesisLatexTemplate) 等，其核心内容都是基于项目 [tjuthesis](https://code.google.com/archive/p/tjuthesis/)。这个项目诞生于2012年，很多远古代码在十年后的今天可能有了更简单的实现。有这个想法后，我花了两天时间对照《天津大学关于博士、硕士学位论文统一格式的规定（2021年修订）》重写了模板，而样式文件的代码量只有出乎意料的一百多行（包含空行和注释）。个人觉得这个新模板的可读性和易用性有很大提升，故放在 GitHub 上抛砖引玉。

## Contributions

与旧模板相比，本模板的改进包括：
- 编写了 `.sty` 文件，可用 `\usepackage` 命令作为宏包导入。相比于旧模板中`\include` `.tex` 的方式，使用`.sty` 文件的优势可参见 stackexchange 上的[这个问题](https://tex.stackexchange.com/questions/91167/why-use-sty-files)。
- 删除了重复造的轮子。例如，旧模板中设置字号的命令 `\yihao`、`\erhao`、... 、`\wuhao` 等现已删除，新模板采用了`ctex` 提供的标准命令`\zihao`。设置各级标题样式的命令也通过 `ctex` 的 `\ctexset` 完成。
- 旧模板使用的 `.bst` 文件不兼容 `natbib` 宏包，无法使用很多常见功能（如 `\citet`）。因此，新模板换用了 [gbt7714-bibtex-style](https://github.com/zepinglee/gbt7714-bibtex-style) 项目提供的 `.bst` 文件。
- 简单问题简单化。扉页、声明、摘要等部分样式繁琐，但只出现一次。旧模板写了大量代码用于封装和抽象，把问题搞复杂了。新模板直接在实例中实现，不定义变量不搞封装，使用者按需修改也更加容易。
- 对文件树进行了简化，只建立 `figures/` 和 `contents/` 两个子文件夹，分别存放图片和 `.tex` 子文件，其余文件一律放在根目录。

## How to use

简单来说记得用 `xelatex` 编译就好了。至于其他细节，网上可以找到的教程比我能写出的好一万倍。本模板默认天津大学硕/博学位申请人具备自主解决此问题的能力。

## Known Issues

- Windows 下加粗宋体会被直接修改为黑体，影响范围包括扉页的中文题目、中文摘要的「摘要」二字等。这应该是 `ctex` 为了解决没有粗体的中易宋体而进行的设置。目前看来比较简单的解决方法是在 `\documentclass` 的参数中添加 `fontset=fandol` 或  `fontset=adobe` 参数。这种做法的本质上是换一套字库。
- 模板里面独创性声明中「天津大学」的字体为`楷体_gb2312`，但本模板使用了 `楷体` 进行代替。本人坚决抵制 `楷体_gb2312` 这种丑陋的官僚主义产物，而且反正也没人看得出来。
- 目前只实现了博士论文的模板。

