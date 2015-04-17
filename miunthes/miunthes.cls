%% miunthes.cls
%% Copyright 2012 Daniel Bosk
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
% miunthes.cls
% miunthes-English.dict
% miunthes-Swedish.dict
%
% $Id$
% Author: Daniel Bosk <daniel.bosk@miun.se>
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{miunthes}[2012/09/23 v1.1 Mid Sweden University Thesis Class]
\RequirePackage[swedish,english]{translator}
\RequirePackage[absolute]{textpos}
\usedictionary{miunthes}
% new if to see if we want draft of final style.
\newif\if@miunthes@draft
% specify whether we want draft or final.
\DeclareOption{draft}{%
	\@miunthes@drafttrue
	\PassOptionsToClass{draft}{memoir}
}
\DeclareOption{final}{%
	\@miunthes@draftfalse
	\PassOptionsToClass{final}{memoir}
}
\newif\if@miunthes@noaddr \@miunthes@noaddrfalse
\DeclareOption{noaddr}{%
	\@miunthes@noaddrtrue
}
\DeclareOption{addr}{%
	\@miunthes@noaddrfalse
}
\newif\if@miunthes@nologo \@miunthes@nologofalse
\DeclareOption{nologo}{%
	\@miunthes@nologotrue
}
\DeclareOption{logo}{%
	\@miunthes@nologofalse
}
\newif\if@miunthes@nosubject \@miunthes@nosubjectfalse
\DeclareOption{nosubject}{%
	\@miunthes@nosubjecttrue
}
% should the black and white logo be used instead of the color one?
\DeclareOption{bw}{\renewcommand{\@miunthes@logotype}{sv}}
\DeclareOption{cmyk}{\renewcommand{\@miunthes@logotype}{CMYK}}
% we do not use the options titlepage or notitlepage,
\DeclareOption{titlepage}{\OptionNotUsed}
\DeclareOption{notitlepage}{\OptionNotUsed}
% \maketitle requires the graphicx package.
\AtBeginDocument{\RequirePackage{graphicx}}
% \@miunthes@maketitle code is no longer used, keep it for the future
\newcommand{\@miunthes@maketitle}{%
	\null
	\vskip 2em%
	\begin{center}%
		\vskip-2cm%
		\vskip-2em%
		\if@miunthes@nologo
			\vskip 2cm
		\else
			\includegraphics[height=2cm]%
				{MU_logotyp_int_\@miunthes@logotype.\@miunthes@logofileformat}
		\fi
		\vskip 2em%
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
\newcommand{\@miunthes@thesisbkgcol}{miunwhite}
\newcommand{\@miunthes@thesiscol}{miunblack}
\newcommand{\@miunthes@thesistype}{Project}
\newcommand{\@miunthes@thesistitle}{%
	\let\thanks\@undefined
	\sffamily
	\textblockcolour{\@miunthes@thesisbkgcol}
	\begin{textblock*}{\paperwidth}(0pt,0pt)
		\noindent
		\null
		\par\vskip 0.83\paperheight
	\end{textblock*}
	\parbox{\textwidth}{
		\color{\@miunthes@thesiscol}
		\par\vskip 0.3\paperheight
		{\bfseries\huge\@title\par}
		\vskip \baselineskip
		{\large\@subtitle\par}
		\vskip 2\baselineskip
		{\bfseries\Large\@author\par}
	}
	\if@miunthes@nosubject
		\relax
	\else
		\begin{textblock*}{\paperwidth}(0pt,0.83\paperheight-0.5\spinemargin)
			\begin{center}
				\color{\@miunthes@thesiscol}
				{\normalsize \translate{\@miunthes@thesistype} \translate{in} 
				\@miunthes@subject\par}
				\hfil
			\end{center}
		\end{textblock*}
	\fi
	\textblockcolour{miunwhite}
	\color{miunblack}
	\begin{textblock*}{\paperwidth}(0pt,0.85\paperheight)
		\begin{center}
			\if@miunthes@nologo
				\vskip 0.08\paperheight
			\else
				\includegraphics[height=0.08\paperheight]%
					{MU_logotyp_int_\@miunthes@logotype.\@miunthes@logofileformat}
			\fi
			\if@miunthes@noaddr
				\relax
			\else
				\par\vskip 1em
				\tiny
				\parbox{0.63\paperwidth}{
					\centering
					\textbf{Campus H\"arn\"osand} Universitetsbacken 1, SE-871\,88 
					H\"arn\"osand.
					\textbf{Campus Sundsvall} Holmgatan 10, SE-851\,70 Sundsvall.
					\textbf{Campus \"Ostersund} Kunskapens v\"ag 8, SE-831\,25
					\"Ostersund.
					\par
					\translate{Phone}: +46\,(0)771\,97\,50\,00.
					Fax: +46\,(0)771\,97\,50\,01.
				}
			\fi
		\end{center}
	\end{textblock*}
}
\newcommand{\@subtitle}{\relax}
\newcommand{\@miunthes@subject}{%
	\ClassError{miunthes}%
		{\expand\subject not set}
		{You must set the subject of your thesis}
}
% use a new \maketitle command.
\newif\if@miunthes@thesistypeset \@miunthes@thesistypesetfalse
\DeclareOption{bsc}{%
	\ExecuteOptions{knd}
}
\DeclareOption{knd}{%
	\if@miunthes@thesistypeset
		\ClassError{miunthes}
			{thesis type already set}
			{You must only set one thesis type, they are mutually exclusive.}
	\fi
	\@miunthes@thesistypesettrue
	\renewcommand{\@miunthes@thesisbkgcol}{miunblue}
	\renewcommand{\@miunthes@thesiscol}{miunwhite}
	\renewcommand{\@miunthes@thesistype}{Bachelor's thesis}
}
\DeclareOption{msc}{%
	\ExecuteOptions{mag}
}
\DeclareOption{mag}{%
	\if@miunthes@thesistypeset
		\ClassError{miunthes}
			{thesis type already set}
			{You must only set one thesis type, they are mutually exclusive.}
	\fi
	\@miunthes@thesistypesettrue
	\renewcommand{\@miunthes@thesisbkgcol}{miunyellow}
	\renewcommand{\@miunthes@thesiscol}{miunblack}
	\renewcommand{\@miunthes@thesistype}{Master's thesis (magister)}
}
\DeclareOption{mst}{%
	\if@miunthes@thesistypeset
		\ClassError{miunthes}
			{thesis type already set}
			{You must only set one thesis type, they are mutually exclusive.}
	\fi
	\@miunthes@thesistypesettrue
	\renewcommand{\@miunthes@thesisbkgcol}{miunyellow}
	\renewcommand{\@miunthes@thesiscol}{miunblack}
	\renewcommand{\@miunthes@thesistype}{Master's thesis}
}
\DeclareOption{lic}{%
	\if@miunthes@thesistypeset
		\ClassError{miunthes}
			{thesis type already set}
			{You must only set one thesis type, they are mutually exclusive.}
	\fi
	\@miunthes@thesistypesettrue
	\renewcommand{\@miunthes@maketitle}{%
	}
	\ClassError{miunthes}%
		{thesis type not implemented}
		{This thesis type is not yet implemented}
}
\DeclareOption{phd}{%
	\if@miunthes@thesistypeset
		\ClassError{miunthes}
			{thesis type already set}
			{You must only set one thesis type, they are mutually exclusive.}
	\fi
	\@miunthes@thesistypesettrue
	\renewcommand{\@miunthes@maketitle}{%
	}
	\ClassError{miunthes}%
		{thesis type not implemented}
		{This thesis type is not yet implemented}
}
\DeclareOption{project}{
	\if@miunthes@thesistypeset
		\ClassError{miunthes}
			{thesis type already set}
			{You must only set one thesis type, they are mutually exclusive.}
	\fi
	\@miunthes@thesistypesettrue
	\@miunthes@nosubjecttrue
	\@miunthes@nologotrue
	\@miunthes@noaddrtrue
}
% pass all unknown options to the base class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
% standard options for this class.
\ExecuteOptions{a4paper,10pt,twoside,onecolumn,openright,final}
\ProcessOptions\relax
\LoadClass{memoir}
% configure memoir
\isopage
\chapterstyle{hangnum}
\renewcommand{\chapnamefont}{\normalfont\huge\bfseries\sffamily}
\renewcommand{\chapnumfont}{\normalfont\huge\bfseries\sffamily}
\renewcommand{\chaptitlefont}{\normalfont\huge\bfseries\sffamily}
\renewcommand{\abstractnamefont}{\normalfont\sffamily\small\bfseries}
\setsecheadstyle{\normalfont\Large\sffamily\bfseries\raggedright}
\setsubsecheadstyle{\normalfont\large\sffamily\bfseries\raggedright}
\hangsecnum
\nouppercaseheads
\abstractintoc
\renewcommand{\cftchapterfont}{\normalfont\normalsize\sffamily\bfseries}
\renewcommand{\cftsectionfont}{\normalfont\normalsize\sffamily}
\renewcommand{\cftsubsectionfont}{\normalfont\normalsize\sffamily}
\captionnamefont{\bfseries\sffamily}
\captiondelim{ }
\captiontitlefont{}
\captionstyle[\centering]{\raggedright}
%\captionwidth{0.9\linewidth}
%\changecaptionwidth
\normalcaption
\renewcommand{\bibname}{\translate{References}}
\AtBeginDocument{%
	\@ifpackageloaded{babel}{%
		\addto{\captionsswedish}{%
			\renewcommand{\bibname}{\translate{References}}
		}
		\addto{\captionsenglish}{%
			\renewcommand{\bibname}{\translate{References}}
		}
	}{%
		\relax
	}
}
% default figures and tables as centered
% uncomment when texlive reaches 2012 version in ubuntu package repo
%\setfloatadjustment{figure}{\centering}
%\setfloatadjustment{table}{\centering\small}
\checkandfixthelayout
% set up class specifics
\RequirePackage{color}
\RequirePackage{calc}
\let\maketitle\@miunthes@thesistitle
\definecolor{miunyellow}{cmyk}{0,0.10,1.0,0}
\definecolor{miunblue}{cmyk}{1.0,0.34,0,0.02}
\definecolor{miunblack}{cmyk}{0,0,0,1.0}
\definecolor{miungray}{cmyk}{0,0,0,0.11}
\definecolor{miundark}{cmyk}{0.11,0.01,0,0.69}
\definecolor{miunwhite}{cmyk}{0,0,0,0}
% which logo to use, cmyk or sv.
\newcommand{\@miunthes@logotype}{CMYK}
% which logo to use, EPS or PDF.
\newcommand{\@miunthes@logofileformat}{eps}
% determine whether to use the PDF or EPS version of the logo.
\ifpdf
	\renewcommand{\@miunthes@logofileformat}{pdf}
\else
	\renewcommand{\@miunthes@logofileformat}{eps}
\fi
\DeclareRobustCommand{\subtitle}[1]{%
	\renewcommand{\@subtitle}{#1}
}
\DeclareRobustCommand{\subject}[1]{%
	\renewcommand{\@miunthes@subject}{#1}
}
\DeclareRobustCommand{\keywords}[1]{%
	\vspace{\onelineskip}\par\noindent
	\textbf{\translate{Keywords}:}
	\emph{#1}
}
\makeevenfoot{headings}{}{\thepage}{}
\makeoddfoot{headings}{}{\thepage}{}
\ifdraftdoc
	\@ifpackageloaded{svninfo}{\let\today\svnId}{\relax}
	% draft settings
  \makeoddhead{plain}{}{}{\texttt{Draft: \theauthor, \today}}
  \makeevenhead{plain}{\texttt{Draft: \theauthor, \today}}{}{}
  \makeoddhead{headings}{\rightmark}{}{\texttt{Draft: \theauthor, \today}}
  \makeevenhead{headings}{\texttt{Draft: \theauthor, \today}}{}{\leftmark}
\else
	% final settings
	\makeoddhead{headings}{}{}{\rightmark}
	\makeevenhead{headings}{\leftmark}{}{}
\fi
