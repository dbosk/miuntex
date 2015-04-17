%% miunprot.cls
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
% miunprot.cls
% miunprot-English.dict
% miunprot-Swedish.dict
%
% This work was originally based on the contrib/protocol document class by 
% Leinweber, but it has since deviated quite a lot.
%
% $Id$
% Written by Daniel Bosk <daniel.bosk@miun.se>.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{miunprot}[2012/10/08 v1.3
						 Mid Sweden University Protcol Class]
\RequirePackage{ifthen}
\RequirePackage{ifpdf}
\RequirePackage[swedish,english]{translator}
\usedictionary{miunprot}
\AtBeginDocument{\RequirePackage{graphicx}}
% new if to see if we are to use the logotype or not.
\newif\if@miunprot@addlogo \@miunprot@addlogofalse
% logotype settings
\newcommand{\@miunprot@logotype}{CMYK}
\newcommand{\@miunprot@logofileformat}{eps}
\ifpdf
	\renewcommand{\@miunprot@logofileformat}{pdf}
\fi
% class options
% use logo?
\DeclareOption{logo}{\@miunprot@addlogotrue}
\DeclareOption{nologo}{\@miunprot@addlogofalse}
% black and white or color logo?
\DeclareOption{bw}{\renewcommand{\@miunprot@logotype}{sv}}
\DeclareOption{cmyk}{\renewcommand{\@miunprot@logotype}{CMYK}}
% producing an agenda or a protocol?
\newif\if@miunprot@agenda \@miunprot@agendafalse
\DeclareOption{agenda}{%
	\@miunprot@agendatrue
}
\DeclareOption{protocol}{%
	\if@miunprot@agenda
		\ClassError{miunprot}{Options `agenda' and `protocol' are mutually
			exclusive}{Remove either of them from the class options}
	\fi
	\@miunprot@agendafalse
}
% handling signatures
\newif\if@miunprot@signatures \@miunprot@signaturesfalse
\DeclareOption{signatures}{%
	\@miunprot@signaturestrue
}
% the default options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{logo,cmyk,protocol}
\PassOptionsToClass{a4paper}{article}
% process our options and load the class we base upon
\ProcessOptions\relax
\LoadClass{article}
% XXX fix this dependency of geometry, as this will not allow the user to
% XXX change it.
\RequirePackage[margin=3.5cm]{geometry}
% commands.  maintain compatibility with protocol class.
\newcommand{\@miunprot@groupname}{%
	\ClassError{miunprot}{`\noexpand\groupname' must be set}
		{Add the line `\noexpand\groupname{name}' in the preamble}
}
\DeclareRobustCommand{\groupname}[1]{%
	\renewcommand{\@miunprot@groupname}{#1}
	\let\groupname\relax
	\let\group\relax
}
\let\group\groupname
\newcommand{\@miunprot@chairman}{%
	\ClassError{miunprot}{`\noexpand\chairman' must be set}
		{Add the line `\noexpand\chairman{name}' in the preamble}
}
\DeclareRobustCommand{\chairman}[1]{%
	\renewcommand{\@miunprot@chairman}{#1}
	\let\chairman\relax
	\let\chair\relax
}
\let\chair\chairman
\newcommand{\@miunprot@writer}{%
	\ClassError{miunprot}{`\noexpand\writer' must be set}
		{`\noexpand\writer' must be set unless `agenda' class option is
			used, which is now not the case}
}
\DeclareRobustCommand{\writer}[1]{%
	\renewcommand{\@miunprot@writer}{#1}
	\let\writer\relax
}
\DeclareRobustCommand{\adjuster}[1]{%
	\newcommand{\@miunprot@adjuster}{#1}
	\let\adjuster\relax
}
\newcommand{\@miunprot@location}{%
	\ClassError{miunprot}{`\noexpand\location' must be set}
		{Add the line `\noexpand\location{location}' in the preamble}
}
\DeclareRobustCommand{\location}[1]{%
	\renewcommand{\@miunprot@location}{#1}
	\let\location\relax
	\let\place\relax
}
\let\place\location
\newcommand{\@miunprot@starttime}{%
	\ClassError{miunprot}{`\noexpand\starttime' must be set}
		{Add the line `\noexpand\starttime{time}' in the preamble}
}
\DeclareRobustCommand{\starttime}[1]{%
	\renewcommand{\@miunprot@starttime}{#1}
	\let\starttime\relax
	\let\begintime\relax
}
\let\begintime\starttime
\DeclareRobustCommand{\endtime}[1]{%
	\newcommand{\@miunprot@endtime}{#1}
	\let\endtime\relax
}
\DeclareRobustCommand{\nextchairman}[1]{%
	\newcommand{\@miunprot@nextchair}{#1}
	\let\nextchairman\relax
	\let\nextchair\relax
}
\let\nextchair\nextchairman
\DeclareRobustCommand{\nextwriter}[1]{%
	\newcommand{\@miunprot@nextwriter}{#1}
	\let\nextwriter\relax
}
\DeclareRobustCommand{\nextlocation}[1]{%
	\newcommand{\@miunprot@nextlocation}{#1}
	\let\nextlocation\relax
	\let\nextplace\relax
}
\let\nextplace\nextlocation
\newcommand{\@miunprot@nextdate}{%
	\ClassError{miunprot}{\noexpand\nextdate must be set}
		{Add the line `\noexpand\nextdate{date}' in the preamble}
}
\DeclareRobustCommand{\nextdate}[1]{%
	\renewcommand{\@miunprot@nextdate}{#1}
	\let\nextdate\relax
}
\newcommand{\@miunprot@nexttime}{%
	\ClassError{miunprot}{`\noexpand\nexttime' must be set}
		{Add the line `\noexpand\nexttime{time}' in the preamble}
}
\DeclareRobustCommand{\nexttime}[1]{%
	\renewcommand{\@miunprot@nexttime}{#1}
	\let\nexttime\relax
}
% environments
\newenvironment{attending}{%
	\section*{\large\bfseries\translate{Attending}}
}{%
}
\newenvironment{persons}{%
	\section*{\large\bfseries\translate{Attending}}
}{%
}
\newenvironment{absent}{%
	\section*{\large\bfseries\translate{Absent}}
}{%
}
\newenvironment{adjuncts}{%
	\section*{\large\bfseries\translate{Adjuncts}}
}{
}
% setting the title etc.
\newcommand{\@miunprot@maketitle}{%
	\clearpage
	\let\footnote\thanks
	\null
	\vskip 2em
	\begin{center}
		\if@miunprot@addlogo
			\vskip-2em%
			\vskip-2cm%
			\includegraphics[height=2cm]%
				{MU_logotyp_int_\@miunprot@logotype.\@miunprot@logofileformat}
			\vskip 2em%
		\fi
		{\bfseries\huge \@miunprot@groupname \par}
		\vskip 1.5em
		\if@miunprot@agenda\else
			{\large\translate{Protocol for the meeting on} \@date\par}
		\fi
		\vskip 1.5em
		\if@miunprot@agenda
			{\large\textbf{\translate{Chairman}}\enspace\@miunprot@chairman\par}
		\else
			{%
				\ifx\@miunprot@adjuster\@undefined
					\large\begin{tabular}{ll}
						\textbf{\translate{Chairman}}	& \@miunprot@chairman\\
						\textbf{\translate{Writer}}   & \@miunprot@writer
					\end{tabular}\par
				\else
					\large\begin{tabular}{ll}
						\textbf{\translate{Chairman}} & \@miunprot@chairman\\
						\textbf{\translate{Writer}}		& \@miunprot@writer \\
						\textbf{\translate{Adjuster}}	& \@miunprot@adjuster
					\end{tabular}\par
				\fi
			}
		\fi
	\end{center}
	\vskip 3em
	{\noindent\ifx\@miunprot@endtime\@undefined
		\begin{tabular}{ll}
			\textbf{\translate{Location}} & \@miunprot@location \\
			\textbf{\translate{Time}}	 & \@date\ \translate{at (time)}
				\@miunprot@starttime
		\end{tabular}
	\else
		\begin{tabular}{ll}
			\textbf{\translate{Location}} & \@miunprot@location \\
			\textbf{\translate{Time}}	 & \@date\ \translate{at (time)}
				\@miunprot@starttime\ \translate{until} \@miunprot@endtime
		\end{tabular}
	\fi\par}
	\vskip 0.5cm
}
\renewcommand{\maketitle}{%
	\par\begingroup
		\renewcommand\thefootnote{\@fnsymbol\c@footnote}%
		\def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
		\long\def\@makefntext##1{\parindent 1em\noindent
			\hb@xt@1.8em{%
				\hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
		\newpage
		\global\@topnum\z@   % Prevents figures from going at top of page.
		\@miunprot@maketitle
		\thispagestyle{plain}\@thanks
	\endgroup
	\setcounter{footnote}{0}
	\let\maketitle\relax
}
%\let\makeagenda\tableofcontents
\let\tableofcontents\relax
\DeclareRobustCommand{\makenextmeeting}{%
	\section*{\large\bfseries\translate{Next meeting}}
	\noindent
	\translate{The next meeting will be on} \@miunprot@nextdate\
	\translate{at (time)} \@miunprot@nexttime\
	\translate{in} \@miunprot@nextlocation.
	\ifx\@miunprot@nextchair\@undefined\else
		\translate{The next chairman is} \@miunprot@nextchair.
	\fi
	\ifx\@miunprot@nextwriter\@undefined\else
		\translate{The next writer is} \@miunprot@nextwriter.
	\fi
	\let\makenextmeeting\relax
}
% add text and space for signatures
\newcommand{\@miunprot@signatures}{%
	\vspace{2cm}\par\noindent
	\hrulefill\hrulefill\hfill\hrulefill\hrulefill\\
	\@miunprot@chairman
	\hfill
	\ifx\@miunprot@adjuster\@undefined
		\@miunprot@writer
	\else
		\@miunprot@adjuster
	\fi\\
	(\translate{Chairman})
	\hfill
	\ifx\@miunprot@adjuster\@undefined
		(\translate{Writer})
	\else
		(\translate{Adjuster})
	\fi\\
}
\newcommand{\@miunprot@makeend}{%
	\if@miunprot@signatures
		\@miunprot@signatures
	\fi
	%\if@miunprot@agenda\else
	%	\makenextmeeting
	%\fi
}
\DeclareRobustCommand{\agendaitem}[2][]{%
	\ifthenelse{\equal{#1}{}}{%
		\section{\large\bfseries #2}
	}{
		\section[#2 (#1)]{\large\bfseries #2\hfill #1}
	}
}
\DeclareRobustCommand{\other}{%
	\section{\large\bfseries\translate{Other}}
}
\DeclareRobustCommand{\otheritem}[2][]{%
	\ifthenelse{\equal{#1}{}}{%
		\subsection{\large\bfseries #2}
	}{
		\subsection[#2 (#1)]{\large\bfseries #2\hfill #1}
	}
}
\let\agendasubitem\otheritem\relax
\AtBeginDocument{\maketitle}
\AtEndDocument{\@miunprot@makeend}
