% msuthesis.cls Mississippi State University thesis class
% Reference Guidelines, May 1999 (Page numbers given below.)
% revised 2007 Standards for Preparing Theses and Dissertations
%% this template by Edward B. Allen
%% Acknowledgments
%%  ut-thesis.cls by Francois Pitt (fpitt@cs.utoronto.ca>,
%%  prior MSU thesis classes by:
%%    Puri Bangalore
%%    Edward Luke
%%    Jingwei Lu 
%%    Zhengzhu Feng
% Updates:
% 4/23/08 per complaints from MSU library:
%          made top margin of title page 3.5in
%          made distance from author name to degree description on title page 1.5in
%          added blank line after chapter line in table of contents
%          left top margin of abstract at 1 inch per p.35 of Standard
%          left headings numbered in the same font instead of different fonts (e.g. italics) per p.55
% 2/24/2003 added \Tablewithfigure, \Tabledblwithfigure, \rotatedtablewithfigure
% 2/24/2003 changed font of subsection and subsubsection per MSU library preference.
% 3/8/06 changed font of subsubsection to be italics, not bold per MSU library preference.
% 3/9/06 added vertical space between caption and table text to achieve one blank line per MSU
% 5/17/07 revise to conform to 2007 version of MSU  "Standards for Preparing Theses and Dissertations"
%          Reversed changes 2/24/03 and 3/8/06.
%          eba prefers arabic chapter numerals
% 6/11/09 revised to conform to current measurement practices of MSU Library
%          Top margin of  first page of each chapter and chapter-like heading
%          vertical spacing of title page
%          Top margin of abstract page
%          2 lines between chapter title and paragraph

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{msuthesis}[2012/02/15 MSU thesis class]

%options%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[letterpaper,12pt,oneside,onecolumn,openany,final,titlepage]{book}

%12pt option%%%%%
%Large is 17pt
%\setlength{\parindent}{1.5em}  %bk12.clo default

%packages%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen}
\RequirePackage{theorem}
\RequirePackage[dvips]{graphicx}    %MSU%%%for MSU figures (epsf obsolete)
\RequirePackage{xspace}             %MSU%%%for misc commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{%
\bibliographystyle{msucs}
\settocindents
}
\AtEndDocument{
\label{page:lastpage}
}

%declarations%%%%%%%%%%%%%%%%%%%%%%%%%%%

%margin declarations%%%%%thanks to Edward Luke.  
\setlength{\topmargin}{0in}   %MSU%%% 1in
\setlength{\textheight}{8.74in} %11in-1in-.25in-1in
%\setlength{\textheight}{8.4in} %11in-1in-12pt-12pt-.25in-1in
\setlength{\oddsidemargin}{0.53in} %MSU%%%>=1.5in 
\setlength{\textwidth}{5.95in} %MSU%%%right margin >=1in 
\setlength{\headheight}{0pt} %%%MSU 5/17/07%%%%prior value 12pt one line for page number
\setlength{\headsep}{0pt}    %%%MSU 5/17/07%%%%prior value 12pt one blank line for page number
\setlength{\footskip}{.25in}  %MSU%%% 
\setlength{\footnotesep}{16.8pt} %MSU%%%2x value in bk12.clo for blank line between footnotes

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \newspacing changes line spacing on the fly.  For example:
%       \newspacing{1}   produces single spacing
%       \newspacing{2.5}   does 2 1/2 spacing
% and so on.   This takes effect for the current paragraph, and obeys the usual
% scoping rules.  Thus if you put it inside a {...} group or within some
% environment (like description, quote, etc) you'll revert to the previous line
% spacing when you leave the group or environment.
\def\newspacing#1{%
  \def\baselinestretch{#1}\ifx\@currsize\normalsize %
  \@normalsize \else \@currsize\fi%
}   
\newcommand{\singlespacing}{1}
\newcommand{\defaultspacing}{2} %MSU%%% double spacing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%line breaking declarations%%%%%
\widowpenalty=50000      %MSU%%% widows and orphans not allowed
\clubpenalty=50000
\displaywidowpenalty=50000

%float declarations%%%%%%%
\setcounter{topnumber}{10}        %MSU%%%very large number of floats per page
\setcounter{bottomnumber}{10}     %MSU%%%very large number of floats per page
\setcounter{totalnumber}{10}      %MSU%%%very large number of floats per page
\renewcommand{\topfraction}{0.5}  %MSU%%% p.11 largest float is 50% of page
\renewcommand{\bottomfraction}{0.5}
\renewcommand{\textfraction}{0.4}
\renewcommand{\floatpagefraction}{0.5}
\setlength{\floatsep}{2\baselineskip} %MSU%%% p.11 2 blank lines around float
\setlength{\textfloatsep}{2\baselineskip}
\setlength{\intextsep}{2\baselineskip} 
\setlength{\dblfloatsep}{2\baselineskip}
\setlength{\dbltextfloatsep}{2\baselineskip}
\newlength{\figwidth}
\newlength{\tabwidth}
\newlength{\tmplen}

%definitions%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\dedicationname}{Dedication}
\newcommand{\acknowledgmentsname}{Acknowledgments} %American spelling
\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\listtablename}{List of Tables}
\newcommand{\listofsymbolsname}{List of Symbols}
\renewcommand{\bibname}{References}
\renewcommand{\figurename}{Figure}
\renewcommand{\tablename}{Table}
\renewcommand{\chaptername}{Chapter}
\renewcommand{\appendixname}{Appendix}


%definitions for major subdivisions%%%%%%%%%%%%%%%%%%%%%%%%
%
\renewcommand\frontmatter{%
\clearpage
\@mainmatterfalse
\pagenumbering{roman}
\pagestyle{empty}
}
\renewcommand\mainmatter{%
\clearpage
\@mainmattertrue
\newspacing{\defaultspacing}
\pagenumbering{arabic}
\markright{}
\pagestyle{plain} %%%MSU 5/17/07%%% all page number bottom center
\addtocontents{toc}{\par\mbox{}} %MSU%%%blank line p.31
\addtocontents{toc}{\par\noindent\MakeUppercase{\protect\chaptername}}
}
\renewcommand\backmatter{%
\clearpage
\@mainmatterfalse
}
\renewcommand\appendix{ 
%MSU/CS%%%appendices should be placed after references i.e. backmatter
\@mainmattertrue            %appendix similar to chapter
\setcounter{chapter}{0}%
\setcounter{section}{0}%
\renewcommand\@chapapp{\appendixname}%
\renewcommand{\thechapter}{\Alph{chapter}}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\theequation}{\thechapter.\arabic{equation}} %MSU%%%A is prefix.
\addtocontents{toc}{\par\mbox{}} %MSU%%%blank line p.31
\addtocontents{toc}{\par\noindent\MakeUppercase{\protect\appendixname}}
}

%%%title page definitions%%%MSU%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand{\booktitle}{Nuclear Transparency of Kaons}
\newcommand{\booktitletwo}{}
\newcommand{\booktitlethree}{}
\newcommand{\authorname}{Nuruzzaman}
\newcommand{\doctypearticle}{A\xspace} %A or An
\newcommand{\doctype}{***Doctype missing***} %Dissertation, Thesis, Project, etc.
\newcommand{\university}{Mississippi State University} %default
\newcommand{\department}{Department of Physics and Astronomy}
\newcommand{\major}{Nuclear Physics}
\newcommand{\degree}{Master of Science}
\newcommand{\city}{Mississippi State}  %default
\newcommand{\state}{Mississippi}       %default
\newcommand{\degreemonth}{May}
\newcommand{\degreeyear}{2009}
\newcommand{\kwlist}{} %%%%MSU 5/17/07%%% key words allowed
\newcommand{\UpperBookTitle}{%
   \MakeUppercase{\booktitle}
   \settowidth{\tmplen}{\protect\booktitletwo}
   \ifthenelse{\tmplen>0}{%
   \\
   \MakeUppercase{\booktitletwo}
   }{}
   \settowidth{\tmplen}{\booktitlethree}
   \ifthenelse{\tmplen>0}{%
   \\
   \MakeUppercase{\booktitlethree}
   }{}
}
\newlength{\titletopspace}
\setlength{\titletopspace}{2.0in} %default to achieve 3.5 to 4.0 inches
\newcommand{\maketitlepage}{%
\clearpage
%this page counts as page i %MSU%%%p.10
\newspacing{\defaultspacing}
\vspace*{\fill}
%%%\vspace*{\titletopspace}
\begin{center}
\UpperBookTitle
\par\vspace{0.75in} %%%MSU 4/23/08
By\\
\authorname
\par\vspace{1.5in} %%%MSU 04/23/08 require 1.5 inches
\newspacing{\singlespacing}
\doctypearticle \doctype\\
Submitted to the Faculty of\\
Mississippi State University\\
in Partial Fulfillment of the Requirements\\
for the Degree of {\degree}\\
in {\major}\\
in the {\department}
\par\vspace{2\baselineskip}
Mississippi State, Mississippi\\
\vspace{\baselineskip}
{\degreemonth}\ {\degreeyear}
\end{center}
}

%%%copyright page definitions%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand{\copyrightholder}{\authorname}
\newcommand{\copyrightyear}{\degreeyear}
\newcommand{\copyrightpage}{
\clearpage
\thispagestyle{empty}
\newspacing{\defaultspacing}
\vspace*{\fill}   %MSU%%%vertically centered p.25
\begin{center}
\thispagestyle{empty} 
\addtocounter{page}{-1} %MSU%%%don't count this page p.9
Copyright by \\
{\copyrightholder} \\
{\copyrightyear} \\
\mbox{}
\end{center}
\vspace*{\fill}
}

%%%approval page definitions%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newlength{\sigwidth}
\setlength{\sigwidth}{2.8in}       %MSU%%%default
\newlength{\sigheight}
\setlength{\sigheight}{0.5in}      %MSU%%%default
% this command adjusts the distance from the title to the author's
% name. if you have <= 6 signatures, you shouldn't need to change
% this. if you have more than 6, you can set this to something smaller
% to leave more space for signatures
\newlength{\sigtitletoauthor}
\setlength{\sigtitletoauthor}{0.8in} %MSU%%%default value
% this one sets the distance from the author name to the word
% ``approved'', for the same purpose as \sigtitletoauthor
\newlength{\sigauthortoapproved}
\setlength{\sigauthortoapproved}{0.3in} %MSU%%% default
\newcommand{\approvals}{%
\clearpage
\thispagestyle{empty} 
\newspacing{\defaultspacing}
\addtocounter{page}{-1}  %MSU%%%don't count this page p.9
\begin{center}
\UpperBookTitle            %MSU%%%p.15
\par\vspace{\sigtitletoauthor}
By\\                       %MSU%%%p.26
\authorname                %MSU%%%p.15
\end{center}
\vspace{\sigauthortoapproved}
\par\noindent{\raggedright Approved:}
\par\newspacing{\singlespacing}
}
\newcommand{\signature}[4]{%
  \parbox[t]{\sigwidth}{%
    \rule{0in}{\sigheight}\rule{\sigwidth}{1pt}
    \settowidth{\tmplen}{#1}
    \ifthenelse{\tmplen>0}{#1}{}  
    \settowidth{\tmplen}{#2}
    \ifthenelse{\tmplen>0}{\\#2}{}  
    \settowidth{\tmplen}{#3}
    \ifthenelse{\tmplen>0}{\\#3}{}  
    \settowidth{\tmplen}{#4}
    \ifthenelse{\tmplen>0}{\\#4}{}  
  }
}

%%%abstract page definitions%%%MSU%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand{\degreeday}{***degreeday missing***}
\newcommand{\majorprofessor}{***majorprofessor missing***}
\newcommand{\thesisdirector}{} %default same as major professor
\newcommand{\abstracttitle}{%
   \MakeUppercase{\booktitle}
   \MakeUppercase{\booktitletwo}
   \MakeUppercase{\booktitlethree}
}
\newcommand{\abstractpage}{%
  \clearpage
  \newspacing{\defaultspacing}
%MSU%%%top margin 1.0in p.35 No special adjustment needed
\par\noindent 
Name: \authorname \\
Date of Degree: \degreemonth\ \degreeday, \degreeyear \\
Institution: \university \\
Major Field: \major \\
Major Professor: \majorprofessor \\
\settowidth{\tmplen}{\thesisdirector}
\ifthenelse{\tmplen>0}{%
   Director of \doctype: 
   \thesisdirector \\
   }{}
\setlength{\tmplen}{\textwidth}
\addtolength{\tmplen}{-1.2in}
Title of Study: \parbox[t]{\tmplen}{%
\newspacing{\singlespacing}
\abstracttitle\\ \mbox
}\\
Pages in Study: 86\\ %\pageref{page:lastpage} \\
Candidate for Degree of \degree  
\par\vspace{0.5\baselineskip}   %MSU%%%two blank lines before abstract p.27
}{
%abstract text follows abstract command
}

%%%dedication page definitions%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand{\dedication}{  
\newspacing{\defaultspacing}
\chapter*{\dedicationname}%
%abstract was end of pages without page numbers
\setcounter{page}{2} %MSU%%%title page is page 1, other pages not counted
\pagestyle{plain}    %MSU%%%show page number at bottom of page
\addtocontents{toc}{\par\mbox{}} %MSU%%%blank line p.31 
\addcontentsline{toc}{chapter}%
   {\MakeUppercase{\protect\dedicationname}}%
\vspace{-0.5\baselineskip}  %MSU%%%2 blank lines between title and paragraph
}

%%%acknowledgments page definitions%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand{\acknowledgments}{%
\newspacing{\defaultspacing}
\chapter*{\acknowledgmentsname}
\pagestyle{plain}
\addtocontents{toc}{\par\mbox{}} %MSU%%%blank line p.31 
\addcontentsline{toc}{chapter}%
   {\MakeUppercase{\protect\acknowledgmentsname}}%
\vspace{-0.5\baselineskip}  %MSU%%%2 blank lines between title and paragraph
}

%%%toc, lot, lof, los definitions%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\setcounter{tocdepth}{3}  %MSU%%%default
%MSU/CS%%% spacing in toc 
\newlength{\tocspace}
\newlength{\maxchapwidth}
\newlength{\maxsectwidth}
\newlength{\maxsubsectwidth}
\newlength{\maxsubsubsectwidth}
\newlength{\maxtabnowidth}
\newlength{\maxfignowidth}
\newlength{\tocchapindent}
\newlength{\tocsectindent}
\newlength{\tocsubsectindent}
\newlength{\tocsubsubsectindent}
\newlength{\tocparaindent}
\newlength{\tocsubparaindent}
\newlength{\tocchaptitleindent}
\newlength{\tocsecttitleindent}
\newlength{\tocsubsecttitleindent}
\newlength{\tocsubsubsecttitleindent}
\newlength{\tocparatitleindent}
\newlength{\tocsubparatitleindent}
\setlength{\tocspace}{1em}
\settowidth{\maxchapwidth}{\normalfont XVII.}            %default
\settowidth{\maxsectwidth}{\normalfont 10.00}             %default
\settowidth{\maxsubsectwidth}{\normalfont 10.00.00}       %default
\settowidth{\maxsubsubsectwidth}{\normalfont 10.00.00.00} %default
\settowidth{\maxtabnowidth}{10.00}                        %default
\settowidth{\maxfignowidth}{10.00}                        %default

%MSU%%%chapter numbers aligned on period: adjust lengths. p.31
%MSU%%%sections indented p.31
\newcommand{\settocindents}{%
%calculate chap indents
\setlength{\tocchapindent}{0em}
\setlength{\tocchaptitleindent}{\maxchapwidth}
\addtolength{\tocchaptitleindent}{\tocspace}
%calculate section indents
\setlength{\tocsectindent}{\tocchapindent}
\addtolength{\tocsectindent}{\tocchaptitleindent}
\setlength{\tocsecttitleindent}{\maxsectwidth}
\addtolength{\tocsecttitleindent}{\tocspace}
%calculate subsection indents
\setlength{\tocsubsectindent}{\tocsectindent}
\addtolength{\tocsubsectindent}{\tocsecttitleindent}
\setlength{\tocsubsecttitleindent}{\maxsubsectwidth}
\addtolength{\tocsubsecttitleindent}{\tocspace}
%calculate subsubsection indents
\setlength{\tocsubsubsectindent}{\tocsubsectindent}
\addtolength{\tocsubsubsectindent}{\tocsubsecttitleindent}
\setlength{\tocsubsubsecttitleindent}{\maxsubsubsectwidth}
\addtolength{\tocsubsubsecttitleindent}{\tocspace}
%calculate paragraph indents
\setlength{\tocparaindent}{\tocsubsubsectindent}
\addtolength{\tocparaindent}{\tocsubsubsecttitleindent}
\setlength{\tocparatitleindent}{\tocspace}
%calculate subparagraph indents
\setlength{\tocsubparaindent}{\tocparaindent}
\addtolength{\tocsubparaindent}{\tocparatitleindent}
\setlength{\tocsubparatitleindent}{\tocspace}
   %dottedtocline args={level}{margin to section number}{begin section number to title}
\renewcommand{\l@chapter}{\@dottedtocline{0}{\tocchapindent}{\tocchaptitleindent}}
\renewcommand*\l@section{\@dottedtocline{1}{\tocsectindent}{\tocsecttitleindent}}
\renewcommand*\l@subsection{\@dottedtocline{2}{\tocsubsectindent}{\tocsubsecttitleindent}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{\tocsubsubsectindent}{\tocsubsubsecttitleindent}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{\tocparaindent}{\tocparatitleindent}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{\tocsubparaindent}{\tocsubparatitleindent}}
\renewcommand*\l@figure{\@dottedtocline{1}{\tocchapindent}{\tocsecttitleindent}}
\renewcommand*\l@table{\@dottedtocline{1}{\tocchapindent}{\tocsecttitleindent}}
%\renewcommand*\l@table{\@dottedtocline{1}{\tocchapindent}{\tocchaptitleindent}}
}

\renewcommand\tableofcontents{%
    \@restonecolfalse
    \newspacing{\defaultspacing}
    \chapter*{\contentsname}%
    \vspace{-0.5\baselineskip}  %MSU%%%2 blank lines between title and heading
	\newspacing{\singlespacing}
	%MSU%%% toc line does not appear in table of contents
    \@starttoc{toc}%
    }
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand\listoftables{%
    \@restonecolfalse
%    \newspacing{\singlespacing}\vspace{\baselineskip}
    \newspacing{\defaultspacing}
%		\newspacing{\singlespacing}\vspace{\baselineskip}
    \chapter*{\listtablename}%
%    \newspacing{\defaultspacing}
%    \newspacing{\singlespacing}
    \vspace{-0.5\baselineskip}  %MSU%%%2 blank lines between title and heading
    \addtocontents{toc}{\par\mbox{}} %MSU%%%blank line p.31 
%    \newspacing{\defaultspacing}
    \addcontentsline{toc}{chapter}%
        {\MakeUppercase{\protect\listtablename}}%
%		\newspacing{\singlespacing}\vspace{\baselineskip}
    \@starttoc{lot}%
}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand\listoffigures{%
    \@restonecolfalse
    \newspacing{\defaultspacing}
%		\newspacing{\singlespacing}\vspace{\baselineskip}
    \chapter*{\listfigurename}%
    \vspace{-0.5\baselineskip}  %MSU%%%2 blank lines between title and heading
    \addtocontents{toc}{\par\mbox{}} %MSU%%%blank line p.31 
    \addcontentsline{toc}{chapter}%
        {\MakeUppercase{\protect\listfigurename}}%
%    \newspacing{\singlespacing}\vspace{\baselineskip}
%    \newspacing{\defaultspacing}
    \@starttoc{lof}%
}
\newcommand{\listofsymbols}{
    \@restonecolfalse  
\newspacing{\defaultspacing}
\chapter*{\listofsymbolsname}%
\vspace{-0.5\baselineskip}  %MSU%%%2 blank lines between title and paragraph
\addtocontents{toc}{\par\mbox{}} %MSU%%%blank line p.31 
\addcontentsline{toc}{chapter}%
   {\MakeUppercase{\protect\listofsymbolsname}}%
}

%%%preface%%%
%%%not implemented%%%

%chapter/section definitions%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\renewcommand{\thechapter}{\arabic{chapter}} %%%MSU 5/17/07%%% arabic allowed
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
\setcounter{secnumdepth}{3}   %subsubsection is in toc

%MSU%%%assume option: oneside,onecolumn,openany
%MSU%%% special chapter heading format p.18
\renewcommand\chapter{%
\clearpage
%\thispagestyle{plain}% %%%MSU 5/17/07%%%not needed because all pages are pagestyle{plain}
\global\@topnum\z@
\@afterindenttrue         %MSU%%% first paragraph indented
\secdef\@chapter\@schapter
}
\def\@chapter[#1]#2{%
\ifnum \c@secnumdepth >\m@ne
   \if@mainmatter
      \refstepcounter{chapter}%
      \typeout{\@chapapp\space\thechapter.}%
	  \addtocontents{toc}{\par\mbox{}} %MSU%%%blank line prior to chapter toc entry 
      \addcontentsline{toc}{chapter}%
	     %MSU%%%chapter number align on period p.31
         {\protect\numberline{\hfill\thechapter.\hspace{\tocspace}}\MakeUppercase{\protect#1}}%
	  \addtocontents{toc}{\par\mbox{}} %MSU%%%blank line after chapter toc entry 
   \else
      \addcontentsline{toc}{chapter}{\MakeUppercase{\protect#1}}%
   \fi
\else
   \addcontentsline{toc}{chapter}{\MakeUppercase{\protect#1}}%
\fi
\chaptermark{\MakeUppercase{#1}}%
%\addtocontents{lof}{\protect\addvspace{10\p@}}% %MSU%%%double space all lof entries p.37
%\addtocontents{lot}{\protect\addvspace{10\p@}}% %MSU%%%double space all lot entries p.36
\@makechapterhead{#2}%
\@afterheading
\vspace{-0.5\baselineskip}   %MSU%%% 6/11/09 two blank lines between chapter title and double spaced paragraph 
}
\def\@makechapterhead#1{%   
  \vspace*{0.6in}%         %MSU%%% 2in top margin 6/11/09 %%%MSU 5/17/07%%% prior value 0.25in
  {\parindent \z@ \centering \normalfont \normalsize %%%MSU 05/17/07%%% prior value large
     \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
           \MakeUppercase{\@chapapp}\space \thechapter  
           \par\nobreak
         \fi
     \fi
     \MakeUppercase{#1} 
	 \par\nobreak
  }
  \vspace{\baselineskip} %%%MSU 5/17/07%%%
}
%MSU%%% special heading format for chapter*
\def\@makeschapterhead#1{%
  \vspace*{0.6in}%        %MSU%%% 2in top margin 6/11/09 %%%MSU 5/17/07%%% prior value 0.25in
  {\parindent \z@ \centering \normalfont \normalsize %%%MSU 05/17/07%%% prior value large
    \MakeUppercase{#1}
	\par\nobreak
  }
  \vspace{\baselineskip}  %%%MSU 5/17/07%%% prior value one \tocbaselineskip
}
%MSU/CS%%% font for section headings 
\renewcommand\section{%
   \@startsection {section}{1}{\z@}%
      {-3.5ex \@plus -1ex \@minus -.2ex}%   
%%%%original latex      {2.3ex \@plus .2ex}%  
      {0.8ex \@plus .2ex}%   %%%%%MSU standard spacing below section title
      {\normalfont\normalsize\bfseries}%
}
\renewcommand\subsection{%
\@startsection{subsection}{2}{\z@}%
      {-3.25ex\@plus -1ex \@minus -.2ex}%
%%%%original latex      {1.5ex \@plus .2ex}%
      {0.8ex \@plus .2ex}%   %%%%%MSU standard spacing below section title
      {\normalfont\normalsize\bfseries} %%%MSU 5/17/07%%%prior itshape
}
\renewcommand\subsubsection{%
\@startsection{subsubsection}{3}{\z@}%
      {-3.25ex\@plus -1ex \@minus -.2ex}%
%%%original      {1.5ex \@plus .2ex}%
      {0.8ex \@plus .2ex}%   %%%%%MSU standard spacing below section title
      {\normalfont\normalsize\bfseries} %%%MSU 5/17/07%%%prior itshape, not bold
}
%MSU%%% first paragraph indented and spacing when no paragraph after title %%%MSU 5/17/07%%%
\newcommand{\Section}[1]{\section{#1}\mbox{}\hspace{\parindent}}
\newcommand{\SectionNoParagraph}[1]{\section{#1}\mbox{}\hspace{\parindent}\vspace{-1\baselineskip}}
\newcommand{\SubSection}[1]{\subsection{#1}\mbox{}\hspace{\parindent}}
\newcommand{\SubSectionNoParagraph}[1]{\subsection{#1}\mbox{}\hspace{\parindent}\vspace{-1\baselineskip}}
\newcommand{\SubSubSection}[1]{\subsubsection{#1}\mbox{}\hspace{\parindent}}
\newcommand{\SubSubSectionNoParagraph}[1]{\subsubsection{#1}\mbox{}\hspace{\parindent}\vspace{-1\baselineskip}}

%%%Definitions for compatibility with various journals%%%%%
%
\DeclareRobustCommand*{\etc}{etc.\xspace}
\DeclareRobustCommand*{\ie}{i.e.\xspace}
\DeclareRobustCommand*{\eg}{e.g.\xspace}
\DeclareRobustCommand*{\etal}{et al.\xspace}
\DeclareRobustCommand*{\vs}{{\em vs.}\xspace}


%footnote definitions%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%MSU%%%singlespace footnotes with blank line between p.9%%%%%%%%%%%%%%%%
\renewcommand\@makefntext[1]{%
    \newspacing{\singlespacing} %MSU%%%p.9
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1%
}

%%%%% figure and table definitions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength\abovecaptionskip{\headsep}
%%%%\setlength\belowcaptionskip{0\p@} %original LaTeX value
\setlength\belowcaptionskip{0.5\baselineskip} %MSU blank line between captiontext/tableorfig
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
%\newspacing{\singlespacing}
%\newspacing{\defaultspacing}
%%%%%%%  \sbox\@tempboxa{#1 #2}% %MSU obsolete Table number text on same line
  \sbox\@tempboxa{#2}% %MSU%no colon. Table/Fig number above caption text
  \ifdim \wd\@tempboxa >\hsize
    \centering{#1} \\ \mbox{} \\  %%%MSU thesis
        %%%%%%%%%%%%double space caption number/caption text%%%%
    #2\par               %%%%MSU thesis%%%%
  \else
    \global \@minipagefalse
    \centering{#1} \\ \mbox{} \\  %%MSU%%%Table/Fig number above caption text
    %%%%%%%%%%%%double space caption number/caption text%%%%
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip
}
%%%figure definitions%%%%%%%%%%%%%%%%%%%%
%
\def\fps@figure{htbp} %%%%%MSU thesis%%%%%
%MSU%%%special commands to support MSU style figures
\DeclareRobustCommand*{\figureref}[1]{Figure~\ref{fig:#1}}
\DeclareRobustCommand*{\Figureref}[1]{Figure~\ref{fig:#1}} %at start of sentence
\DeclareRobustCommand*{\Figure}[3]{
   \newspacing{\singlespacing}\par
   \begin{figure}
   \begin{center}
   \noindent
   \includegraphics[width=#2]{#1.eps}  %%%MSU 5/17/07%%%epsf is obsolete
   \end{center}
   \caption{#3}
   \label{fig:#1}
   \end{figure}
   \newspacing{\defaultspacing}
}
%MSU%%%Figuredbl produces the same result in a thesis as Figure.
%   It is provided here for compatibility with two-column paper.
\DeclareRobustCommand*{\Figuredbl}[3]{
   \newspacing{\singlespacing}\par
   \begin{figure*}
   \begin{center}
   \noindent
   \includegraphics[width=#2]{#1.eps}  %%%MSU 5/17/07%%%epsf is obsolete
   \end{center}
   \caption{#3}
   \label{fig:#1}
   \end{figure*}
   \newspacing{\defaultspacing}
}
\DeclareRobustCommand*{\rotatedfigure}[3]{
   \newspacing{\singlespacing}\par
   \begin{figure}[p]
   \rotatebox{90}{
   \begin{minipage}[t]{\figwidth}
      \begin{center}
      \noindent
      \includegraphics[width=#2]{#1.eps}  %%%MSU 5/17/07%%%epsf is obsolete
      \end{center}
      \protect\caption{#3}
      \label{fig:#1}
   \end{minipage}
   } %end rotatebox
   \end{figure}
   \newspacing{\defaultspacing}
}

%%%%% table definitions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\fps@table{htbp}  %MSU%%%
\renewenvironment{table}{%
   \@float{table}
}{%
   \end@float
}
\renewenvironment{table*}{%
   \@dblfloat{table}
}{%
   \end@dblfloat
}
%MSU%%%the following support MSU style tables
\DeclareRobustCommand*{\tableref}[1]{Table~\ref{tab:#1}}
\DeclareRobustCommand*{\Tableref}[1]{Table~\ref{tab:#1}} %at start of sentence
\newcommand{\Table}[2]{%
\newspacing{\singlespacing}\par
\begin{table}
\caption{#2}
\label{tab:#1}
\begin{center}
\input{#1}
\end{center}
\end{table}
\par\newspacing{\defaultspacing}
}
%MSU%%%Tabledbl produces the same result in a thesis as Table.
%   It is provided here for compatibility with a two-column publication.
\newcommand{\Tabledbl}[2]{%
\newspacing{\singlespacing}\par
\begin{table*}
\caption{#2}
\label{tab:#1}
\begin{center}
\input{#1}
\end{center}
\end{table*}
\par\newspacing{\defaultspacing}
}
\DeclareRobustCommand*{\rotatedtable}[2]{%
   \newspacing{\singlespacing}\par
   \begin{table}[p]
   \rotatebox{90}{
      \begin{minipage}[t]{\tabwidth}
      \protect\caption{#2}
      \label{tab:#1}
      \begin{center}
      \noindent
      \input{#1}
      \end{center}
   \end{minipage}
   } %end rotatebox
   \end{table}
   \newspacing{\defaultspacing}
}
\DeclareRobustCommand*{\rotateddbltable}[2]{%
   \newspacing{\singlespacing}\par
   \begin{table*}[p]
   \rotatebox{90}{
      \begin{minipage}[t]{\tabwidth}
      \protect\caption{#2}
      \label{tab:#1}
      \begin{center}
      \noindent
      \input{#1}
      \end{center}
   \end{minipage}
   } %end rotatebox
   \end{table*}
   \newspacing{\defaultspacing}
}
\newcommand{\Tablewithfigure}[3]{%
\newspacing{\singlespacing}\par
\begin{table}
\caption{#3}
\label{tab:#1}
\begin{center}
\noindent
\includegraphics[width=#2]{#1.eps}  %%%MSU 5/17/07%%%epsf is obsolete
\end{center}
\end{table}
\par\newspacing{\defaultspacing}
}
\newcommand{\Tabledblwithfigure}[3]{%
\newspacing{\singlespacing}\par
\begin{table*}
\caption{#3}
\label{tab:#1}
\begin{center}
\noindent
\includegraphics[width=#2]{#1.eps}  %%%MSU 5/17/07%%%epsf is obsolete
\end{center}
\end{table*}
\par\newspacing{\defaultspacing}
}
\DeclareRobustCommand*{\rotatedtablewithfigure}[3]{%
   \newspacing{\singlespacing}\par
   \begin{table}[p]
   \rotatebox{90}{
      \begin{minipage}[t]{\tabwidth}
      \protect\caption{#3}
      \label{tab:#1}
      \begin{center}
      \noindent
      \includegraphics[width=#2]{#1.eps}  %%%MSU 5/17/07%%%epsf is obsolete
      \end{center}
   \end{minipage}
   } %end rotatebox
   \end{table}
   \newspacing{\defaultspacing}
}
\newcommand{\Tablecontinued}[2]{%
\addtocounter{table}{-1}
\newspacing{\singlespacing}\par
\begin{table}
\caption{#2}
\label{tab:#1}
\begin{center}
\input{#1}
\end{center}
\end{table}
\par\newspacing{\defaultspacing}
} 


%math definitions%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\DeclareRobustCommand*{\eqnref}[1]{Equation~(\ref{eq:#1})} % for ordinary article
\DeclareRobustCommand*{\eqnsref}[1]{Equations~(\ref{eq:#1})} % for ordinary article
\DeclareRobustCommand*{\Eqnref}[1]{Equation~(\ref{eq:#1})} %at start of sentence
\DeclareRobustCommand*{\Eqnsref}[1]{Equations~(\ref{eq:#1})} %at start of sentence
\DeclareRobustCommand*{\andeqnref}[1]{and~(\ref{eq:#1})}  % for use with \eqnsref
%
%%%%%\theorembodyfont{\normalfont\itshape}  %eba prefers italics theorm body
\theorembodyfont{\normalfont}    %MSU%%%Italic theorem not allowed p.8
%%%%\theoremheaderfont{\normalfont\bfseries}  %eba prefers bold theorem header
\theoremheaderfont{\normalfont}  %MSU%%%Bold theorem headings not allowed p.8
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}} %MSU%%%A is prefix.
\newcommand{\qed}{\rule{1ex}{1ex}}
%%%Macros for compatibility with Elsevier (eslart.cls)%%%
\theoremstyle{break}\newtheorem{thm}{Theorem}
\theoremstyle{break}\newtheorem{lem}{Lemma}
\theoremstyle{break}\newtheorem{cor}{Corollary}
\theoremstyle{break}\newtheorem{defn}{Definition}
\theoremstyle{plain}\newtheorem{case}{Case}
%%%environment pf required by Elsevier and Kluwer%%%
\newenvironment{pf}{%
\par\noindent{Proof:\xspace}%
}{%
\hspace*{\fill}\qed%
}  

%list environment definitions%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%MSU%%%%single space list environements
%(original def's are in latex.ltx)
%
\def\enumerate{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \par\newspacing{\singlespacing} %MSU%%%singlespacing p.9
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
      \expandafter
      \list
        \csname label\@enumctr\endcsname
        {\usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}}%
  \fi
}
\def\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \par\newspacing{\singlespacing} %MSU%%%singlespacing p.9
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\def\makelabel##1{\hss\llap{##1}}}%
  \fi
}
\renewenvironment{description}
   {\par\list{}{%
      \labelwidth\z@ \itemindent-\leftmargin
      \let\makelabel\descriptionlabel
	  \newspacing{\singlespacing} %MSU%%%%
      }
   }
   {\endlist}
\renewenvironment{verse}
               {\par\let\\\@centercr
                \list{}{%
	               \newspacing{\singlespacing} %MSU%%%%
				   \itemsep      \z@
                   \itemindent   -1.5em%
                   \listparindent\itemindent
                   \rightmargin  \leftmargin
                   \advance\leftmargin 1.5em
				}%
                \item\relax}
               {\endlist}
\renewenvironment{quotation}
               {\par\list{}{
	              \newspacing{\singlespacing} %MSU%%%
			      \listparindent 1.5em%
                  \itemindent    \listparindent
                  \rightmargin   \leftmargin
                  \parsep        \z@ \@plus\p@
				}%
                \item\relax}
               {\endlist}
\renewenvironment{quote}
               {\par\list{}{%
	              \newspacing{\singlespacing} %MSU%%%
			      \rightmargin\leftmargin
			      }%
               \item\relax}
               {\endlist}

%%% bibliography definitions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%for compatibility with journals: 
%   Here cite is prior to punctuation; some journals require after punctuation
\DeclareRobustCommand*{\spacecite}[1]{\ \cite{#1}\xspace} % for space delimited [1]
\DeclareRobustCommand*{\commacite}[1]{ \cite{#1},} % for inline [1], style
\DeclareRobustCommand*{\periodcite}[1]{ \cite{#1}.} % for inline [1], style
%
\newcommand{\msubibliography}[1]{%
     \addtocontents{toc}{\par\mbox{}} %MSU%%%blank line p.31
     \addcontentsline{toc}{chapter}%
        {\MakeUppercase{\protect\bibname}}%  %MSU%%% bibliography in toc
\bibliography{#1}
}
\setlength\bibindent{\parindent} %MSU%%%no magic numbers (was 1.5em)
\renewenvironment{thebibliography}[1]{%
   \chapter*{\bibname \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}}%
   \newspacing{\singlespacing} %MSU%%bibliography single spaced
   \list{\@biblabel{\@arabic\c@enumiv}}{%
      \settowidth\labelwidth{\@biblabel{#1}}%
      \leftmargin\labelwidth
      \advance\leftmargin\labelsep
      \@openbib@code
      \usecounter{enumiv}%
      \let\p@enumiv\@empty
      \renewcommand\theenumiv{\@arabic\c@enumiv}
   }%
   \sloppy
   \clubpenalty50000    %MSU%%% no widows and orphans (was 4000)
   \@clubpenalty \clubpenalty
   \widowpenalty50000%  %MSU%%% no widows and orphans (was 4000}
   \sfcode`\.\@m
}{%
   \def\@noitemerr
   {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist  
   \newspacing{\defaultspacing} %MSU%%%bibliography single spaced
}

%%%appendix definitions%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcommand{\oneappendix}[1]{%  %MSU/CS%%%No A in chapter heading
\newspacing{\defaultspacing}
\renewcommand{\thechapter}{A}%
\chapter*{\appendixname \protect\\ #1}%
\addtocontents{toc}{\par\mbox{}} %MSU%%%blank line p.31 
\addcontentsline{toc}{chapter}%
   {\hspace*{\maxchapwidth}\MakeUppercase{#1}}%   %%%MSU 5/17/07%%% indent title of single appendix in TOC
\vspace{-0.5\baselineskip}  %MSU%%%2 blank lines between title and paragraph
}

%end msuthesis.cls

