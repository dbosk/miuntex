% $Id$
% Written by Daniel Bosk <daniel.bosk@miun.se> and
%            Lennart Franked <lennart.franked@miun.se>.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{miunexam}[2012/08/27 v1.2
						 Mid Sweden University Exam Class]
\RequirePackage{ifpdf}
\RequirePackage[swedish,english]{translator}
\usedictionary{miunexam}
% new if to see if we are to use logo or not.
\newif\if@miunexam@addlogo
% which logo to use, CMYK or sv.
\newcommand{\@miunexam@logotype}{CMYK}
% which logo to use, EPS or PDF.
\newcommand{\@miunexam@logofileformat}{eps}
% determine whether to use the PDF or EPS version of the logo.
\ifpdf
	\renewcommand{\@miunexam@logofileformat}{pdf}
\else
	\renewcommand{\@miunexam@logofileformat}{eps}
\fi
% specify whether we want the logo or not.
\DeclareOption{logo}{\@miunexam@addlogotrue}
\DeclareOption{nologo}{\@miunexam@addlogofalse}
% should the black and white logo be used instead of the color one?
\DeclareOption{svv}{\renewcommand{\@miunexam@logotype}{sv}}
\DeclareOption{bw}{\renewcommand{\@miunexam@logotype}{sv}}
\DeclareOption{cmyk}{\renewcommand{\@miunexam@logotype}{CMYK}}
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
\newcommand{\@miunexam@type}{%
	\translate{Final exam}
}
\DeclareRobustCommand*{\examtype}[1]{%
	\renewcommand{\@miunexam@type}{#1}
	\let\examtype\relax
}
\newcommand{\@miunexam@course}{%
	\ClassError{miunexam}
		{Missing `\noexpand\course'}
		{You need a '\noexpand\course' in the preamble of the document}
}
\DeclareRobustCommand*{\course}[1]{%
	\renewcommand{\@miunexam@course}{#1}
	\let\course\relax
}
\newcommand{\@miunexam@courseid}{%
	\ClassError{miunexam}
		{Missing `\noexpand\courseid'}
		{You need a '\noexpand\courseid' in the preamble of the document}
}
\DeclareRobustCommand*{\courseid}[1]{%
	\renewcommand{\@miunexam@courseid}{#1}
	\let\courseid\relax
}
% rename and "remove" \title.
\let\setthetitle\title
\let\title\relax
% generate a title from the \courseid and \course.
\AtBeginDocument{%
	\setthetitle{\@miunexam@courseid\ \@miunexam@course}
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
		\if@miunexam@addlogo
			\vskip-2cm%
			\vskip-2em%
	 		\includegraphics[height=2cm]%
				{MU_logotyp_int_\@miunexam@logotype.\@miunexam@logofileformat}
			\vskip 2em%
		\fi
		\let \footnote \thanks
		{\Large\@miunexam@type\par}
		\vskip 0.2cm%
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
