%
%   LaTeX class file for AJSTD
%   Copyright 2018-2020 Joaquim Baeta <mail@joaquimbaeta.com>
%
%   This program is free software: you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation, either version 3 of the License, or
%   (at your option) any later version.
%
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%
%   You should have received a copy of the GNU General Public License
%   along with this program.  If not, see <https://www.gnu.org/licenses/>.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{base/ajstd}[2020/12/11, version 1.5.3]
\AtEndOfClass{\RequirePackage{microtype}} % For better typography

%   Options for element switching
\RequirePackage{xifthen} % For if arguments
    \DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
    \ProcessOptions*

\LoadClass{extarticle} % Support more font sizes

%   Display line numbers; must comment out \linenumbers for flushend to work
\RequirePackage[switch]{lineno} 
    \linenumberfont{\normalfont\footnotesize\sffamily}

% Page structure
\RequirePackage[inner=22mm,%
                outer=18mm,%
                top=18mm,%
                bottom=18mm,%
                headheight=0mm,%
                headsep=0mm,%
                footskip=8mm,%
                a4paper]{geometry}% Control margins
	\setlength{\columnsep}{8mm} % Distance between columns
\RequirePackage{flushend} % Balance the article's last page

% Paragraph structure
\RequirePackage{setspace}
	\setstretch{1.09} % Body leading; on pages with no figures/tables and headings layout may be broken, so set to 1.0878 on per-paragraph basis using spacing environment
	\edef\restoreparindent{\parindent=\the\parindent\relax} % Maintain indents when using parskip package with \restoreparindent
\RequirePackage{parskip}
	\setlength{\parskip}{0pt plus 0.5pt minus 0pt} % Maintain spaces between paragraphs
	\restoreparindent % Restore indents when using parskip package
	\setlength{\parindent}{16pt} % Indent length
\RequirePackage{enumitem} 
	\setlist[itemize]{noitemsep} % Remove separation between list items
	\setlist[enumerate]{noitemsep} % Remove separation between list items

% Language and fonts
\RequirePackage[english]{babel} % Typographic support for different languages 
\RequirePackage{amsmath,amsfonts,amssymb} % Equations with the AMS group of packages
\RequirePackage{mathpazo} % Use the Pazo Math family in equations
\RequirePackage[T1]{fontenc}
\RequirePackage{url} % For urls
\RequirePackage{hyperxmp} % Enable extra PDF metadata options
\RequirePackage{base/xurl} % Load xurl package (not currently installed on Overleaf) to break urls at the end of lines
\RequirePackage[pdfusetitle,%
				colorlinks=true,%
				allcolors=royalviolet]{hyperref} % For links; includes colours of links
	\hypersetup{%
		pdfcopyright={Copyright © \the\year{} THE AUTHORS. Published under a Creative Commons Attribution-ShareAlike 4.0 International license.}, % Copyright
		pdflicenseurl={https://creativecommons.org/licenses/by-sa/4.0/} % Link to license
	}   
\RequirePackage{lettrine}
\RequirePackage{fontspec} % Set fonts
	\setmainfont[
        Path = base/fonts/,
        Extension = .ttf,
        UprightFont = *-Regular,
        ItalicFont = *-Italic,
        BoldFont = *-Bold,
        BoldItalicFont = *-BoldItalic,
    ]{Lora}
	\setsansfont[
        Path = base/fonts/,
        Extension = .otf,
        UprightFont = *-Regular,
        ItalicFont = *-Italic,
        BoldFont = *-Bold,
        BoldItalicFont = *-BoldItalic,
    ]{FiraSans}
    \newfontfamily\FiraSansLight[
        Path = base/fonts/,
        Extension = .otf,
        UprightFont = *-Regular,
        ItalicFont = *-Italic,
    ]{FiraSansLight}
    \newfontfamily\CormorantSC[
        Path = base/fonts/,
        Extension = .otf,
        UprightFont = *-Regular,
    ]{CormorantSC}
    \RequirePackage[fontsize=8.5pt]{scrextend} % Set default font size to 8.5pt (nb. this is a KOMA-Script package)
%	Font styles
	\newcommand{\journalname}{\normalfont\CormorantSC\fontsize{12.5}{15}\selectfont} % AJSTD wordmark
	\renewcommand{\titlefont}{\normalfont\FiraSansLight\fontsize{13}{16}\selectfont} % Article title
	\newcommand{\toprightinfo}{\normalfont\FiraSansLight\fontsize{8}{10}\selectfont} % Top-right text on first page header
	\newcommand{\basesansfont}{\normalfont\sffamily\fontsize{8}{10}\selectfont} % Abstract, keywords, genesis, and anything else that needs 8-point Fira Sans
	\newcommand{\baselightsansfont}{\normalfont\FiraSansLight\fontsize{8}{10}\selectfont} % Footer content and anything else that needs 8-point Fira Sans Light
	\renewcommand\UrlFont{\rmfamily} % Make \url adhere to default body font (use \url only in references)
\RequirePackage{authblk} % Authors and affiliations
	\setlength{\affilsep}{10pt} % Spacing between list of authors and affiliations
	\renewcommand\Authfont{\normalfont\sffamily\fontsize{10}{12}\selectfont} % Authors
	\renewcommand\Affilfont{\normalfont\sffamily\fontsize{8}{10}\selectfont} % Affiliations
	\renewcommand\AB@affilsepx{\\ \protect\Affilfont}
	\renewcommand\AB@authnote[1]{\textsuperscript{\mdseries\upshape#1}}
	\renewcommand\AB@affilnote[1]{\textsuperscript{\upshape#1}}
	\renewcommand\Authands{, and } % Remove comma when there are only two authors
\RequirePackage{textcomp} % Symbols
\RequirePackage{gensymb} % For the \degree, \celsius, \perthousand, \micro, and \ohm commands
\RequirePackage{datetime} % Dates
	\newdateformat{monthyeardate}{%
		\monthname[\THEMONTH] \THEYEAR}

%   Graphics, tables, and figures
\RequirePackage{graphicx,xcolor}
%	Colours
	\definecolor{black}{RGB}{0,0,0} % Base colour
	\definecolor{royalviolet}{HTML}{610C3A} % AJSTD's violet colour
\RequirePackage{colortbl} % Enable changing colours of tables
\RequirePackage[font={sf,footnotesize},%
                labelfont={color=royalviolet},%
                labelsep=period,%
                figurename=FIGURE,%
                tablename=TABLE,%
                singlelinecheck=off,]{caption} % Captions
\RequirePackage{subcaption}
\RequirePackage{tabularx}
% 	Table style
	\newenvironment{tableminipage}[1]{\begin{minipage}{#1}\renewcommand  \footnoterule{ \kern -1ex}}{\end{minipage}}
	\arrayrulecolor{black} % Colour of horizontal rules
 	\renewcommand{\arraystretch}{1.5} % Table leading
	\captionsetup[table]{position=below} % Reduce spacing below caption
\RequirePackage{booktabs}
\RequirePackage{siunitx}
    \sisetup{detect-all} 
\RequirePackage{tikz}
	\usetikzlibrary{calc}
\RequirePackage{changepage}
\RequirePackage{afterpage} % Prevent content ending abruptly when page is cleared
\RequirePackage{rotating} % For sideways tables and figures
\RequirePackage{stfloats} % Improve figure placement in two column environment
\RequirePackage[absolute,overlay]{textpos} % Enable absolute positioning of figures
	\setlength{\TPHorizModule}{1mm}
	\setlength{\TPVertModule}{1mm}
	\textblockorigin{0mm}{0mm} % Start everything near the top-left corner
	
%   Equations
    \AtBeginDocument{%
        \abovedisplayskip=4pt plus 2pt minus 2pt%
        \abovedisplayshortskip=4pt plus 2pt minus 2pt%
        \belowdisplayskip=12pt plus 2pt minus 2pt%
        \belowdisplayshortskip=12pt plus 2pt minus 2pt%
    }

%	Enable editing of article information in main.tex
	\newcommand{\articleinformation}[1]{\def\articleinformation{#1}} % Volume, issue, year, and pages
	\newcommand{\articleinformationtruncated}[1]{\def\articleinformationtruncated{#1}} % Truncated volume number, issue, and pages
	\newcommand{\articletype}[1]{\def\articletype{#1}} % Article type
    \newcommand{\authorheader}[1]{\def\authorheader{#1}} % Author(s)
	\newcommand{\articledoi}[1]{\def\articledoi{#1}} % DOI
	\newcommand{\submitted}[1]{\def\submitted{#1}} % Date article was submitted
	\newcommand{\submittedname}{\color{royalviolet}SUBMITTED}%
	\newcommand{\revised}[1]{\def\revised{#1}} % Date article was revised
	\newcommand{\revisedname}{\color{royalviolet}REVISED}%
	\newcommand{\accepted}[1]{\def\accepted{#1}} % Date article was accepted
	\newcommand{\acceptedname}{\color{royalviolet}ACCEPTED}%

%   Headers and footers
\RequirePackage{fancyhdr} % Create custom header/footer
    \pagestyle{fancy}
% 	Main header style
	\fancyhead[L]{}
	\fancyhead[R]{}
    \renewcommand{\headrulewidth}{0pt} % No header line 
% 	Main footer style
	\lfoot{}
	\cfoot{}
	\rfoot{}
	\fancyfoot[RO,LE]{\baselightsansfont\thepage\ } % Page number
	\fancyfoot[RE]{\baselightsansfont{\authorheader}}
	\fancyfoot[LO]{\baselightsansfont{ASEAN J SCI TECHNOL DEV \articleinformationtruncated}}
	\renewcommand{\footrulewidth}{0pt} % No footer line
\RequirePackage{lastpage} % Page numbers
%   Header and footer of first page
	\fancypagestyle{firststyle}{%
        \renewcommand{\headrulewidth}{0pt} % No header line 
        \fancyhead[L]{}%
        \fancyhead[R]{}%
        \fancyfoot[L]{%
            \vspace{-2.5mm}\baselightsansfont{%
                A journal of the \href{http://astnet.asean.org/index.php?option=com_content&view=categories&id=8&Itemid=130}{ASEAN Committee on Science and Technology}
            }
        }
        \fancyfoot[R]{\vspace{-2.5mm}\baselightsansfont{\color{royalviolet}PRINT ISSN} 0217-5460 {\color{royalviolet} ONLINE ISSN} 2224-9028 \hspace{6.1mm} \href{http://ajstd.org}{www.ajstd.org}}
        }

%   Sectioning 
	\setcounter{secnumdepth}{3} % Number sections, subsections, and subsubsections
	\setcounter{tocdepth}{3} % If table of contents is shown, both sections and subsections will be listed
\RequirePackage[explicit]{titlesec} % Better handling of section titles
	\titleformat{\section} % Formatting of section titles
 		{\color{royalviolet}\normalfont\sffamily\fontsize{10}{12}\selectfont}
		{\thesection.}
		{0.5em}
		{\MakeUppercase{#1}}
		[]
	\titleformat{name=\section,numberless} % Formatting of unnumbered section titles
		{\color{royalviolet}\normalfont\sffamily\fontsize{10}{12}\selectfont}
		{}
		{0em}
		{#1}
		[]
	\titleformat{\subsection} % Formatting of subsection titles
		{\color{royalviolet}\normalfont\sffamily\fontsize{9}{12}\selectfont}
		{\thesubsection}
		{0.5em}
		{#1}
		[]
	\titleformat{\subsubsection} % Formatting of subsubsection titles
		{\color{royalviolet}\normalfont\sffamily\fontsize{9}{12}\selectfont}
		{\thesubsubsection}
		{0.5em}
		{#1}
		[]
	\titleformat{\paragraph}[runin] % Formatting of paragraph titles
		{\sffamily\small\bfseries}
		{}
		{0em}
		{#1}
	\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{6pt} % Spacing of section titles
	\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{4pt} % Spacing of subsection titles
	\titlespacing*{\subsubsection}{0pc}{2.5ex \@plus5pt \@minus2pt}{4pt} % Spacing of subsubsection titles
	\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{12pt} % Spacing of paragraph titles

%   References
\RequirePackage[round]{natbib} % Use the Natbib package
	\bibpunct{(}{)}{;}{author-year}{}{,} % Citation punctuation
	\bibliographystyle{base/cse} % Use cse.bst
	\addto{\captionsenglish}{\renewcommand{\refname}{REFERENCES}}
	\setlength{\bibsep}{0pt plus 0.5pt minus 0pt} % Spacing between each reference
	\setlength{\bibhang}{16pt} % Reference indentation
	\setcitestyle{aysep={}}

%	Keywords and abstract
	\newcommand{\keywords}[1]{\def\keywords{#1}} % Keywords
    \renewcommand{\abstract}[1]{\def\abstract{#1}} % Abstract
    \newcommand{\abscontent}{%
        \begin{minipage}[t]{0.24\textwidth} % Keywords
            \vskip10pt % Adjust height to align with abstract
            {\basesansfont\color{royalviolet}KEYWORDS}\\\basesansfont\keywords%
            \vskip2mm
            \basesansfont{%
                {\submittedname}\hspace{0.5mm}\submitted\hspace{1.5mm} \\
                {\revisedname}\hspace{0.5mm}\revised\hspace{1.5mm} \\
                {\acceptedname}\hspace{0.5mm}\accepted%
            }
        \end{minipage}
        \begin{minipage}[t]{0.758\textwidth} % Abstract
            {\color{royalviolet}\hrule height1pt width 1\linewidth depth0pt}
            \vskip7.9pt
            {\basesansfont\color{royalviolet}ABSTRACT}\hspace{1mm}\basesansfont\abstract\par
            \vskip8pt
            {\color{royalviolet}\hrule height1pt width 1\linewidth depth0pt}
            \vskip3pt
            \sffamily\fontsize{6.5}{10}\selectfont\copyright\hspace{1pt} The Author(s) \the\year. This article is distributed under a \href{https://creativecommons.org/licenses/by-sa/4.0/}{Creative Commons Attribution-ShareAlike 4.0 International} license.%
        \end{minipage}
    }%

%   Set structure of first page
	\renewcommand{\@maketitle}{\bgroup\setlength{\parindent}{0pt}
	\begin{minipage}{0.2\textwidth}
        \vspace{4pt}\includegraphics[width=29mm]{base/ajstd-logo.pdf}
    \end{minipage}%
    \begin{minipage}{0.8\textwidth}
        \vspace{-2pt}
        \flushright
        \journalname{ASEAN Journal on Science {\color{royalviolet}\&} Technology for Development} \\
        \toprightinfo{%
        \articleinformation \\
        {\color{royalviolet}DOI} \articledoi \\
        {\color{royalviolet}\articletype} \\
        
        }%
    \end{minipage}%
	\begin{flushleft}
    {%
		\vskip25pt%
		{\titlefont \@title\par} % Title
		\vskip16pt%
		{\@author\par} % Author(s)
		\vskip10pt%
	}% 
	\end{flushleft}\egroup
	{%
		\vskip10pt%
		\abscontent % Abstract and keywords
        \vskip27pt % Default is 27pt; modify to fix parskip issues on first page
	}%
}