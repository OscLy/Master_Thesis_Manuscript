\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{dissertation}[2018/01/01 v0.1 Dissertation Class]

\newcommand{\myTitle}{A Mock Tricuspid Valve for Right Heart Simulator}
\newcommand{\myName}{Oscar DALY}
\newcommand{\myUni}{University College Dublin}
\newcommand{\myFaculty}{Biomedical Engineering}
\newcommand{\myKeywords}{Tricuspid Valve, Right Heart Simulator, Mock Circulation Loop}

\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

\LoadClass[%
	a4paper,
	10pt,
	oneside,
]{memoir}
\renewcommand{\footnotesize}{\fontsize{8pt}{9pt}\selectfont}
\renewcommand{\normalsize}{\fontsize{11pt}{17pt}\selectfont}
\fontsize{11pt}{17pt}\selectfont

\RequirePackage{geometry}
% --- Figures -----------------------------------------------------------------
\RequirePackage{subfig}
% --- Fonts -------------------------------------------------------------------
\RequirePackage{libertine}

% first the mathematical one
% ==  mathematical fonts ==
% \RequirePackage{ccfonts}  % mathematical fonts
% \renewcommand{\rmdefault}{cmr}% cmr = Computer Modern Roman
% ==  mathematical fonts ==wa


% set (replace) mathcal font
% see https://tex.stackexchange.com/a/496198/37762
\SetMathAlphabet{\mathcal}{normal}{OMS}{zplm}{m}{n}

% font for \mathtt
\RequirePackage[scaled=.8]{beramono}
% \RequirePackage[scaled]{luximono}

%%% Layout the Page %%%
\setlrmarginsandblock{26mm}{211pt}{*}
\setmarginnotes{9mm}{12pc}{1em}

\setulmarginsandblock{6pc}{8pc}{*}

\setheadfoot{1.25\baselineskip}{10mm}
\setheaderspaces{*}{8mm}{*}

\checkandfixthelayout

%%% Header und Footer Styles
\nouppercaseheads
\makepagestyle{diss}
\makepsmarks{diss}{%
	\nouppercaseheads
	\createmark{chapter}{both}{nonumber}{}{}
	\createmark{section}{right}{nonumber}{}{}
	\createplainmark{toc}{both}{\contentsname}
	\createplainmark{lof}{both}{\listfigurename}
	\createplainmark{lot}{both}{\listtablename}
	\createplainmark{bib}{both}{\bibname}
	\createplainmark{index}{both}{\indexname}
	\createplainmark{glossary}{both}{\glossaryname}
}
\makerunningwidth{diss}[480pt]{480pt}
\makeheadposition{diss}{flushright}{flushleft}{flushright}{flushleft}
\makeevenhead{diss}{\small\thepage\hspace{1em}\textsc{\MakeLowercase\leftmark}}{}{}
\makeoddhead{diss}{}{}{\small\textsc{\MakeLowercase\rightmark}\hspace{1em}\thepage}

\makepagestyle{fullwidth}
\makepsmarks{fullwidth}{%
	\nouppercaseheads
	\createmark{chapter}{both}{nonumber}{}{}
	\createmark{section}{right}{nonumber}{}{}
	\createplainmark{toc}{both}{\contentsname}
	\createplainmark{lof}{both}{\listfigurename}
	\createplainmark{lot}{both}{\listtablename}
	\createplainmark{bib}{both}{\bibname}
	\createplainmark{index}{both}{\indexname}
	\createplainmark{glossary}{both}{\glossaryname}
}
\makerunningwidth{fullwidth}[450pt]{450pt}
\makeheadposition{fullwidth}{flushright}{flushleft}{flushright}{flushleft}
\makeevenhead{fullwidth}{\small\thepage\hspace{1em}\textsc{\MakeLowercase\leftmark}}{}{}
\makeoddhead{fullwidth}{}{}{\small\textsc{\MakeLowercase\rightmark}\hspace{1em}\thepage}

\makepagestyle{plain}
\makerunningwidth{plain}[480pt]{480pt}
\makeheadposition{plain}{flushright}{flushleft}{flushright}{flushleft}
\makeevenfoot{plain}{\small\thepage}{}{}
\makeoddfoot{plain}{}{}{\small\thepage}

\makepagestyle{fullwidthplain}
\makerunningwidth{fullwidthplain}[450pt]{450pt}
\makeheadposition{fullwidthplain}{flushright}{flushleft}{flushright}{flushleft}
\makeevenfoot{fullwidthplain}{\small\thepage}{}{}
\makeoddfoot{fullwidthplain}{}{}{\small\thepage}

\aliaspagestyle{part}{empty}
\aliaspagestyle{chapter}{plain}

\newenvironment{fullwidth}{%
	\newgeometry{inner=26mm, outer=26mm, top=6pc, bottom=102pt}
	\aliaspagestyle{chapter}{fullwidthplain}
	\pagestyle{fullwidth}
}{%
	\restoregeometry
}

% implements a new environment for figures, tables, etc
% that are able to spread the full width of the page,
% while keeping the caption on the side margin
\newlength{\fullwidthlen}
\setlength{\fullwidthlen}{\marginparwidth}
\addtolength{\fullwidthlen}{\marginparsep}
\newenvironment{fullwidthfig}{%
	\begin{adjustwidth*}{}{-\fullwidthlen}%
		}{%
	\end{adjustwidth*}%
}

% Example on how to use the fullwidthfig env
% \begin{figure}[t]
%   \begin{fullwidth}
%     \includegraphics[width=\linewidth+\marginparsep]{demo}
%   \end{fullwidth}
%   \vspace{-\baselineskip}\vspace{-\baselineskip}
%   \sideparmargin{outer}
%   \sidepar{\vspace{\baselineskip}
%     \caption{Caption for a full-width figure appearing in the margin
%       below it.}}
% \end{figure}

\pagestyle{diss}

%%% Part Style %%%
\renewcommand{\partnamefont}{\normalfont\Large}
\renewcommand{\partnumfont}{\normalfont\Large}
\renewcommand{\parttitlefont}{\normalfont\Large\color{Burgundy}\MakeTextUppercase}

%%% Chapter Style %%%
\setlength{\beforechapskip}{0pt}
\renewcommand{\chapnumfont}{\fontsize{72pt}{96pt}\selectfont\color{chapnumcolor}}
\renewcommand{\chaptitlefont}{\huge\rmfamily\itshape\color{darkgray}}
\renewcommand*{\printchaptername}{\chapnumfont}
\renewcommand*{\afterchaptertitle}{\par\nobreak\vspace*{-10pt}\hrulefill\vskip\afterchapskip}
\setlength{\afterchapskip}{\baselineskip}

%%% ToC Style %%%
\newlength{\aftertocskip}
\renewcommand*{\aftertoctitle}{\par\nobreak\vspace*{-10pt}\hrulefill\vskip\aftertocskip}

%%% Section and Subsection Style %%%
\setsecheadstyle{\normalfont\large\scshape}
\setsubsecheadstyle{\normalfont\large\itshape}
\setsecnumformat{\llap{\small\upshape\csname #1secnumformat\endcsname}}
\newcommand\sectionsecnumformat{\thesection\quad}
\newcommand\subsectionsecnumformat{\thesubsection\quad}
\setaftersecskip{\baselineskip}

%%% Paragraph Style %%%
\setparaheadstyle{\scshape}
\setbeforeparaskip{1em}
\setafterparaskip{-0.5em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DEDICATION
\newenvironment{dedication}
{\clearpage           % we want a new page
	\thispagestyle{empty}% no header and footer
	\vspace*{\stretch{1}}% some space at the top
	\itshape             % the text is in italics
	\raggedleft          % flush to the right margin
}
{\par % end the paragraph
	\vspace{\stretch{3}} % space at bottom is three times that at the top
	\clearpage           % finish off the page
}


% --- ITEMIZE and ENUMERATE STYLE ---------------------------------------------
% \RequirePackage{enumitem}
\renewcommand\labelitemi{$\vcenter{\hbox{\small$\bullet$}}$}

%%% ToC Styling %%%
\RequirePackage{ragged2e}
% \settocdepth{subsubsection}
\setsecnumdepth{subsubsection}

\renewcommand{\cftpartfont}{%
	\bfseries\color{Burgundy}\MakeTextUppercase%
}
\settocpreprocessor{part}{%
	\let\tempf@rtoc\f@rtoc%
	\def\f@rtoc{%
		\texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
}
\renewcommand{\cftpartformatpnum}[1]{\small #1}
\renewcommand{\cftchapterformatpnum}[1]{\small #1}
\renewcommand{\cftsectionformatpnum}[1]{\small #1}
\renewcommand{\cftsubsectionformatpnum}[1]{\small #1}
\renewcommand{\cftchapterafterpnum}{\vspace{2pt}}
\renewcommand{\cftsectionafterpnum}{\vspace{2pt}}
\renewcommand{\cftsubsectionafterpnum}{\vspace{2pt}}

\renewcommand{\cftchapterfont}{%
	\scshape\MakeTextLowercase%
}
\settocpreprocessor{chapter}{%
	\let\tempf@rtoc\f@rtoc%
	\def\f@rtoc{%
		\texorpdfstring{\MakeTextLowercase{\tempf@rtoc}}{\tempf@rtoc}}%
}

% https://tex.stackexchange.com/questions/275565/tufte-layout-in-painless-memoir
% Attention: does not work when \sidebar is used
% \RequirePackage{marginfix}
% Apparently marginfix seems two swollow some notes:
% https://tex.stackexchange.com/questions/352596/package-marginfix-swallows-some-margin-notes

% Margin Notes like Footnotes:
% http://latex.org/forum/viewtopic.php?t=11761
% Extra Space with marginnotes
% https://tex.stackexchange.com/questions/315258/prevent-marginnote-from-creating-extra-paragraph
% Aligning marginnotes
% https://tex.stackexchange.com/questions/36554/vertically-aligning-a-marginnote-and-a-section-title
\RequirePackage{marginnote}
\newcounter{sidenote}
\providecommand\sidenote[1]{%                             a simple margin note
	\refstepcounter{sidenote}%                            step counter
	\mbox{\textsuperscript{\thesidenote}}%                the number (superscript) in text
	\marginpar{\footnotesize\mbox{\textsuperscript{\thesidenote}}#1}% the note
}
\footnotesinmargin
\setlength{\footmarkwidth}{0.8em}
\setlength{\footmarksep}{-\footmarkwidth}
\setlength{\footparindent}{1em}
\renewcommand{\foottextfont}{\footnotesize}

\setsidecaps{\marginparsep}{\marginparwidth}
\sidecapmargin{outer}
\setsidecappos{c}

%https://tex.stackexchange.com/questions/428891/sidecaption-in-memoir-in-wrong-margin-when-floated-to-next-page
\strictpagechecktrue

\renewcommand{\fnum@figure}{\footnotesize\textsc{\figurename~\thefigure}}
\renewcommand{\fnum@table}{\footnotesize\textsc{\tablename~\thetable}}
\renewcommand*{\sidecapstyle}{%
	\ifscapmargleft
		\captionstyle{\raggedleft\footnotesize}%
	\else
		\captionstyle{\raggedright\footnotesize}%
	\fi}

% \newsubfloat{figure}
\newfixedcaption[\subcaption]{\subfigcaption}{figure}

\RequirePackage[font=footnotesize]{caption}

\newcommand{\openepigraph}[2]{%
\marginpar{%
\footnotesize
\flushright%
\enquote{\textit{#1}}%
\vspace{1mm}
\linebreak
{\raggedleft{\hfill{}---{#2}}}% author
}
}

\providecommand\blankpage{\newpage\hbox{}\thispagestyle{empty}\newpage}
\providecommand\setinputpath[1]{%
	\makeatletter
	\def\input@path{{#1}}
	\graphicspath{{#1}}
	\makeatother
}

\newskip\newthoughtskipamount
\newthoughtskipamount=1.0\baselineskip plus 0.5ex minus 0.2ex
\providecommand\newthoughtbreak{\par\ifdim\lastskip<\newthoughtskipamount
		\removelastskip\penalty-100\newthoughtskip\fi}

% --- Tufte's newthoughts ------------------------------------------------------
% --- Aaron's newthought I: with triangle
\newcommand{\newthoughtskip}{\vspace\newthoughtskipamount}
\providecommand\newthought[1]{%
	\nopagebreak
	\newthoughtbreak
	\noindent%
	{\llap{\color{black!30}\scriptsize\raisebox{1pt}{$\blacktriangleright$}\quad}}%
	\textsc{#1}%
}
% --- Aaron's newthought II: with linebreak
\providecommand\newthoughtpar[1]{\nopagebreak\newthought{#1}\par\nopagebreak\noindent\ignorespaces}

% --- Diego's newthought:
% used for dichotomies
\providecommand\dichotomy[1]{%
	\nopagebreak
	\newthoughtbreak
	\noindent%
	%{\llap{\color{black!50}\scriptsize\raisebox{1pt}{$\overset{\text{\footnotesize\scrD}}{\rightleftarrows}$}\quad}}%
	{\llap{\color{black!50}\scriptsize\raisebox{1pt}{$\rightleftarrows$}\quad}}%
	\textsc{#1}%
}
\providecommand\conclusion[1]{%
	\nopagebreak
	\newthoughtbreak
	\noindent%
	%{\llap{\color{black!50}\scriptsize\raisebox{1pt}{$\overset{\text{\footnotesize\scrD}}{\rightleftarrows}$}\quad}}%
	{\llap{\color{myorange}\scriptsize\raisebox{1pt}{\faAsterisk}\quad}}%
	\textsc{#1}%
}
\providecommand\mynewline{%
	\nopagebreak
	\newthoughtbreak
	\noindent%
}
\providecommand\questionpar[1]{%
	\nopagebreak
	\newthoughtbreak
	\noindent%
	{\llap{\color{black!50}\scriptsize\raisebox{1pt}{$\boldsymbol{?}$}\quad}}%
	\textcolor{mygray}{\textsc{#1}}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[
	hyperref=true,
	maxbibnames=20,
	maxcitenames=2,
	%giveninits=true,
	% style= apa,%alphabetic,
	style=authoryear,
	sorting=none,
	sortcites=true,
	citetracker=true,
	pagetracker=true,
	backref,
]{biblatex}

\AtEveryBibitem{
	\clearfield{url}
	\clearfield{urlyear}
}
\DeclareSourcemap{
	\maps[datatype=bibtex]{
		\map{
			\step[fieldset=urldate, null]
		}
	}
}

\renewcommand*{\bibfont}{\normalfont}

\DeclareBibliographyCategory{publications}
\DeclareBibliographyCategory{paper-slp}
\DeclareBibliographyCategory{paper-bison}
\DeclareBibliographyCategory{paper-subspacetrail}
\DeclareBibliographyCategory{sagetickets}

\DeclareFieldFormat{eprint:iacr}{%
	\mkbibacro{iacr preprint}\addcolon\space{}
	\href{https://eprint.iacr.org/#1}{\nolinkurl{#1}}
}
\DeclareFieldFormat{eprint:iacrconf}{%
	\mkbibacro{iacr}\addcolon\space{}
	\href{https://www.iacr.org/archive/#1}{\nolinkurl{#1}}
}

% https://tex.stackexchange.com/questions/74931/biblatexs-textcite-inserts-a-breaking-space-between-author-names-and-citation-n
\renewcommand{\namelabeldelim}{\addnbspace}

% https://tex.stackexchange.com/a/444830/37762
\newcommand*{\scbx@registerkey}{%
	\ifcsundef{cbx@instcount@curr@\the\c@refsection @\thefield{entrykey}}
	{\csnumgdef{cbx@instcount@curr@\the\c@refsection @\thefield{entrykey}}{0}}
	{}%
	\csnumgdef{cbx@instcount@last@\the\c@refsection @\thefield{entrykey}}{%
		\csuse{cbx@instcount@curr@\the\c@refsection @\thefield{entrykey}}}%
	\csnumgdef{cbx@instcount@curr@\the\c@refsection @\thefield{entrykey}}{\value{instcount}}}

\def\iflastciteonsamepage{%
	\ifsamepage
	{\number\csuse{cbx@instcount@curr@\the\c@refsection @\thefield{entrykey}}}
	{\number\csuse{cbx@instcount@last@\the\c@refsection @\thefield{entrykey}}}}

\newcommand*{\scbx@savepunctstate}{%
	\let\scbx@saved@unitpunct\blx@unitpunct
	\let\scbx@saved@tgl@unit\etb@tgl@blx@unit
	\let\scbx@saved@tgl@block\etb@tgl@blx@block
	\let\scbx@saved@tgl@insert\etb@tgl@blx@insert
	\let\scbx@saved@tgl@lastins\etb@tgl@blx@lastins
	\let\scbx@saved@tgl@keepunit\etb@tgl@blx@keepunit
}

\newcommand*{\scbx@restorepunctstate}{%
	\global\let\blx@unitpunct\scbx@saved@unitpunct
	\global\let\etb@tgl@blx@unit\scbx@saved@tgl@unit
	\global\let\etb@tgl@blx@block\scbx@saved@tgl@block
	\global\let\etb@tgl@blx@insert\scbx@saved@tgl@insert
	\global\let\etb@tgl@blx@lastins\scbx@saved@tgl@lastins
	\global\let\etb@tgl@blx@keepunit\scbx@saved@tgl@keepunit
}

\newcommand*{\scbx@resetpunctstate}{%
	\let\blx@unitpunct\@empty
	\global\togglefalse{blx@block}%
	\global\togglefalse{blx@unit}%
	\global\togglefalse{blx@insert}%
	\global\togglefalse{blx@lastins}%
	\global\togglefalse{blx@keepunit}%
}

\newbibmacro{sidecite}{%
	\scbx@savepunctstate
	\scbx@resetpunctstate
	\marginpar{%
		\toggletrue{blx@footnote}%
		\footnotesize%
		\printtext[labelalphawidth]{%
			\printfield{labelprefix}%
			\printfield{labelalpha}%
			\printfield{extraalpha}}
		\setunit{\addnbspace}%
		\printnames{labelname}%
		\setunit{\printdelim{nametitledelim}}%
		\printfield[citetitle]{title}%
	}%
	\scbx@restorepunctstate
}

\DeclareCiteCommand{\cite}[\mkbibbrackets]
{\usebibmacro{prenote}}
{\scbx@registerkey
	\ifciteindex
	{\indexfield{indextitle}}
	{}%
	\usebibmacro{cite}%
	\iflastciteonsamepage
	{}%what is 
	{\usebibmacro{sidecite}}}
{\multicitedelim}
{\usebibmacro{postnote}}

\DeclareCiteCommand{\citeonly}[\mkbibbrackets]
{\usebibmacro{prenote}}
{\ifciteindex
	{\indexfield{indextitle}}
	{}%
	\usebibmacro{cite}}
{\multicitedelim}
{\usebibmacro{postnote}}

\DeclareCiteCommand{\cbx@textcite}
{\usebibmacro{textcite:init}}
{\scbx@registerkey
	\usebibmacro{citeindex}%
	\usebibmacro{textcite}%
	\iflastciteonsamepage
	{}
	{\usebibmacro{sidecite}}}
{}
{\usebibmacro{textcite:postnote}}

% full cite with all the names
\DeclareCiteCommand{\fullcite}
{\usebibmacro{prenote}}
{\usedriver
	{\defcounter{minnames}{6}%
		\defcounter{maxnames}{6}}
	{\thefield{entrytype}}}
{\multicitedelim}
{\usebibmacro{postnote}}

\RequirePackage{microtype}

% --- float ---
%
% Support for arrangement of figures and tables
%
\usepackage{float}

% --- Algorthims ----
% \usepackage{algorithm}
\usepackage[noend]{algpseudocode}
\newcommand*\Let[2]{\State{} #1 $\gets$ #2}
\algrenewcommand\alglinenumber[1]{%
	{\sffamily\footnotesize#1}}
\algrenewcommand\algorithmicrequire{\textbf{Precondition:}}
\algrenewcommand\algorithmicensure{\textbf{Postcondition:}}
\usepackage[algoruled, linesnumbered, onelanguage]{algorithm2e}


% --- Code Listing ----
% \RequirePackage[newfloat]{minted}
% \newminted{c}{mathescape, linenos=true, numberblanklines=false, fontsize=\footnotesize}
% \newminted{sage}{mathescape, linenos=true, numberblanklines=false, fontsize=\footnotesize}
% \newenvironment{clisting}{\captionsetup{type=listing}}{}
% \newenvironment{sagelisting}{\captionsetup{type=listing}}{}
% \SetupFloatingEnvironment{listing}{name=Code}

%% make listings numbers non-copy-able
%\RequirePackage{accsupp}
%\newcommand{\noncopynumber}[1]{%
%    \BeginAccSupp{method=escape,ActualText={}}
%    #1
%    \EndAccSupp{}
%}
\RequirePackage{xcolor}
\RequirePackage{booktabs}
\RequirePackage{colortbl}
\RequirePackage{tabularx}
\RequirePackage{makecell} % provide \makecell for multirow/column cells
\RequirePackage{multirow}
\RequirePackage{paralist}
\RequirePackage{threeparttable}

\RequirePackage[section]{placeins}

% --- COLORS ------------------------------------------------------------------
% \usepackage{xcolor}

\definecolor{Burgundy}{RGB}{144, 0, 32}
\definecolor{RoyalBlue}{cmyk}{1,0.5,0,0}
\definecolor{Black}{cmyk}{0,0,0,0}
\definecolor{alertred}{rgb}{0.80,0.12,0.12}
\definecolor{linkgreen}{RGB}{0,166,0}
\definecolor{mygray}{gray}{0.55}
\definecolor{myorange}{HTML}{ed8c01}
%define colors
\definecolor{lightgray}{rgb}{0.8, 0.8, 0.8} %grid of coordinate system, axes
\definecolor{midgray}{rgb}{0.6, 0.6, 0.6} %layer of border
\definecolor{darkgray}{rgb}{0.4, 0.4, 0.4} %curves, fill under curve

\colorlet{citecolor}{mygray}
\colorlet{linkcolor}{myorange}
\colorlet{urlcolor}{mygray}
\colorlet{acrocolor}{myorange}
\colorlet{chapnumcolor}{mygray}



% \RequirePackage{csquotes}

%%% Math Stuff %%%
\RequirePackage{amsmath, amsthm}
\RequirePackage{mathtools,empheq}


% --- HyperRef and links  --- %
\RequirePackage{hyperref}
\hypersetup{%
	linktocpage,
	%   bookmarks,
	bookmarksdepth = section,
	colorlinks = true,
	linkcolor = linkcolor,
	urlcolor = urlcolor,
	citecolor = citecolor,
	pdfpagelayout=TwoPageLeft,
	pdftitle={\myTitle},%
	pdfauthor={\myName, \myUni, \myFaculty},%
	% pdfsubject={},%
	pdfkeywords={\myKeywords},%
	pdfcreator={pdfLaTeX},%w   
	pdfproducer={LaTeX with hyperref and classicthesis}%
}

\RequirePackage[capitalise,nameinlink]{cleveref}
\crefname{section}{§}{§§}
\Crefname{section}{§}{§§}

\RequirePackage[hyperfirst=true,sort=def,acronym,toc,symbols,indexonlyfirst]{glossaries-extra}
% \RequirePackage[needspace]
% \newcommand{\ensurefullparagraph}[1][5]{%
%     \needspace{#1\baselineskip}
% }

% newtheorems have to be declared after loading cleveref
% https://tex.stackexchange.com/a/19106/37762
\theoremstyle{definition}
\newtheorem{definition}{Definition}
\newtheorem{example}[definition]{Example}
\newtheorem{exercise}[definition]{Exercise}
\newtheorem{property}[definition]{Property}
\newtheorem{question}[definition]{Question}
\newtheorem{solution}[definition]{Solution}

\theoremstyle{plain}
\newtheorem{theorem}[definition]{Theorem}
\newtheorem{proposition}[definition]{Proposition}
\newtheorem{problem}[definition]{Problem}
\newtheorem{lemma}[definition]{Lemma}
\newtheorem{conjecture}[definition]{Conjecture}
\newtheorem{corollary}[definition]{Corollary}
\newtheorem*{claim}{Claim}
\newtheorem{assumption}[definition]{Assumption}
\newtheorem{hypothesis}[definition]{Hypothesis}
\newtheorem{heuristic}[definition]{Heuristic}

\theoremstyle{remark}
\newtheorem{remark}[definition]{Remark}
\newtheorem{note}[definition]{Note}
\newtheorem{case}[definition]{Case}

\theoremstyle{plain}

\crefname{example}{Example}{Examples}

\crefname{theorem}{Theorem}{Theorems}
\crefname{proposition}{Proposition}{Propositions}
\crefname{problem}{Problem}{Problems}
\crefname{lemma}{Lemma}{Lemmata}
\crefname{conjecture}{Conjecture}{Conjectures}
\crefname{corollary}{Corollary}{Corollaries}
\crefname{claim}{Claim}{Claims}
\crefname{assumption}{Assumption}{Assumptions}
\crefname{hypothesis}{Hypothesis}{Hypotheses}
\crefname{heuristic}{Heuristic}{Heuristics}

\crefname{property}{Property}{Properties}
\crefname{figure}{Figure}{Figures}

\newcommand{\crefName}[1]{\cref{#1} (\nameref{#1})}
