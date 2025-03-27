# 天津大学硕博学位论文 $\LaTeX$ 模板

天津大学硕博学位论文 $\LaTeX$ 模板，依据《天津大学关于博士、硕士学位论文统一格式的规定（2021年修订）》（以下简称《规定》）编写，基于本模板排版的博士论文已经成功提交图书馆存档。

本模板功能的实现主要基于以下宏包：`ctex`、`geometry`、`fancyhdr`、`titletoc`、`caption`、`enumitem` 等。

参考文献样式文件来自于 [gbt7714-bibtex-style](https://github.com/zepinglee/gbt7714-bibtex-style) 的 `gbt7714-numerical.bst`。当然，既然本模板兼容 `natbib`，使用者也可以按需选择其他参考文献样式。

## 变动日志

2025-03（感谢 @[horizon86](https://github.com/horizon86)）:
- 将样式文件（sty）更改为类文件（cls）。[#4](https://github.com/haimingz/tjuthesis/pull/4)
- 修正了目录中参考文献的页码和跳转问题。 [#3](https://github.com/haimingz/tjuthesis/pull/3)
- 将“磅”值对应的单位从pt修正为bp。 [#2](https://github.com/haimingz/tjuthesis/pull/2)

## 文件说明

文件结构如下：

```txt
tjuthesis
├─ contents                  <--- 论文各部分 
│  ├─ abstract.tex           <--- 摘要       
│  ├─ acknowledgements.tex   <--- 致谢
│  ├─ appendix.tex           <--- 附录        
│  ├─ declaration.tex        <--- 声明  
│  ├─ demo.tex               <--- 示例           
│  ├─ publications.tex       <--- 发表论文情况说明  
│  └─ titlepage.tex          <--- 扉页       
├─ figures                   <--- 图片文件夹
│  └─ tju_logo.png           <--- 示例图片  
├─ gb2312kai.ttf             <--- 国标 2312 楷体字体
├─ gbt7714.bst               <--- 参考文献样式文件
├─ main.pdf                  <--- 生成的 pdf 文档               
├─ main.tex                  <--- 主文件（编译的入口）
├─ README.md                 <--- 说明文档（本文件）
├─ references.bib            <--- 参考文献数据库
└─ tjuthesis.cls             <--- 天津大学论文类文件
```

其中，`main.tex` 是主文件，根目录下其他文件为必要的样式、字体、参考文献等文件。由于 LaTeX 编译长文档效率较低，因此这个示例中将论文各部分拆分为独立的子文档，保存在 `contents` 文件夹下，在撰写过程中主文件只导入部分子文件，以提高编译效率。相应地，图片保存在 `figures` 文件夹下，如果图片较多，可以按需在 `figures` 文件夹下再设文件夹。当然，此示例只提供一种可行的文件管理方案，使用者不必拘泥。

## 使用说明

### 扉页


本着奥卡姆剃刀原则，不对论文扉页做过度封装。使用者可根据实际情况，直接对照《规定》附录B 修改 `titlepage.tex` 中的“基本信息表”和“答辩委员会名单表”。

### 页眉

根据《规定》，硕博论文的格式基本相同，只有偶数页的页眉略有不同，分别为“天津大学博士学位论文”和 “天津大学硕士学位论文”。本模板提供对应选项，使用者应指定 `master` 或 `phd` 选项，即：

```latex
\documentclass[phd]{tjustyle}
```
或

```latex
\documentclass[master]{tjustyle}
```

### 页边距

《规定》中「3. 论文印刷装订格式」一节要求：
> 学位论文应由电子版直接印刷，其内容和格式保持与提交的电子版严格一致……页边距为：上：27.5mm；下25.4mm；左：35.7mm；右：27.7mm……学位论文要求双面打印……

但是这个规定是不合理的。首先，对于双面打印的书籍，应该在胶装侧预留更大页边距，但奇偶页面的胶装侧是相反的。因此，正确的格式要求应定义内侧、外侧页边距。其次，电子版论文如果严格保持与印刷版一致的页边距设置，在滚动浏览时，奇偶页的正文左右参差不齐，影响阅读。

因此，本模板提供了 `print` 选项，在开启时，生成用于打印的pdf，采用打印版页边距设置，即：内侧 35.7mm、外侧 27.7mm。不开启 `print` 选项时，生成电子版pdf，左右页边距都为 31.7mm。示例：

```latex
\documentclass[phd, print]{tjustyle}
```
