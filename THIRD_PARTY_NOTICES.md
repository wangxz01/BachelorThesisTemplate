# 第三方参考与许可声明

本项目中的**毕业论文正文模板**（`thesis/whu-math-thesis.cls` 及其页面示例）在版式规范与文档结构上参考了：

- [AaronComo/WHU-Bachelor-Thesis-Template](https://github.com/AaronComo/WHU-Bachelor-Thesis-Template)
  — 武汉大学**国家网络安全学院** 2025 届本科毕业论文模板，MIT License，Copyright (c) 2025 AaronComo。
- [whu-thesis](https://github.com/whutug/whu-thesis) — 上述项目的上游模板，Copyright (c) 2019 Fing。

我们沿用其**学校通用版式**（页边距、字号、章节与目录样式，以及「封面—声明—中英文摘要—目录—正文—参考文献—致谢」的结构），
并按**数学与统计学院**的需求重新实现了文档类与全部示例内容，主要改造包括：

- 封面院系/专业预置为数学与统计学院及数学类专业，校徽改为可选文件（未复制参考项目的校徽图片）；
- 章节骨架改为数学论文常用结构：绪论、预备知识、主要结果与证明、数值实验、总结与展望；
- 新增按章编号的定理/定义/引理/推论/命题/例/注/证明环境与公式编号、主要符号表、数学常用宏；
- 新增算法伪代码、三线表误差数据与 pgfplots 收敛曲线等数值实验示例；
- 参考文献换成数学与数值分析方向的经典文献，沿用 natbib + gbt7714（BibTeX 后端）的 GB/T 7714 样式，不依赖 biber；
- 字体改为 TeX Live 自带的 Fandol 中文 + TeX Gyre Termes 西文/数学字体，不依赖系统 Times New Roman。

参考项目中的示例章节文字、原创性声明原文、网安方向文献与图片均**未复制**。

按 MIT 许可证要求，保留其版权声明与许可全文：

---

MIT License

Copyright (c) 2025 AaronComo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

---

本项目自身未声明开源许可证。模板**未经学校或学院相关部门审核**，
封面字段、声明措辞、页眉与格式要求请以学院当年下发的官方 Word 模板为准。
