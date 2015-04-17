%% miunasgn.cls
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
% miunasgn.cls
% miunasgn-English.dict
% miunasgn-Swedish.dict
%
% $Id$
% Written by Daniel Bosk <daniel.bosk@miun.se> and
%            Lennart Franked <lennart.franked@miun.se>.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{miunasgn}[2012/05/04 v1.2
						 Mid Sweden University Assignment Class]
\RequirePackage{ifpdf}
\RequirePackage[swedish,english]{translator}
\usedictionary{miunasgn}
% new if to see if we are to use logo or not.
\newif\if@miunasgn@addlogo
% new if to see if we are to add a course name on the titlepage
\newif\if@miunasgn@addcoursename \@miunasgn@addcoursenametrue
% which logo to use, CMYK or sv.
\newcommand{\@miunasgn@logotype}{CMYK}
% which logo to use, EPS or PDF.
\newcommand{\@miunasgn@logofileformat}{eps}
% determine whether to use the PDF or EPS version of the logo.
\ifpdf
	\renewcommand{\@miunasgn@logofileformat}{pdf}
\else
	\renewcommand{\@miunasgn@logofileformat}{eps}
\fi
% specify whether we want the logo or not.
\DeclareOption{logo}{\@miunasgn@addlogotrue}
\DeclareOption{nologo}{\@miunasgn@addlogofalse}
\DeclareOption{nocourse}{\@miunasgn@addcoursenamefalse}
% should the black and white logo be used instead of the color one?
\DeclareOption{bw}{\renewcommand{\@miunasgn@logotype}{sv}}
\DeclareOption{cmyk}{\renewcommand{\@miunasgn@logotype}{CMYK}}
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
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
% standard options for this class.
\ExecuteOptions{logo,oneside,onecolumn,final}
\ProcessOptions\relax
\LoadClass[a4paper]{exam}
% variables and commands to set
% - type,
% - course name, and
% - course id
% for the title.
\newcommand{\@miunasgn@type}{%
	\translate{Assignment}
}
\DeclareRobustCommand*{\assignmenttype}[1]{%
	\renewcommand{\@miunasgn@type}{#1}
	\let\assignmenttype\relax
}
\newcommand{\@miunasgn@course}{%
	\ClassError{miunasgn}
		{Missing `\noexpand\course'}
		{You need a '\noexpand\course' in the preamble of the document}
}
\DeclareRobustCommand*{\course}[1]{%
	\renewcommand{\@miunasgn@course}{#1}
	\let\course\relax
}
\newcommand{\@miunasgn@courseid}{%
	\ClassError{miunasgn}
		{Missing `\noexpand\courseid'}
		{You need a '\noexpand\courseid' in the preamble of the document}
}
\DeclareRobustCommand*{\courseid}[1]{%
	\renewcommand{\@miunasgn@courseid}{#1}
	\let\courseid\relax
}
% rename and "remove" \title.
\let\setthetitle\title
\newcommand{\@miunasgn@title}{\relax}
\DeclareRobustCommand*{\title}[1]{%
	\renewcommand{\@miunasgn@title}{:\par #1}
	\let\title\relax
}
% generate a title from the \courseid and \course.
\AtBeginDocument{%
	\setthetitle{\@miunasgn@type\@miunasgn@title}
	\global\let\setthetitle\relax
}
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
		\if@miunasgn@addlogo
			\vskip-2cm%
			\vskip-2em%
	 		\includegraphics[height=2cm]%
				{MU_logotyp_int_\@miunasgn@logotype.\@miunasgn@logofileformat}
			\vskip 2em%
		\fi
		\let \footnote \thanks
		\if@miunasgn@addcoursename
			{\large\@miunasgn@courseid\ \@miunasgn@course\par}
			\vskip 0.2cm%
		\fi
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
\pagestyle{foot}
\footer{}{\thepage\ (\numpages)}{}
% translations (uses translator package)
\renewcommand{\solutiontitle}{%
	\noindent\textbf{\translate{Solution}}\enspace
}
\pointpoints{\translate{point}}{\translate{points}}
\vqword{\translate{Question}}\hqword{\translate{Question}}
\bvqword{\translate{Question}}\bhqword{\translate{Question}}
\vpword{\translate{Points}}\hpword{\translate{Points}}
\bvpword{\translate{Points}}\bhpword{\translate{Points}}
\vsword{\translate{Results}}\hsword{\translate{Results}}
\bvsword{\translate{Results}}\bhsword{\translate{Results}}
\marginpointname{\translate{p}}
\pointsinmargin
\extrawidth{-1.5in}
\extrafootheight{0.70in}
\extraheadheight{0.75in}
