# 天津大学硕博学位论文 LaTeX 模板

天津大学硕博学位论文 $\LaTeX$ 模板（极简易用版），依据《天津大学关于博士、硕士学位论文统一格式的规定（2021年修订）》（以下简称《规定》）编写。基于本模板排版的博士论文已经成功提交图书馆存档。

本模板功能的实现主要基于以下宏包：`ctex`、`geometry`、`fancyhdr`、`titletoc`、`caption`、`enumitem` 、`biblatex`等。

欢迎试用，提issue，pr🤝

## 近期变动日志

2026-05-10：
- 严格遵照《规定》，将参考文献样式从 GB/T 7714-2015 切换回 GB/T 7714-2005，虽然后者已经停用。[#17](https://github.com/haimingz/tjuthesis/issues/17)

2026-05-05:

- 修正了章节标题前后间距过大的问题。[#16](https://github.com/haimingz/tjuthesis/issues/16)

2026-01-29:

- 弃用 cleveref：非必须且有严重的兼容性问题。

2026-01 (感谢 @[Bob-Eric](https://github.com/Bob-Eric)):

- 按照最新要求在论文扉页添加了天大logo。[#7](https://github.com/haimingz/tjuthesis/pull/7)
- 文献管理从natbib切换至biblatex。[#8](https://github.com/haimingz/tjuthesis/pull/8)
- 使用cleveref更方便地交叉引用。[#8](https://github.com/haimingz/tjuthesis/pull/8)
- 修正了若干字体字号、表格宽度、参考文献格式的问题。[#7](https://github.com/haimingz/tjuthesis/pull/7) [#8](https://github.com/haimingz/tjuthesis/pull/8)
- 添加了一个用于vscode的setting文件。
- 更新了示例文件。


## 文件说明

文件结构如下：

```txt
tjuthesis
├─ .vscode                   
│  ├─ settings.json          <--- vscode 配置文件，自动生效 
├─ contents                  <--- 论文各部分 
│  ├─ abstract.tex           <--- 摘要       
│  ├─ acknowledgements.tex   <--- 致谢
│  ├─ appendix.tex           <--- 附录        
│  ├─ declaration.tex        <--- 声明  
│  ├─ demo.tex               <--- 示例           
│  ├─ publications.tex       <--- 发表论文情况说明  
│  └─ titlepage.tex          <--- 扉页       
├─ gb2312kai.ttf             <--- GB2312 楷体字体（版权声明页需要）
├─ main.pdf                  <--- 生成的 pdf 文档               
├─ main.tex                  <--- 主文件（编译的入口）
├─ README.md                 <--- 说明文档（本文件）
├─ references.bib            <--- 参考文献数据库
├─ tju_logo.png              <--- 封面页天大标志图片  
└─ tjuthesis.cls             <--- 天津大学论文类文件
```

其中，`main.tex` 是主文件，根目录下其他文件为必要的样式、字体、参考文献等文件。由于 LaTeX 编译长文档效率较低，因此这个示例中将论文各部分拆分为独立的子文档，保存在 `contents` 文件夹下，在撰写过程中主文件只导入部分子文件，以提高编译效率。当然，使用者不必拘泥于此。实际使用过程中，**建议正文各章建立独立文件夹，管理`.tex`代码和图片**。

## 使用说明

### 扉页

本着奥卡姆剃刀原则，不对论文扉页做过度封装。使用者可根据实际情况，直接对照《规定》附录B 修改 `titlepage.tex` 中的“基本信息表”和“答辩委员会名单表”。

### 页眉

根据《规定》，硕博论文的格式基本相同，只有偶数页的页眉略有不同，分别为“天津大学博士学位论文”和 “天津大学硕士学位论文”。本模板提供对应选项，使用者应指定 `master` 或 `phd` 选项，即：

```latex
\documentclass[phd]{tjuthesis}
```
或

```latex
\documentclass[master]{tjuthesis}
```

### 页边距

《规定》中「3. 论文印刷装订格式」一节要求：
> 学位论文应由电子版直接印刷，其内容和格式保持与提交的电子版严格一致……页边距为：上：27.5mm；下25.4mm；左：35.7mm；右：27.7mm……学位论文要求双面打印……

但是这个规定是不合理的。首先，对于双面打印的书籍，应该在胶装侧预留更大页边距，但奇偶页面的胶装侧是相反的。因此，正确的格式要求应定义内侧、外侧页边距。其次，电子版论文如果严格保持与印刷版一致的页边距设置，在滚动浏览时，奇偶页的正文左右参差不齐，影响阅读。

因此，本模板提供了 `print` 选项，在开启时，生成用于打印的pdf，采用打印版页边距设置，即：内侧 35.7mm、外侧 27.7mm。不开启 `print` 选项时，生成电子版pdf，左右页边距都为 31.7mm。示例：

```latex
\documentclass[phd, print]{tjuthesis}
```
### 编辑、编译

为了避免各种兼容性的麻烦，推荐装完整版的 texlive 或 mactex。除了 LaTeX 本体外，还需安装以下东西：

- 为了使用自动编译工具 latexmk，Windows 平台需安装 [perl](https://www.perl.org/get.html)。MacOS 和 Linux 通常自带无需安装。
- 推荐使用 vscode 作为编辑器 + 拓展 latex-workshop。

在 vscode + latex-workshop 的环境中，需要进行一系列设置。本模板提供了`.vscode/settings.json`文件，包含了所需的基础设置。

- 编译链、编译工具（默认使用 latexmk + xelatex）。
- 需要清理的“中间文件”列表。
- 设置 vscode 的文件列表中不显示“中间文件”。
- 设置 vscode 编辑器行高为1.8 （更适合文档编写）。

该设置文件只在当前目录下生效，会覆盖 vscode 的全局设置。也就是说，如果你懒得折腾，应该无需手动改设置就能用了。

### 跨平台字体问题

- 模板直接使用 `Times New Roman`、 `SimSun`（中易宋体） ，Linux/macOS 平台需手动安装。
- `gb2312kai.ttf` 扉页使用，已随模板提供，无需安装。
- 其余字体未明确指定，由 `ctex` 按平台自动选择。不同平台这些字体的差别很小，而且模版没有明确要求，建议不必过于强迫症。但如果需要严格复现 Windows 字体效果，得设置 `ctex` 的 `fontset=windows`，并安装 `SimSun`、`SimHei`、`KaiTi` 和 `FangSong`，特此说明。

### 参考文献作者姓名格式设置

模板默认使用 `gbnamefmt=quanpin`：姓名的首字母大写、名不缩写。GB/T 7714-2005 要求用汉语拼音书写的中国著者姓名不得缩写；由于程序无法区分拼音姓名和英文姓名，默认将所有著者的名均完整写出。详细讨论请参加 [#17](https://github.com/haimingz/tjuthesis/issues/17)。