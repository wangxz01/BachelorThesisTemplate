%% =====================================================================
%% whu-math-thesis.cls
%% 武汉大学数学与统计学院 本科毕业论文（设计）LaTeX 文档类
%%
%% 版式规范参考：
%%   AaronComo/WHU-Bachelor-Thesis-Template (MIT, Copyright (c) 2025 AaronComo)
%%   及其上游 whu-thesis (Fing, 2019)。
%% 本文件为按数学与统计学院需求重新实现，详见 THIRD_PARTY_NOTICES.md。
%%
%% 编译：XeLaTeX（正文含参考文献，需配合 biber，建议 latexmk -xelatex）
%% =====================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{whu-math-thesis}[2026/11/08 v1.0 WHU Math & Statistics bachelor thesis]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[a4paper,oneside,openany,zihao=-4,UTF8,fontset=fandol]{ctexbook}

%% ---------------------------------------------------------------------
%% 1. 页面、页眉页脚、行距（沿用武大本科论文通用版式）
%% ---------------------------------------------------------------------
\RequirePackage{geometry}
\geometry{left=3.17cm,right=3.17cm,top=2.54cm,bottom=2.54cm,includefoot}
\setlength{\headheight}{18.5pt}
\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \fancyhead[C]{\textcolor{gray}{\zihao{5}武汉大学本科毕业论文（设计）}}%
  \fancyfoot[C]{\zihao{5}\thepage}}
\pagestyle{plain}
\RequirePackage{setspace}
\linespread{1.5}\selectfont

%% ---------------------------------------------------------------------
%% 2. 字体：全部来自 TeX Live，跨平台一致（中文 Fandol，西文/数学 Times 风格）
%% ---------------------------------------------------------------------
\RequirePackage{fontspec}
\RequirePackage{amsmath,mathtools}  % 需先于 unicode-math 加载
\RequirePackage{unicode-math}
\setmainfont{texgyretermes-regular.otf}[
  BoldFont      = texgyretermes-bold.otf,
  ItalicFont    = texgyretermes-italic.otf,
  BoldItalicFont= texgyretermes-bolditalic.otf]
\setmonofont{lmmono10-regular.otf}
\setmathfont{texgyretermes-math.otf}
% ctex 中文字体命令兜底（fandol fontset 已定义 zhsong/zhhei/zhfs/zhkai 字族）
\providecommand{\songti}{\CJKfamily{zhsong}}
\providecommand{\heiti}{\CJKfamily{zhhei}}
\providecommand{\fangsong}{\CJKfamily{zhfs}}
\providecommand{\kaishu}{\CJKfamily{zhkai}}

%% ---------------------------------------------------------------------
%% 3. 章节标题与目录
%% ---------------------------------------------------------------------
\ctexset{%
  chapter     = {format={\centering\heiti\zihao{-2}},number={\arabic{chapter}},
                 name={,},beforeskip={0em},afterskip={1em}},
  section     = {format={\raggedright\heiti\zihao{4}}},
  subsection  = {format={\raggedright\heiti\zihao{-4}}},
  subsubsection = {format={\raggedright\heiti\zihao{-4}}}}
\RequirePackage{tocloft}
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}
\renewcommand{\contentsname}{目\hspace{2em}录}
\renewcommand{\cfttoctitlefont}{\hfill\heiti\zihao{-2}}
\renewcommand{\cftaftertoctitle}{\hfill}
\setlength{\cftbeforetoctitleskip}{0cm}
\setlength{\cftaftertoctitleskip}{0ex}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{1}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand{\cftchapfont}{\fangsong\zihao{4}}
\renewcommand{\cftsecfont}{\songti\zihao{-4}}
\renewcommand{\cftsubsecfont}{\songti\zihao{-4}}
\renewcommand{\cftchappagefont}{\fangsong\zihao{-4}}
\renewcommand{\cftsecpagefont}{\songti\zihao{-4}}
\renewcommand{\cftsubsecpagefont}{\songti\zihao{-4}}
\renewcommand{\cftchapafterpnum}{\vskip5pt}
\renewcommand{\cftsecafterpnum}{\vskip3pt}
\renewcommand{\cftsubsecafterpnum}{\vskip2pt}
\setlength{\cftsecindent}{1.85em}
\setlength{\cftsubsecindent}{3.7em}

\newcommand{\makecontents}{\tableofcontents\clearpage}
% 前言（罗马页码）→ 正文（阿拉伯页码，固定 23pt 行距）
\newcommand{\startmainmatter}{%
  \clearpage
  \pagenumbering{arabic}\setcounter{page}{1}%
  \linespread{1}\normalsize
  \setlength{\baselineskip}{23pt}}

%% ---------------------------------------------------------------------
%% 4. 数学排版：定理环境按章编号、公式按章编号、常用宏
%% ---------------------------------------------------------------------
\RequirePackage{amsthm}
\numberwithin{equation}{chapter}
\newtheoremstyle{whumath}%
  {6pt}{6pt}{\normalfont}{}{\heiti}{}{1em}%
  {\thmname{#1}\thmnumber{ #2}\thmnote{（#3）}}
\theoremstyle{whumath}
\newtheorem{theorem}{定理}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{remark}{注}[chapter]
\renewcommand{\proofname}{\normalfont\heiti 证明}
% 证毕符号沿用 amsthm 默认的空心方块 \openbox（unicode-math 下无 \square）

\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\E}{\mathbb{E}}
\newcommand{\Prob}{\mathbb{P}}
\newcommand{\vect}[1]{\symbf{#1}}
\newcommand{\norm}[1]{\left\lVert #1\right\rVert}
\newcommand{\abs}[1]{\left\lvert #1\right\rvert}
\newcommand{\inner}[2]{\left\langle #1,#2\right\rangle}
\newcommand{\dd}{\mathop{}\!\mathrm{d}}
\DeclareMathOperator{\argmin}{arg\,min}
\DeclareMathOperator{\argmax}{arg\,max}
\DeclareMathOperator{\supp}{supp}
\DeclareMathOperator{\dist}{dist}
\DeclareMathOperator{\diag}{diag}
\DeclareMathOperator{\tr}{tr}
\DeclareMathOperator{\rank}{rank}
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\spann}{span}

\AtBeginDocument{%
  \setlength{\abovedisplayskip}{6pt}%
  \setlength{\belowdisplayskip}{6pt}%
  \setlength{\abovedisplayshortskip}{0pt}%
  \setlength{\belowdisplayshortskip}{0pt}}

%% ---------------------------------------------------------------------
%% 5. 图表、表格、算法、绘图
%% ---------------------------------------------------------------------
\RequirePackage{graphicx}
\graphicspath{{figures/}}
\RequirePackage{caption}
\captionsetup[figure]{font=small,labelfont=bf,textfont=normalfont}
\captionsetup[table]{font=small,labelfont=bf,textfont=normalfont}
\RequirePackage{booktabs,tabularx,longtable,multirow,array}
\RequirePackage[ruled,linesnumbered,vlined]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}
\RequirePackage{enumitem}
\setlist{noitemsep}

%% ---------------------------------------------------------------------
%% 6. 封面、原创性声明、摘要
%% ---------------------------------------------------------------------
\makeatletter
\def\ctitle#1{\def\@ctitle{#1}}\def\@ctitle{}
\def\cschool#1{\def\@cschool{#1}}\def\@cschool{}
\def\cmajor#1{\def\@cmajor{#1}}\def\@cmajor{}
\def\cauthor#1{\def\@cauthor{#1}}\def\@cauthor{}
\def\cnumber#1{\def\@cnumber{#1}}\def\@cnumber{}
\def\cadvisor#1{\def\@cadvisor{#1}}\def\@cadvisor{}
\def\cdate#1{\def\@cdate{#1}}\def\@cdate{}

\newcommand{\maketitlepage}{%
  \thispagestyle{empty}
  \begin{center}
    % 校徽为可选文件：若自行放入 figures/whulogo.pdf 则自动使用，否则用文字校名
    \IfFileExists{figures/whulogo.pdf}
      {\includegraphics[width=0.28\linewidth]{figures/whulogo.pdf}}
      {{\heiti\zihao{1}武汉大学}}
    \par\vspace{1.2em}
    {\fangsong\zihao{2}本科毕业论文（设计）}
    \par\vspace{2.5em}
    \parbox{0.84\textwidth}{\centering\kaishu\zihao{1}\@ctitle}
    \par\vspace{3em}
    {\songti\zihao{4}%
      \begin{tabular}{>{\zihao{4}}r@{\quad}>{\zihao{4}}l}
        学\qquad 院： & \@cschool \\[0.8ex]
        专\qquad 业： & \@cmajor  \\[0.8ex]
        姓\qquad 名： & \@cauthor \\[0.8ex]
        学\qquad 号： & \@cnumber \\[0.8ex]
        指导教师：   & \@cadvisor
      \end{tabular}}
    \par\vspace*{\fill}
    {\songti\zihao{4}\@cdate}
  \end{center}
  \clearpage}

\newcommand{\makestatement}{%
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{center}{\heiti\zihao{-2}原创性声明}\end{center}
  \par\vspace{18pt}
  \setlength{\baselineskip}{23pt}
  {\zihao{-4}%
  本人郑重声明：所呈交的毕业论文（设计），是本人在指导教师的指导下独立完成的。
  除文中已经标明引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写过的研究成果。
  对本文的研究做出贡献的个人和集体，均已在文中以明确方式标明。
  本人承诺论文中不存在伪造数据、抄袭等学术不端行为；若因本文侵犯他人知识产权而产生法律责任，由本人承担。
  \par\vspace{24pt}
  \noindent\hfill 作者签名：\hspace{3cm}\quad 日期：\hspace{2cm} 年\quad 月\quad 日\par}
  \par\vspace{60pt}
  \begin{center}{\heiti\zihao{-2}版权使用授权书}\end{center}
  \par\vspace{18pt}
  {\zihao{-4}%
  本人完全了解武汉大学有关保留、使用毕业论文（设计）的规定，同意学校保留并向有关部门送交本文的复印件和电子版，
  允许本文被查阅和借阅；同意学校将本文的全部或部分内容编入有关数据库进行检索和传播，
  可以采用影印、缩印或扫描等复制手段保存和汇编本文。
  \par\vspace{24pt}
  \noindent\hfill 作者签名：\hspace{3cm}\quad 指导教师签名：\hspace{3cm}\par}
  \vspace*{\fill}
  \clearpage}
\makeatother

\newenvironment{cnabstract}[1]{%
  \def\whucnkeyword{#1}%
  \clearpage
  \begin{center}{\heiti\zihao{-2}摘\hspace{2em}要}\end{center}
  \vspace{1em}
  \setlength{\baselineskip}{23pt}\zihao{-4}%
}{%
  \par\vspace{2em}
  \noindent{\heiti\zihao{-4}关键词：}\whucnkeyword
  \clearpage}

\newenvironment{enabstract}[1]{%
  \def\whuenkeyword{#1}%
  \clearpage
  \begin{center}{\heiti\zihao{-2}ABSTRACT}\end{center}
  \vspace{1em}
  \setlength{\baselineskip}{23pt}\zihao{-4}%
}{%
  \par\vspace{2em}
  \noindent{\bfseries\zihao{-4}Key words: }\whuenkeyword
  \clearpage}

\endinput
