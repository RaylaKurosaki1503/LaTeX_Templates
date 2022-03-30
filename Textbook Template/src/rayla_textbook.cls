%! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%! Author: Rayla Kurosaki
%! https://www.typesetters.se/latex-textbook-template/
%! https://www.latextemplates.com/template/legrand-orange-book
%! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rayla_textbook}[Rayla's Textbook Class]
\LoadClass[12pt,onecolumn,titlepage,twoside,openany]{book}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Importing Required Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage[pages=some]{background}
\RequirePackage{blindtext}
\RequirePackage[strict]{changepage}
\RequirePackage{fancyhdr}
\RequirePackage{float}
\RequirePackage[T1]{fontenc}
\RequirePackage[top=2cm,bottom=2cm,left=2cm,right=2cm,marginparwidth=1cm,marginparsep=2mm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{imakeidx}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lipsum}
\RequirePackage{sectsty}
\RequirePackage{tikz}
\RequirePackage{titletoc}
\RequirePackage[most]{tcolorbox}
\RequirePackage{xcolor}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\university}[1]{\newcommand{\universityloc}{#1}}
\newcommand{\college}[1]{\newcommand{\collegeloc}{#1}}
\newcommand{\department}[1]{\newcommand{\departmentloc}{#1}}
\renewcommand{\title}[1]{\newcommand{\titleloc}{#1}}
\newcommand{\name}[1]{\newcommand{\nameloc}{#1}}
\newcommand{\startYear}[1]{\newcommand{\startYearloc}{#1}}
\newcommand{\bookEdition}[1]{\newcommand{\bookEditionloc}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Geometry
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setlength{\lineskip}{0pt}
\allowdisplaybreaks


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{cyan}{HTML}{00FFFF}
\definecolor{pink}{HTML}{FF6FFF}

\definecolor{black}{HTML}{000000}
\definecolor{red}{HTML}{FF0000}
\definecolor{blue}{HTML}{0000FF}
\definecolor{green}{HTML}{00FF00}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header and footer styling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancyhead[RE]{\leftmark}
\fancyhead[LO]{\rightmark}
\fancyhead[LE,RO]{\thepage}
\fancyfoot[C]{}

\renewcommand{\headrulewidth}{2pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table of contents styling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{tocdepth}{2}

\titlecontents{part}[0cm]{\addvspace{18pt}\large\sffamily\bfseries}{}{}{}

\titlecontents{chapter}[0cm]{\addvspace{14pt}\large\sffamily\bfseries}{\color{black}\contentslabel[\Large\thecontentslabel]{1.25cm}}{}{\color{black}\normalsize\sffamily\bfseries\;\titlerule*[.5pc]{.}\;\thecontentspage}

\titlecontents{section}[1cm]{\addvspace{10pt}\sffamily\bfseries}{\contentslabel[\thecontentslabel]{1.25cm}}{}{\color{black}\normalsize\sffamily\bfseries\;\titlerule*[.5pc]{.}\;\thecontentspage}

\titlecontents{subsection}[2cm]{\addvspace{6pt}\sffamily\bfseries}{\contentslabel[\thecontentslabel]{1.25cm}}{}{\color{black}\normalsize\sffamily\bfseries\;\titlerule*[.5pc]{.}\;\thecontentspage}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part Styling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Numbered part in the table of contents
\newcommand{\@mypartnumtocformat}[2]{
	\setlength\fboxsep{0pt}
	\noindent\colorbox{cyan!20}
	{\strut\parbox[c][.7cm]{\ecart}{\color{black}\Large\sffamily\bfseries\centering#1}}
	\hskip\esp\colorbox{cyan!40}{\strut\parbox[c][.7cm]{0.89\linewidth}{\fontsize{12}{0}\sffamily\centering#2}}
}

% Unnumbered part in the table of contents
\newcommand{\@myparttocformat}[1]{
	\setlength\fboxsep{0pt}
	\noindent\colorbox{cyan!40}{\strut\parbox[c][.7cm]{\linewidth}{\Large\sffamily\centering#1}}
}

\newlength\esp
\setlength\esp{4pt}
\newlength\ecart
\setlength\ecart{1.2cm}
\newcommand{\thepartimage}{}
\newcommand{\partimage}[1]{\renewcommand{\thepartimage}{#1}}%

\def\@part[#1]#2#3{
    \ifnum \c@secnumdepth >-2\relax
        \refstepcounter{part}
        \addcontentsline{toc}{part}{\texorpdfstring{\protect\@mypartnumtocformat{\thepart}{#1}}{\partname~\thepart\ ---\ #1}}
    \else
        \addcontentsline{toc}{part}{\texorpdfstring{\protect\@myparttocformat{#1}}{#1}}
    \fi
    \startcontents
    \markboth{}{}
    {\thispagestyle{empty}
    \begin{tikzpicture}[remember picture,overlay]
        \node at (current page.north west){
        \begin{tikzpicture}[remember picture,overlay]
            \fill[cyan!20](0cm,0cm) rectangle (\paperwidth,-\paperheight);
            \node[anchor=south east] at (\paperwidth-1cm,-\paperheight+1cm){\parbox[t][][t]{17.75cm}{\printcontents{l}{0}{\setcounter{tocdepth}{0}}}};
            \node[anchor=north east] at (\paperwidth-1.5cm,-2cm){\parbox[t][][t]{15cm}{\strut\raggedleft\color{black}\fontsize{30}{30}\sffamily\bfseries#2}};
            \node[] at (10.75cm,-7.5cm){\parbox[t][][t]{15cm}{\strut\raggedleft\color{black}{\begin{summary}#3\end{summary}}}};
        \end{tikzpicture}
        };
    \end{tikzpicture}
    }
\@endpart
}

\def\@spart#1{
    \startcontents
    \phantomsection{
    \thispagestyle{empty}
    \begin{tikzpicture}[remember picture,overlay]
        \node at (current page.north west){
            \begin{tikzpicture}[remember picture,overlay]
                \fill[black!20](0cm,0cm) rectangle (\paperwidth,-\paperheight);
                \node[anchor=north east] at (\paperwidth-1.5cm,-3.25cm){\parbox[t][][t]{15cm}{\strut\raggedleft\color{black}\fontsize{30}{30}\sffamily\bfseries#1}};
            \end{tikzpicture}
        };
    \end{tikzpicture}
    }
    \addcontentsline{toc}{part}{\texorpdfstring{
    \setlength\fboxsep{0pt}
    \noindent\protect\colorbox{black!40}{\strut\protect\parbox[c][.7cm]{\linewidth}{\Large\sffamily\protect\centering #1\quad\mbox{}}}}{#1}}
    \@endpart
}

\def\@endpart{
    \vfil\newpage
    \if@twoside
        \if@openright
            \null
            \thispagestyle{empty}%
            \newpage
        \fi
    \fi
    \if@tempswa
        \twocolumn
    \fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Chapter Styling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter

% Numbered chapters (with minitoc)
\renewcommand{\@makechapterhead}[1]{
    \begin{tikzpicture}[remember picture,overlay]
        \node at (current page.north west){
        \begin{tikzpicture}[remember picture,overlay]
            \draw[anchor=west, inner sep=0pt] (-0.1cm,-1.75cm) node [black,ultra thick,fill=cyan!20,fill opacity=.6,inner sep=10pt](0,0){\parbox[t][2cm][t]{\paperwidth}{\huge\bfseries\sffamily\flushleft\thechapter. #1}};
        \end{tikzpicture}
      };
    \end{tikzpicture}
    \vspace{0.5cm}
}

% Unnumbered chapters (without minitoc)
\renewcommand{\@makeschapterhead}[1]{
    \begin{tikzpicture}[remember picture,overlay]
        \node at (current page.north west){
        \begin{tikzpicture}[remember picture,overlay]
            \draw[anchor=west, inner sep=0pt] (-0.1cm,-1.5cm) node [black,ultra thick,fill=cyan!20,fill opacity=.6,inner sep=10pt](0,0){\parbox[t][1.6cm][t]{\paperwidth}{\huge\bfseries\sffamily\flushleft #1}};
        \end{tikzpicture}
      };
    \end{tikzpicture}
    \vspace{0.5cm}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section styling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\sectionfont{\sf\color{pink}\sectionrule{0ex}{0pt}{-1ex}{1pt}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Subsection styling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\subsectionfont{\sf\color{pink}\sectionrule{0ex}{0pt}{-1ex}{1pt}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom Summary Environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{boxsummary}{\begin{tcolorbox}[enhanced jigsaw,breakable,pad at break*=1mm,colback=pink!5,colframe=pink]}{\end{tcolorbox}}
\newenvironment{summary}{\begin{boxsummary}}{\end{boxsummary}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Abstract Environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{abstract}%
    {\small\begin{center}%
    \bfseries{Abstract}}{\end{center}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Index
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{imakeidx}
\makeindex


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom Theorem Environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{boxtheorem}{\begin{tcolorbox}[enhanced jigsaw,breakable,pad at break*=1mm,colback=pink!5,colframe=pink]}{\end{tcolorbox}}

\newtheoremstyle{styletheorem}{0pt}{0pt}{\normalfont}{0pt}{\small\bf\sffamily\color{black}}{: }{0em}{\small\sffamily\color{black}\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries\color{black}(#3)}\index{#3}}

\theoremstyle{styletheorem}
\newtheorem{envtheorem}{Theorem}[chapter]

\newenvironment{theorem}{\begin{boxtheorem}\begin{envtheorem}}{\end{envtheorem}\end{boxtheorem}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom Definition Environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{boxdefinition}{\begin{tcolorbox}[enhanced jigsaw,breakable,pad at break*=1mm,colback=pink!10!white,boxrule=0pt,frame hidden,borderline west={1.5mm}{-2mm}{pink}]}{\end{tcolorbox}}

\newtheoremstyle{styledefinition}
{0pt}{0pt}{\normalfont}{0pt}{\small\bf\sffamily\color{black}}{: }{0.25em}{\small\sffamily\color{black}\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries\color{black}(#3)}\index{#3}}

\theoremstyle{styledefinition}
\newtheorem{envdefinition}{Definition}[chapter]

\newenvironment{definition}{\begin{boxdefinition}\begin{envdefinition}}{\end{envdefinition}\end{boxdefinition}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom Note Environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{boxnote}{\begin{tcolorbox}[enhanced jigsaw,breakable,pad at break*=1mm,colback=yellow!10!white,boxrule=0pt,frame hidden]}{\end{tcolorbox}}

\newtheoremstyle{stylenote}{0pt}{0pt}{\normalfont}{0pt}{\small\bf\sffamily\color{black}}{: }{0em}{\small\sffamily\color{black}\thmname{#1}\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries\color{black}(#3)}\index{#3}}

\theoremstyle{stylenote}
\newtheorem{envnote}{Note}[chapter]

\newenvironment{note}{\begin{boxnote}\begin{envnote}}{\end{envnote}\end{boxnote}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom Example Environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{boxexample}{\begin{tcolorbox}[enhanced jigsaw,breakable,pad at break*=1mm,colback=cyan!5,colframe=cyan]}{\end{tcolorbox}}

\newtheoremstyle{styleexample}{0pt}{0pt}{\normalfont}{0pt}{\small\bf\sffamily\color{black}}{: }{0.25em}{\small\sffamily\color{black}\thmname{#1}\nobreakspace\thmnumber{\@ifnotempty{#1}{}\@upn{#2}}\thmnote{\nobreakspace\the\thm@notefont\sffamily\bfseries\color{black}(#3)}}

\theoremstyle{styleexample}
\newtheorem{envexample}{Example}[chapter]

\newenvironment{example}{\begin{boxexample}\begin{envexample}}{\end{envexample}\end{boxexample}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom Problem Environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{boxproblem}{\begin{tcolorbox}[enhanced jigsaw,breakable,pad at break*=1mm,colback=cyan!25,boxrule=0pt,frame hidden]}{\end{tcolorbox}}

\newtheorem{envproblem}{Problem}[chapter]

\newenvironment{problem}{\begin{boxproblem}\begin{envproblem}}{\end{envproblem}\end{boxproblem}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom Solution Environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{solution}{\noindent\textsf{\color{pink} \fbox{Solution: }} \newline}{\vskip 12pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pre Content
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\raylaStartBook}{
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Cover Page ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
\pagestyle{empty}
\backgroundsetup{scale=1,color=black,opacity=1.0,angle=0,contents={\includegraphics[width=\paperwidth,height=\paperheight]{images/cover}}}
\BgThispage
\begin{titlepage}
    \color{white}
	\center
	\textsc{\LARGE \universityloc}\\[0.5cm]
	\textsc{\Large \collegeloc}\\[0.5cm]
	\textsc{\large \departmentloc}\\[0.5cm]
	\rule{\linewidth}{1.0mm}\\[0.5cm]
	{\huge \titleloc}\\[0.5cm]
	\rule{\linewidth}{1.0mm}\\[0.5cm]
	\nameloc
\end{titlepage}
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Title Page ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
\clearpage
\pagenumbering{roman}
\thispagestyle{empty}
\begin{center}
	\textsc{\LARGE \universityloc}\\[0.5cm]
	\textsc{\Large \collegeloc}\\[0.5cm]
	\textsc{\large \departmentloc}\\[0.5cm]
	\begin{figure}[H]
        \centering
        \includegraphics[scale=0.15]{images/Rochester_Institute_of_Techology_Logo}
    \end{figure}
	\rule{\linewidth}{1.0mm}\\[0.5cm]
	{\huge \titleloc}\\[0.5cm]
	\rule{\linewidth}{1.0mm}\\[0.5cm]
	\nameloc
\end{center}
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Copyright Page ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
\clearpage
\thispagestyle{empty}
\null
\vfill
\begin{flushleft}
    Copyright \copyright \ {\startYearloc}-present \ \nameloc \\
    \vspace{5mm}
    \textbf{Copying prohibited} \\
    \vspace{5mm}
    All rights reserved. No part of this publication may be reproduced or transmitted in any form or by any means, electronic or mechanical, including photocopying and recording, or by any information storage or retrieval system, without the prior written permission of the publisher. \\
    \vspace{5mm}
    Edition \bookEditionloc \\
\end{flushleft}
%~~~~~~~~~~~~~~~~~~~~~~~~~~ Table of Contents Page ~~~~~~~~~~~~~~~~~~~~~~~~~~%
\clearpage
\pagestyle{fancy}
\tableofcontents
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Blank Page ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
\clearpage
\checkoddpage
\ifoddpage
\else
\input{pre_content/blank_page.tex}
\fi
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Title Page ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
\clearpage
\thispagestyle{empty}
\begin{center}
	\textsc{\LARGE \universityloc}\\[0.5cm]
	\textsc{\Large \collegeloc}\\[0.5cm]
	\textsc{\large \departmentloc}\\[0.5cm]
	\begin{figure}[H]
        \centering
        \includegraphics[scale=0.15]{images/Rochester_Institute_of_Techology_Logo}
    \end{figure}
	\rule{\linewidth}{1.0mm}\\[0.5cm]
	{\huge \titleloc}\\[0.5cm]
	\rule{\linewidth}{1.0mm}\\[0.5cm]
	\nameloc
\end{center}
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Blank Page ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
\clearpage
\input{pre_content/blank_page.tex}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Post Content
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\raylaEndBook}{
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Bibliography ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
\bibliography{main}
\bibliographystyle{unsrt}
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Index ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
\printindex
}