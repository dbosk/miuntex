%% miunart.cls
%% Copyright 2012 Daniel Bosk and Lennart Franked
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is:
% Daniel Bosk <daniel.bosk@miun.se>
%
% This work consists of the files:
% miunart.cls
% miunart-English.dict
% miunart-Swedish.dict
%
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
