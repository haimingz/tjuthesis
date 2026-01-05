%% -------------------------------------------------------------------
%% tjuthesis: LaTeX Template for Tianjin University PhD/Master Thesis
%% Homepage: https://github.com/haimingz/tjuthesis
%% Version: 2025/03/27
%% -------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tjuthesis}

% 页面设置
\LoadClass[openright，twoside, a4paper]{book}% 纸张大小为A4

\newif\if@print
\newif\if@master 
\newif\if@phd 

\DeclareOption{print}{\@printtrue}
\DeclareOption{master}{\@mastertrue}
\DeclareOption{phd}{\@phdtrue}
\ProcessOptions*

% 设置页边距
\RequirePackage{geometry} 

\if@print
\geometry{top=27.5mm, bottom=25.4mm, left=35.7mm, right=27.7mm,} % 在装订侧预留更多边距（生成打印版）
\else
\geometry{top=27.5mm, bottom=25.4mm, left=31.7mm, right=31.7mm,} % 设置奇偶页左右边距相等（生成电子版）
\fi
\geometry{
    headsep=7.5mm, headheight=5mm, % 页眉距边界距离 15 = 27.5 - 7.5 - 5
    footskip=7.9mm, % 页脚距边界距离 17.5 = 25.4 - 7.9
}

% 支持中文
\RequirePackage[heading=true, zihao=-4]{ctex} % heading=true 开启中文章节图表标题，zihao=-4 设置默认字号为小四

% 设置默认英文字体
\setmainfont{Times New Roman} 

% 宋体伪粗体
% \setCJKfamilyfont{zhsong}[AutoFakeBold={2.17}]{SimSun} 

% 宋体
\setCJKfamilyfont{zhsong}[AutoFakeBold = {3.17}]{simsun.ttc}
\renewcommand*{\songti}{\CJKfamily{zhsong}}

% 国标楷体
\setCJKfamilyfont{kaigb}[AutoFakeBold = {3.17}]{gb2312kai.ttf}
\newcommand{\kaigb}{\CJKfamily{kaigb}}  

% 基于ctex包设置各级标题样式
\ctexset{
    contentsname={目 \quad 录}, % 目录的标题 
    secnumdepth=3, % 标题编号深度（3 = subsubsection，即四级标题）
    chapter={ % 一级标题样式
        format={\heiti\zihao{-3}\centering}, % 黑体小三居中
        number=\arabic{chapter}, % 采用阿拉伯数字编号
        beforeskip=30bp, % 段前间距 （规定 30~36 bp 之间）
        afterskip=30bp, % 段后间距 （规定 30~36 bp 之间）
        aftername=~, % 标题编号与标题内容之间键入1个空格。
    }, 
    section={ % 二级标题样式
        format={\heiti\zihao{4}}, % 黑体四号
        beforeskip=20bp, % 段前间距 （规定 18~24 bp 之间）
        afterskip=20bp, % 段后间距 （规定 18~24 bp 之间）
        aftername=~, % 标题编号与标题内容之间键入1个空格。
    },
    subsection={ % 三级标题样式
        format={\heiti\zihao{4}}, % 黑体四号
        beforeskip=12bp, % 段前间距 （规定 12~15 bp 之间）
        afterskip=12bp, % 段后间距 （规定 12~15 bp 之间）
        aftername=~, % 标题编号与标题内容之间键入1个空格。
    }, 
    subsubsection={ % 四级标题样式
        format={\heiti\zihao{-4}}, % 黑体小四
        beforeskip=10bp, % 段前间距 （规定 9~12 bp 之间）
        afterskip=10bp, % 段后间距 （规定 9~12 bp 之间）
        aftername=~, % 标题编号与标题内容之间键入1个空格。
    },
}

% 自定义页眉页脚
\RequirePackage{fancyhdr}
\pagestyle{fancy}% 开启 fancyhdr 页眉页脚样式

% 重新定义默认的 plain 样式
\fancypagestyle{plain}{
    \fancyhf{} % 清除所有页眉页脚重新设置
    \fancyhead[CO]{\songti\zihao{5} \nouppercase{\leftmark}} % 奇数页页眉，宋体五号，\leftmark 代指章标题，\nouppercase 禁止英文字母全大写
    \if@master
        \fancyhead[CE]{\songti\zihao{5} 天津大学硕士学位论文} % 偶数页页眉，宋体五号
    \else 
        \fancyhead[CE]{\songti\zihao{5} 天津大学博士学位论文} % 偶数页页眉，宋体五号
    \fi
    \fancyfoot[C]{\songti\zihao{-5} \thepage} % 页脚，宋体小五号，\thepage 代指页码
    \renewcommand{\headrulewidth}{0.5bp} % 页眉横线粗细
    \renewcommand{\footrulewidth}{0bp} % 页脚横线粗细
}

% 定义一个无页眉的样式
\fancypagestyle{noheader}{
    \fancyhf{} % 清除所有页眉页脚重新设置
    \fancyfoot[C]{\songti\zihao{-5} \thepage} % 页脚，宋体小五号，\thepage 代指页码
    \renewcommand{\headrulewidth}{0bp} % 页脚横线粗细
    \renewcommand{\footrulewidth}{0bp} % 页脚横线粗细
}

% 设置文章各部分的奇偶页、页眉页脚样式、页码格式
\renewcommand\frontmatter{
    \@mainmatterfalse
    \clearpage{\cleardoublepage} % 从奇数页开始
    \pagestyle{noheader} % 使用页眉页脚样式 noheader
    \pagenumbering{Roman} % 大写罗马数字页码（会重置页码）
    % \setlength{\baselineskip}{20bp} % 设置正文行高为 20bp
    \setlength{\baselineskip}{20bp plus 2bp minus 2bp} % 设置弹性行高为 20±2bp （optional）
} 
\renewcommand\mainmatter{
    \@mainmattertrue
    \clearpage{\cleardoublepage} % 从奇数页开始
    \pagestyle{plain} % 使用页眉页脚样式 plain 
    \pagenumbering{arabic} % 使用阿拉伯数字页码（会重置页码）
} 

% 设置目录样式
\addtocontents{toc}{\protect\thispagestyle{noheader}} % 设置目录页的页眉页脚样式为 noheader 
\setcounter{tocdepth}{2} % 设置 tocdepth 目录深度 （2 = subsection，即三级标题）
\RequirePackage{titletoc} % 用于设置目录样式的包
\titlecontents{chapter}
    [0em] % 缩进为 0em = 0 字符
    {\heiti\zihao{-4}}
    {\thecontentslabel~}{}
    {\hspace{.5em}\titlerule*[5bp]{.}\zihao{-4}\contentspage} %
\titlecontents{section}
    [2em] % 缩进为 2em = 4 字符
    {\zihao{-4}}
    {\thecontentslabel~}{}
    {\hspace{.5em}\titlerule*[5bp]{.}\zihao{-4}\contentspage}
\titlecontents{subsection}
    [4em] % 缩进为 4em = 4 字符
    {\zihao{-4}}
    {\thecontentslabel~}{}
    {\hspace{.5em}\titlerule*[5bp]{.}\zihao{-4}\contentspage}

% 设置脚注字号 (10.5 bp = 五号, 13bp 是行高)
\renewcommand\footnotesize{\fontsize{10.5bp}{13bp}\selectfont}

% 设置图表公式编号格式（章编号-图表编号）
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}

% 设置图表题注格式
\RequirePackage{caption}
\captionsetup{labelsep=space} % 设置图表编号与图表题注之间以空格分隔
\captionsetup[figure]{position=below} % 稍微减小图表题注的上下间距（optional）
\captionsetup[table]{position=above, skip=5bp} % 稍微减小图表题注的上下间距（optional）

% 设置列表格式
\RequirePackage[shortlabels]{enumitem} % 用于自定义列表编号样式
\setlist[enumerate]{nosep} % 行高和间距与正文一致
\setlist[itemize]{nosep}  % 行高和间距与正文一致

% 设置正文中参考文献的引用格式
\RequirePackage[numbers,sort&compress,super,square]{natbib} % super = 上标，square = 方括号

% 设置参考文献样式
\let\oldbibliography\bibliography
\renewcommand\bibliography[1]{
    \cleardoublepage % 修正目录中参考文献页码
    \phantomsection % 保证目录能精确跳转到参考文献
    \addcontentsline{toc}{chapter}{参考文献} % 把参考文献添加到目录
    \setlength{\baselineskip}{17bp} % 行高 17bp
    \setlength{\bibsep}{3bp} % 条目之间 3bp 间距
    \oldbibliography{#1}
    \setlength{\baselineskip}{20bp} % 参考文献结束，恢复到默认行高
}

% 其它必要的宏包
\RequirePackage{graphicx} % 用于插入图片
\RequirePackage{booktabs} % 用于绘制三线表的横线
\RequirePackage{amsmath} % 基础数学包
\RequirePackage{amsfonts} % 支持公式中使用特殊字体
\RequirePackage{mathtools} % 基础数学包基础上增加额外命令
\RequirePackage{tabularx} % 用于绘制表格
\RequirePackage{multirow} % 支持在表格中横跨多列
\RequirePackage[hidelinks]{hyperref} % 将交叉引用设置为超链接

% 定义表格列宽的命令
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0bp}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0bp}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0bp}}m{#1}}
