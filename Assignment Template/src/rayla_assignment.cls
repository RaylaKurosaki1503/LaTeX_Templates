\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rayla_assignment}[Rayla's Assignment template]
\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Importing Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amssymb}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage[most]{tcolorbox}
\RequirePackage{xcolor}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{mathpazo}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{listings}
\RequirePackage{enumerate}
\RequirePackage{lipsum}
\RequirePackage{pstricks}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Defining new commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\university}[1]{\newcommand{\universityloc}{#1}}
\newcommand{\courseid}[1]{\newcommand{\courseidloc}{#1}}
\newcommand{\course}[1]{\newcommand{\courseloc}{#1}}
\newcommand{\term}[1]{\newcommand{\termloc}{#1}}
\newcommand{\professor}[1]{\newcommand{\professorloc}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Geometry
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\geometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom Headers and Footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancyhead{}
\fancyfoot{}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.4pt} % we want rules
\renewcommand{\footrulewidth}{0.4pt}
\fancyhead[RO]{\footnotesize\thepage}
\fancyhead[LO]{
    \footnotesize{
        \ifx\classlocal\undefined{}\else\itshape\classlocal{} --{} \fi
    }
    \makeatletter\@title\makeatother
}
\fancyfoot[RO]{\footnotesize\itshape\makeatletter\@author\makeatother}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom Problem Environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newsavebox{\problembox}
\newenvironment{problem}[2]{\noindent\textbf{Problem #1}\, #2 \newline\begin{lrbox}{\problembox}\begin{minipage}{.98\textwidth}}{\vskip 6pt\end{minipage}\end{lrbox}\fbox{\usebox{\problembox}}\newline}
\newenvironment{solution}{\noindent\textsf{\blue \fbox{Solution: }} \newline}{\hfill$\blacksquare$\vskip 12pt}% Solution environment

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom Title Style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{
    \thispagestyle{plain}
    \begin{center}
    {\scshape \universityloc}\\[10pt]
    \hrule
    \vspace{10pt}
    {\LARGE \bfseries \@title}\\[5pt]
    Student: {\itshape \@author}
    \vspace{8pt}
    \hrule
    \vspace{10pt}
    {Course: {\itshape \courseloc \ (\courseidloc)}}
    \hfill
    {Term: {\itshape \termloc}}\\
    {Professor: {\itshape\professorloc}}
    \hfill
    {Due date: {\itshape\@date}}
    \vspace{20pt}
    \end{center}
}

\endinput