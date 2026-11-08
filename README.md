# BachelorThesisTemplate

武汉大学本科毕业论文（设计）**任务书**与**开题报告**的 LaTeX 模板。

依据学院下发的两份 Word 表单整理，按原件还原了 A4 页面、页边距、黑体 18pt 居中标题、仿宋小四正文、表格框线、四列列宽比例、单元格合并与固定行高。所有待填内容都集中成命令，改几行即可生成正式表格。

## 预览

| 任务书 | 开题报告 |
| :---: | :---: |
| ![任务书预览](preview/taskbook.png) | ![开题报告预览](preview/proposal.png) |

两份 PDF 都是 **1 页 A4**，仓库中已附编译好的 `taskbook.pdf` 与 `proposal.pdf`。

## 项目结构

| 文件 | 说明 |
| --- | --- |
| `whu-form.sty` | 公共样式：字体、页面、可填字段、勾选框、固定行高单元格、正文分节 |
| `taskbook.tex` | 任务书（10 行表格） |
| `proposal.tex` | 开题报告（4 行信息表 + 六个正文小节） |
| `taskbook.pdf` / `proposal.pdf` | 编译好的示例成品 |
| `preview/` | 首页预览图 |
| `Makefile` | `make` 一键编译、`make clean` 清理 |
| `.gitignore` | 忽略 LaTeX 中间产物 |

> 两个 `.tex` 与 `whu-form.sty` 必须放在同一目录，`.sty` 由两份文档共同加载。

## 环境要求

- **TeX Live 2025 / MacTeX 2025**（或等效完整发行版），使用 **XeLaTeX** 引擎
- 宏包：`ctex`（含 xeCJK / fontspec）、`geometry`、`array`、`etoolbox`、`amssymb`、`xcolor`、`expl3` —— 完整版 TeX Live / MacTeX 默认自带
- 中文字体：默认使用 TeX Live 自带的 **Fandol** 仿宋 / 黑体（`fontset=fandol`），无需另装系统字体

macOS 上 MacTeX 的命令行通常不在 PATH 中，先执行：

```bash
export PATH="/Library/TeX/texbin:$PATH"
```

## 编译指令（XeLaTeX）

**① 最简形式** —— 在项目根目录执行：

```bash
xelatex taskbook.tex
xelatex proposal.tex
```

模板没有目录、交叉引用和参考文献，各编译一次即可；若改动过字体或想更稳妥，可再执行一次。

**② 推荐的干净编译** —— 中间产物全部进 `build/`，遇错立即停止：

```bash
mkdir -p build
xelatex -interaction=nonstopmode -halt-on-error -output-directory=build taskbook.tex
xelatex -interaction=nonstopmode -halt-on-error -output-directory=build proposal.tex
```

使用 `-output-directory=build` 时，`.sty` 仍从当前目录读取，因此命令要在项目根目录执行；生成的 PDF 在 `build/` 里。

**③ 用 latexmk 自动判断编译次数**：

```bash
latexmk -xelatex taskbook.tex
latexmk -xelatex proposal.tex
latexmk -c          # 清理中间文件
```

**④ 用 Makefile**：

```bash
make            # 生成两个 PDF
make clean      # 删除 .aux / .log / .xdv 等中间文件
make distclean  # 连 PDF 一起删除
```

**其他平台**

- Windows（TeX Live）：命令行同样用 `xelatex`；用 TeXstudio / WinEdt 时把编译器设为 **XeLaTeX**。
- Overleaf：项目设置里 Compiler 选 **XeLaTeX**，主编译文件分别选 `taskbook.tex` / `proposal.tex`。
- 建议保持 ASCII 文件名与路径，避免空格、中文路径带来的字体与文件查找问题。

> 注意：不带 `-output-directory` 编译时，会覆盖仓库中附带的示例 PDF；提交前请留意 `git status`。

## 填写方法

打开 `taskbook.tex` / `proposal.tex`，只改顶部「填写区」：

```latex
\Title{基于深度学习的图像语义分割方法研究}
\StudentName{张三}
\StudentID{2020300000000}
\College{计算机学院}
\Major{计算机科学与技术}
\Advisor{李四}
\AdvisorTitle{教授}
```

任务书还有：

```latex
\ProjectNature{论文}          % 论文 / 设计
\ProjectType{应用研究}        % 理论研究 / 应用研究 / 实验研究 / 工程设计 / 产品开发
\ProjectSource{教师科研选题}  % 教师科研选题 / 教师自主选题 / 学生自主选题
\ProjectPeriod{2026 年 12 月 至 2027 年 5 月}  % 留空则打印可手写下划线
\ProjectContent{...}   % 课题内容及要求
\ReferenceList{...}    % 参考文献
\Schedule{...}         % 进度安排（具体安排）
```

三组「（）」选项会按上面填的值**自动打勾**，无需手工改表格。

开题报告正文写在文末六个 `\proposalpart{标题}{内容}` 的第二个花括号里；标题已按原件提示列好：一、选题目的和意义；二、国内外研究现状和发展趋势；三、研究内容、研究方法、技术路线及可行性分析；四、项目特色与创新点；五、进度安排；六、主要参考文献。留空时会自动留出填写空间。

**小工具**

- `\showhints`：取消注释后，空白字段显示浅灰提示文字，定稿前注释回去。
- 自定义字体：在 `\usepackage{whu-form}` **之前**写 `\newcommand{\WHUFangFont}{仿宋}`、`\newcommand{\WHUHeiFont}{黑体}`（macOS 可用 `Songti SC` / `STHeiti`）。

## 常见问题

- **找不到字体 / fontspec 报错**：确认用的是 XeLaTeX 而非 pdfLaTeX；精简安装的 TeX Live 请补 `texlive-lang-chinese` 与 `fandol`。
- **`Illegal unit of measure (pt inserted)`**：通常是在 `\\` 后直接写了 `[2]` 这类编号，LaTeX 会把 `[...]` 当成 `\\` 的可选长度参数。模板内多行内容统一用 `\par` 换行，或写 `{}[2]` 隔断。
- **表格跑到第二页 / 溢出**：`whu-form.sty` 中同一行所有单元格都用 `\parbox[c][H][...]`；若混用 `[t]`，tabular 会按「最大 height + 最大 depth」把行高撑高约 100pt。调整行高时请同时改这一行的所有单元格。
- **中文显示为方框**：编译器必须是 XeLaTeX，文档类选项保持 `UTF8` 与 `fontset=fandol`。

## 说明

- 仓库中的题目、姓名、文献均为**示例数据**，提交前请全部替换。
- 原始 Word 表单未包含在本仓库；表格字段与措辞请以学院当年下发的最新版本为准。
- 本仓库暂未指定开源许可证，如需公开许可请自行添加 `LICENSE`。
