# 天津大学硕博学位论文 $\LaTeX$ 模板

天津大学硕博学位论文 $\LaTeX$ 模板，依据《天津大学关于博士、硕士学位论文统一格式的规定（2021年修订）》编写。本校硕士与博士学位论文的格式要求基本一致，只有封面和页眉文字稍有不同。当前模板为学术型博士论文模板，其他类型硕博只需简单修改封面与页眉即可使用。

## 使用说明

文件说明

```txt
tjuthesis
├─ contents                 
│  ├─ abstract.tex           <--- 摘要       
│  ├─ acknowledgements.tex   <--- 致谢
│  ├─ appendix.tex           <--- 附录        
│  ├─ declaration.tex        <--- 声明  
│  ├─ demo.tex               <--- 示例           
│  ├─ publications.tex       <--- 发表论文情况说明  
│  └─ titlepage.tex          <--- 扉页       
├─ figures                  
│  └─ tju_logo.png           <--- 示例图片  
├─ gbt7714.bst               <--- 参考文献样式文件
├─ main.pdf                  <--- 生成的 pdf 文档               
├─ main.tex                  <--- 主文件（编译的入口）
├─ README.md                 <--- 说明文档（本文件）
├─ references.bib            <--- 参考文献数据库
└─ tjustyle.sty              <--- 天津大学论文格式文件
```

如需撰写其它类型的硕博论文，只需将 `tjustyle.sty` 中的“天津大学博士学位论文”修改为“天津大学硕士学位论文”，以及在 `titlepage.tex` 中按需修改“基本信息表”和“答辩信息表”。

