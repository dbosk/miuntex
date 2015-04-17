% $Id$
% Written by Daniel Bosk <daniel.bosk@miun.se> and
%            Lennart Franked <lennart.franked@miun.se>.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{miunart}[2012/01/27 v1.1
						 Mid Sweden University Article Class]
\RequirePackage{ifpdf}
\RequirePackage[swedish,english]{translator}
\usedictionary{miunart}
% new if to see if we are to use logo or not.
\newif\if@miunart@addlogo
% which logo to use, CMYK or sv.
\newcommand{\@miunart@logotype}{CMYK}
% which logo to use, EPS or PDF.
\newcommand{\@miunart@logofileformat}{eps}
% determine whether to use the PDF or EPS version of the logo.
\ifpdf
	\renewcommand{\@miunart@logofileformat}{pdf}
\else
	\renewcommand{\@miunart@logofileformat}{eps}
\fi
% specify whether we want the logo or not.
\DeclareOption{logo}{\@miunart@addlogotrue}
\DeclareOption{nologo}{\@miunart@addlogofalse}
% should the black and white logo be used instead of the color one?
\DeclareOption{bw}{\renewcommand{\@miunart@logotype}{sv}}
\DeclareOption{cmyk}{\renewcommand{\@miunart@logotype}{CMYK}}
% disable all other paper sizes than those used in our part of the world.
\DeclareOption{b5paper}{\OptionNotUsed}
\DeclareOption{letterpaper}{\OptionNotUsed}
\DeclareOption{legalpaper}{\OptionNotUsed}
\DeclareOption{executivepaper}{\OptionNotUsed}
% we do not use the options titlepage or notitlepage,
% we never use a titlepage (emphasis on page).
\DeclareOption{titlepage}{\OptionNotUsed}
\DeclareOption{notitlepage}{\OptionNotUsed}
% pass all unknown options to the exam class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
% standard options for this class.
\ExecuteOptions{a4paper,nologo,oneside,onecolumn,final}
\ProcessOptions\relax
\LoadClass[a4paper]{article}
% \maketitle requires the graphicx package.
\AtBeginDocument{\RequirePackage{graphicx}}
% change some defaults
\setlength{\floatsep}{12pt}
\setlength{\intextsep}{12pt}
% use a new \maketitle command.
\def\@maketitle{%
%	\newpage
	\null 
	\vskip 2em%
	\begin{center}%
		\if@miunart@addlogo
			\vskip-2cm%
			\vskip-2em%
	 		\includegraphics[height=2cm]%
				{MU_logotyp_int_\@miunart@logotype.\@miunart@logofileformat}
			\vskip 2em%
		\fi
		\let \footnote \thanks
		{\LARGE\@title\par}%
		\vskip 1.5em%
		{\large
			\lineskip .5em%
			\begin{tabular}[t]{c}%
				\@author
			\end{tabular}\par}%
		\vskip 1em%
		{\large \@date}%
	\end{center}%
	\par
	\vskip 1.5em
}
\DeclareRobustCommand{\keywords}[1]{%
	\par\vspace{10pt}\par\noindent
	\textbf{\translate{Keywords}:}
	\emph{#1}
}
