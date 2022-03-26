\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rayla_thesis}[Rayla's Thesis template]
\LoadClass[a4paper,12pt]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Importing Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath}
\RequirePackage{float}
\RequirePackage[margin=1.0in]{geometry}
\RequirePackage{graphicx}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Defining new commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom Title Style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{
    \begin{center}
        \newcommand{\HRule}{\rule{\linewidth}{0.5mm}}

        \textsc{\LARGE \myuniversity}\\[0.5cm]

        \textsc{\Large \myCollege}\\[0.5cm]

        \textsc{\large \myDepartment}\\[0.5cm]

        \begin{figure}[H]
            \centering
            \includegraphics[scale=0.15]{\myLogo}
            \label{fig:rit_logo}
        \end{figure}

        \HRule\\[0.4cm]

        {\huge \textbf{\thesisTitle}}\\[0.4cm]

        \HRule\\[1.5cm]
    \end{center}

    \begin{align*}
        &\text{By:} & &\text{\myname}\\
        &\text{Research Advisor:} & &\text{\myAdvisor}\\
        &\text{Submission Date:} & &\text{\submissionDate}
    \end{align*}

    \newpage
}