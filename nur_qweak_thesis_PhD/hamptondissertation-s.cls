%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%             Hampton University Dissertation Class          %%
%%               Written 2006 by John McNabb                  %%
%%                                                            %%
%%               Based on ECU Thesis Style,                   %%
%%             written 2004 by Evin Robertson.                %%
%%            Depends on the following packages:              %%
%%                                                            %%
%%                       book class                         %%
%%                       vmargin                              %%
%%                       calc                                 %%
%%                       setspace                             %%
%%                       fancyhdr                             %%
%%                       natbib                               %%
%%                       caption                              %%
%%                       afterpage                            %%
%%                       indentfirst                          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mod: lines 169, 184, 339 'Section' instead of 'Chapter'  -tsd 4/12/12

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hamptondissertation-s}[2006/06/29 Hampton University Dissertation Style]

%% Based on book class.
\ProcessOptions
%\LoadClass[letterpaper,onecolumn,12pt,oneside]{book}
\LoadClass[letterpaper,onecolumn,10pt,oneside]{book}
\pagestyle{empty}

%% Forbid orphan lines in paragraphs.
\clubpenalty=10000
\widowpenalty=10000

%% Offset tables and figures by 2 double spaces. 
\setlength{\textfloatsep}{0.45in}

\RequirePackage{vmargin}
\setpapersize{USletter}

\setlength{\footskip}{0.5in}
\newlength{\normtextheight}
\newlength{\toctextheight}
\newlength{\toctitletextheight}
\newlength{\normheadsep}
\newlength{\tocheadsep}
\newlength{\normtopmargin}
\newlength{\toctopmargin}
\newlength{\titlepagefix}

\setlength{\normtextheight}{9.0in}
\setlength{\toctextheight}{8.5in}
\setlength{\toctitletextheight}{10.0in}
\setlength{\normheadsep}{20pt}
\setlength{\tocheadsep}{0.25in}
\setlength{\normtopmargin}{0.5in}
\setlength{\toctopmargin}{1.0in}
\setlength{\titlepagefix}{0.35in}

\newcommand{\@loflotpnumwidth}{1.55em}
\newcommand{\@loflotrmarg}{3.1em}
\setmarginsrb{1.5in}{1.0in}{1.0in}{1.0in}{15pt}{\normheadsep}{15pt}{0.5in}
\RequirePackage{calc}

%% Allow red text to indicate where attention to text is needed.
\newcommand{\fixme}[1]{{\color{red}???FIX-ME:#1???}}

%% Define a symbol for indicating a Trademark.
\def\tm{\leavevmode\hbox{$\rm {}^{TM}$}}

%% Double Spacing is required by Hampton University.
\RequirePackage{setspace}

%% Single spacing is used in tables.
\renewenvironment{quote}
  { \begin{singlespace} \list{}{\rightmargin\leftmargin} \item\relax}
  { \endlist \end{singlespace} }

%% Single spacing is used in lists.
\let\old@itemize\itemize
\let\endold@itemize\enditemize
\renewenvironment{itemize}
  { \old@itemize \singlespacing}
  { \endold@itemize }

%% Single spacing for use in equation arrays.
\let\old@eqnarray\eqnarray
\let\endold@eqnarray\endeqnarray
\renewenvironment{eqnarray}
  { \begin{singlespace*} \begin{old@eqnarray} }
  { \end{old@eqnarray} \end{singlespace*} }

%% Headers: Put page number in upper-right hand corner.
\RequirePackage{fancyhdr}
\fancyhf{}  %% Clear headers and footers.
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\headheight}{15pt}

%% Add dotted lines between chapters and page numbers in the TOC.
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\ 
       \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfil\nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
\fi}

%% Doublespace between the LOF entries but singlespace within those entries.
\renewcommand*\l@figure[2]{%
 \ifnum \c@tocdepth >\m@ne
  \addpenalty{-\@highpenalty}%
  \vskip 1.0em \@plus\p@
  \setlength\@tempdima{2.5em}%
  \begingroup
   \parindent \z@ \rightskip \@loflotrmarg
   \parfillskip -\@loflotrmarg
   \advance\leftskip\@tempdima
   \hskip -\leftskip
   #1\nobreak\
    \leaders\hbox{$\m@th
     \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
     mu$}\hfil\nobreak\hb@xt@\@loflotpnumwidth{\hss #2}\par
   \penalty\@highpenalty
  \endgroup
\fi}

%% Doublespace between the LOT entries but singlespace within those entries.
\renewcommand*\l@table[2]{%
 \ifnum \c@tocdepth >\m@ne
  \addpenalty{-\@highpenalty}%
  \vskip 1.0em \@plus\p@
  \setlength\@tempdima{2.5em}%
  \begingroup
   \parindent \z@ \rightskip \@loflotrmarg
   \parfillskip -\@loflotrmarg
   \advance\leftskip\@tempdima
   \hskip -\leftskip
   #1\nobreak\
    \leaders\hbox{$\m@th
     \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
     mu$}\hfil\nobreak\hb@xt@\@loflotpnumwidth{\hss #2}\par
   \penalty\@highpenalty
  \endgroup
\fi}

\fancypagestyle{toc}{
  \fancyhf{}
  \doublespacing
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}

  \setlength{\topmargin}{\toctopmargin}
  \setlength{\headsep}{\tocheadsep}
  \setlength{\textheight}{\toctextheight}

  \cfoot{\thepage}
%    \lhead{\parbox{1in}{\vspace{1.58in}Section\vspace{-1.58in}}}
%  \rhead{\parbox{1in}{\vspace{1.58in}\hfill Page\vspace{-1.58in}}}
  \lhead{Section}
  \rhead{Page}
}

\fancypagestyle{toctitle}{
  \fancyhf{}
  \doublespacing
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}

  \setlength{\topmargin}{\normtopmargin}
  \setlength{\headsep}{\normheadsep}
  \setlength{\textheight}{\toctitletextheight}

  \cfoot{\thepage}
%    \lhead{Section}
%  \rhead{Page}
  \lhead{\parbox{1in}{\vspace{1.35in}Section\vspace{-1.35in}}}
  \rhead{\parbox{1in}{\vspace{1.35in}\hfill Page\vspace{-1.35in}}}
}

\fancypagestyle{lof}{
  \fancyhf{}
  \singlespace
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}

  \setlength{\topmargin}{\toctopmargin}
  \setlength{\headsep}{\tocheadsep}
  \setlength{\textheight}{\toctextheight}

  \cfoot{\thepage}
  \lhead{Figure}
  \rhead{Page}
}

\fancypagestyle{loftitle}{
  \fancyhf{}
  \singlespace
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}

  \setlength{\topmargin}{\normtopmargin}
  \setlength{\headsep}{\normheadsep}
  \setlength{\textheight}{\toctitletextheight}

%% This hack assumes that the TOC comes before the LOF and LOT.
  \cfoot{\vspace{\titlepagefix}\thepage\vspace{-\titlepagefix}}
  \lhead{\parbox{1in}{\vspace{1.35in}Figure\vspace{-1.35in}}}
  \rhead{\parbox{1in}{\vspace{1.35in}\hfill Page\vspace{-1.35in}}}
}

\fancypagestyle{lot}{
  \fancyhf{}
  \singlespace
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}

  \setlength{\topmargin}{\toctopmargin}
  \setlength{\headsep}{\tocheadsep}
  \setlength{\textheight}{\toctextheight}

  \cfoot{\thepage}
  \lhead{Table}
  \rhead{Page}
}

\fancypagestyle{lottitle}{
  \fancyhf{}
  \singlespace
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \setlength{\topmargin}{\normtopmargin}
  \setlength{\headsep}{\normheadsep}
  \setlength{\textheight}{\toctitletextheight}
%% This hack assumes that the TOC comes before the LOF and LOT.
  \cfoot{\vspace{\titlepagefix}\thepage\vspace{-\titlepagefix}}
  \lhead{\parbox{1in}{\vspace{1.35in}Table\vspace{-1.35in}}}
  \rhead{\parbox{1in}{\vspace{1.35in}\hfill Page\vspace{-1.35in}}}
}

\fancypagestyle{acronympage}{
  \fancyhf{}
  \singlespace
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}

  \setlength{\topmargin}{\toctopmargin}
  \setlength{\headsep}{\tocheadsep}
  \setlength{\textheight}{\toctextheight}

  \cfoot{\thepage}
  \lhead{}
  \rhead{}
}

\fancypagestyle{acronymtitle}{
  \fancyhf{}
  \singlespace
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \setlength{\topmargin}{\normtopmargin}
  \setlength{\headsep}{\normheadsep}
  \setlength{\textheight}{\toctitletextheight}
%% This hack assumes that the TOC comes before the LOF and LOT.
  \cfoot{\vspace{\titlepagefix}\thepage\vspace{-\titlepagefix}}
}

\fancypagestyle{frontmatter}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}

  \setlength{\topmargin}{\normtopmargin}
  \setlength{\headsep}{\normheadsep}
  \setlength{\textheight}{\normtextheight}

  \cfoot{\thepage}
  \rhead{}
  \lhead{}
  \singlespace
}

\fancypagestyle{mainmatter}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}

  \setlength{\topmargin}{\normtopmargin}
  \setlength{\headsep}{\normheadsep}
  \setlength{\textheight}{\normtextheight}

  \cfoot{}
  \rhead{\thepage}
  \lhead{}
}

%% The page number is supressed on the first page of each chapter.  **DOESN'T WORK?
\renewcommand\chapter{
  \clearpage
  \pagestyle{fancy}
  \doublespacing
  \setlength{\textheight}{\normtextheight}
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter
}

 % Fix the spacing in list of figures and list of tables 
 \def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                        \if@mainmatter
                          \refstepcounter{chapter}%
                          \typeout{\@chapapp\space\thechapter.}%
                          \addcontentsline{toc}{chapter}%
                                    {\protect\numberline{\thechapter}#1}%
                        \else
                          \addcontentsline{toc}{chapter}{#1}%
                        \fi
                     \else
                       \addcontentsline{toc}{chapter}{#1}%
                     \fi
                     \chaptermark{#1}%
 % fix spacing in list of figures and list of tables                    
 %                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
 %                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                     \if@twocolumn
                       \@topnewpage[\@makechapterhead{#2}]%
                     \else
                       \@makechapterhead{#2}%
                       \@afterheading
                     \fi}
%
% The following allows you to change the greatest depth of section headings
% which are numbered and included in the table of contents.  By default
% this depth is 3, which corresponds to subsubsections.  To have only
% subsections included, put "\vitalsecdepth{2}" into you preamble.
\def\vitalsecdepth#1{\setcounter{secnumdepth}{#1}
   \setcounter{tocdepth}{#1}}
\vitalsecdepth{3} 

%% Chapter headings should be centered, uppercase, and at the top of the page.
\newcommand{\HUchaptername}{SECTION}

\def\@makechapterhead#1{%
  { \parindent \z@ \raggedright \normalfont
    \centering
    \ifnum \c@secnumdepth >\m@ne   
          \huge \bfseries \HUchaptername~\thechapter \\ \MakeUppercase{#1} \par\nobreak 
%\MakeUppercase{\@chapapp\space \thechapter} % revised rws --- 01/08/2006
        \par\nobreak
    \fi
    \interlinepenalty\@M
%    \vskip 30\p@
    ~ \\
    \par\nobreak
  } }
\def\@makeschapterhead#1{
  { \parindent \z@ \raggedright
    \centering
    \normalfont
    \interlinepenalty\@M
     \Huge \bfseries  \MakeUppercase{#1}\par\nobreak 
    \vskip 27\p@
  }}
  
  
\renewcommand{\appendix}[1][APPENDICES]{
  
  \addtocontents{toc}{\centerline{}}
  \addtocontents{toc}{\centerline{\bf {#1}}}
  \cleardoublepage
  \vspace*{\fill}
  \centerline{\Huge \bfseries #1}
  \vspace*{\fill}
  \cleardoublepage
  \renewcommand{\thechapter}{\Alph{chapter}}
  \setcounter{chapter}{0}
  \renewcommand{\HUchaptername}{APPENDIX}
}
%command to set styles for frontmatter
\renewcommand{\frontmatter}{
  \pagenumbering{roman}
  \pagestyle{frontmatter}
  \addtocontents{toc}{\vspace{0.5in}}
  \addtocontents{lot}{\vspace{0.5in}}
  \addtocontents{lof}{\vspace{0.5in}}
}

\let\oldmainmatter=\mainmatter 
\renewcommand{\mainmatter}{
  \oldmainmatter
  \cleardoublepage
  \pagestyle{mainmatter}
  \pagenumbering{arabic}
}

\newcommand{\department}[1]{\gdef\@department{#1}}
\department{??DEPARTMENT??}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\degree{??DEGREE??}
\newcommand{\advisor}[1]{\gdef\@advisor{#1}}
\advisor{??ADVISOR??}
\newcommand{\abstractpageadvisor}[1]{\gdef\@abstractpageadvisor{#1}}
\abstractpageadvisor{??ADVISOR AS IT IS TO APPEAR ON ABSTRACT PAGE??}
\newcommand{\credentials}[1]{\gdef\@credentials{#1}}
\credentials{??CREDENTIALS??}
\newcommand{\dean}[1]{\gdef\@dean{#1}}
\dean{??DEAN??}

\newcommand{\copyrightpage}[1][??YEAR??]{
  \clearpage
  \thispagestyle{empty} 
  \singlespacing ~
  \vfill 
%  \centerline{Copyright \copyright by} 
  \centerline{Copyright by} 
  \centerline{\MakeUppercase{\@author}} 
  \centerline{#1} 
  \clearpage
  }

\newenvironment{dedication}{
  \clearpage
  \doublespacing~
  \vfill
%  \addcontentsline{toc}{chapter}{\numberline{~}DEDICATION}
  \begin{centering}
  \em}
  {\em
  \end{centering}
  \vfill
  \clearpage
  }


\newenvironment{abstract}{
  \clearpage
  \thispagestyle{fancy}
  \pagestyle{fancy}
  \chapter*{Abstract}
%  \addcontentsline{toc}{chapter}{\numberline{~}ABSTRACT}
  \doublespacing
  \begin{centering}
  \@title.~(\@date)

  \@author\bothIfSecond{,}~{\@credentials}

  Chair of Advisory Committee: \@abstractpageadvisor

  \vskip 27\p@

  \end{centering}
} {
  \clearpage
}

\newenvironment{Acknowledgements}{
  \clearpage
  \thispagestyle{fancy}
  \pagestyle{fancy}
  \chapter*{Acknowledgements}
%  \addcontentsline{toc}{chapter}{\numberline{~}ACKNOWLEDGEMENTS}
  \doublespacing
  \vspace{0.1in}
} {
  \clearpage
  }

%% Blank cover sheet
\newcommand{\coversheet}{ 
  \clearpage
  \thispagestyle{empty}
  \ 
  \clearpage }

\newcommand{\clearemptydoublepage}{
  \clearpage
  \thispagestyle{empty}
  \cleardoublepage
}

%% Member stuff based on dukethesis.cls:

%% \@member{member name} -- internal macro to print a line to sign on, and the
%%       name of a committee member (sole argument) below the line.
\newcommand{\@member}[2]{
  \tabularnewline
  \tabularnewline 
  & %
  \raisebox{-8pt}[0pt][17pt]{\rule{3in}{.5pt}}\par    %% Print line.
  \raisebox{0pt}[0pt][0pt]{#2}\par      %% Print member name below.
  \raisebox{0pt}[0pt][0pt]{#1}\par
  \tabularnewline
}

\newcounter{@members}           %% Number of member macros defined so far.
\newcommand{\@membera}{\@member{Committee Chair}{\@advisor}}
\setcounter{@members}{1}        %% Advisor is always 1st member

%% \member{member name} -- user macro to declare the name of a committee member.
%%       May be used up to 7 times.  Should not be used for advisor.
\newcommand{\member}[2][]{
  \addtocounter{@members}{1}    %% Inc. num of members to include this new one.
  \ifcase\value{@members} 
    \typeout{Dissertation format internal error.  Too few committee members.} \or
    \typeout{Dissertation format internal error.  Advisor left off committee.} \or
    \newcommand{\@memberb}{\@member{#1}{#2}} \or
    \newcommand{\@memberc}{\@member{#1}{#2}} \or
    \newcommand{\@memberd}{\@member{#1}{#2}} \or
    \newcommand{\@membere}{\@member{#1}{#2}} \or
    \newcommand{\@memberf}{\@member{#1}{#2}} \or
    \newcommand{\@memberg}{\@member{#1}{#2}} \or
    \newcommand{\@memberh}{\@member{#1}{#2}} 
  \else
    \typeout{Error using dissertation format.  Too many committee members.}
  \fi
}

%% Title page
\renewcommand{\maketitle}{
  \clearpage
  \thispagestyle{empty}
  \doublespacing
  \begin{center}
  ~\\
      { \MakeUppercase{\bf\@title} \par}  % NO bold rws 01/08/2006  
~\\
~\\
~\\
~\\
      A Dissertation

      By

      \MakeUppercase{\@author}
~\\
~\\
~\\
~\\
      \singlespacing
      Submitted to the Graduate College of Hampton University in
%      \doublespacing      
%      \singlespacing      
%      \vspace{-0.15in} // Added space -- Nur

      partial fulfillment of the requirements for the degree of
~\\        
~\\  
%      \doublespacing      
    
      \MakeUppercase{\@degree} 
~\\
~\\
~\\
%      \doublespacing      
      \@date

      \vfill
  \end{center}
  \clearpage
}

\newcounter{@membersprinted}

%% Signature page
\newcommand{\makesignature}{
  \clearpage
  \thispagestyle{empty}

  \doublespacing    
    
  \noindent{This dissertation submitted by {\@author} in 
                partial fulfillment of the requirements for the degree of \@degree~at 
                Hampton University, Hampton, Virginia is hereby approved by the committee 
                 under whom the work has been completed.}
                
      
    \singlespacing
      \noindent
      \begin{tabular}{p{2.5in}p{3in}}
      \setcounter{@membersprinted}{0}
      \@whilenum \value{@membersprinted} < \value{@members} \do {
            \stepcounter{@membersprinted}
            \ifcase\value{@membersprinted}
              \typeout{Dissertation style--internal error printing members.} \or
              \@membera \or
              \@memberb \or
              \@memberc \or
              \@memberd \or
              \@membere \or
              \@memberf \or
              \@memberg \or
              \@memberh
            \else \typeout{Dissertation style--internal error printing members.}
            \fi 
          }
      \vfill

      \tabularnewline
      \tabularnewline
      \raisebox{-8pt}[0pt][17pt]{\rule{2.5in}{.5pt}}\par    %% Print line.
      \raisebox{0pt}[0pt][0pt]{\@dean}\par      %% Print member name below.
      \raisebox{0pt}[0pt][0pt]{Dean, The Graduate College}\par
      &
      \tabularnewline
      \tabularnewline
      \tabularnewline
      \raisebox{-8pt}[0pt][17pt]{\rule{2.5in}{.5pt}}\par    % Print line.
      \raisebox{0pt}[0pt][0pt]{Date}\par      %% Print member name below.
      &
      \tabularnewline
      \end{tabular}
  \clearpage
}

\setcounter{tocdepth}{4}

\renewcommand{\tableofcontents}{
  \clearpage
  \normalbaselines
  \chapter*{Table of Contents}
%  \addcontentsline{toc}{chapter}{\numberline{~}TABLE OF CONTENTS}
  \pagestyle{toc}
  \thispagestyle{toctitle}
  \@starttoc{toc}
  \clearpage
}

\renewcommand{\listoftables}{
  \clearpage
  \normalbaselines
  \chapter*{LIST OF TABLES}
%  \addcontentsline{toc}{chapter}{\numberline{~}LIST OF TABLES}
  \pagestyle{lot}
  \thispagestyle{lottitle}
  \@starttoc{lot}
  \clearpage
}

\renewcommand{\listoffigures}{
  \clearpage
  \normalbaselines
  \chapter*{LIST OF FIGURES}
%  \addcontentsline{toc}{chapter}{\numberline{~}LIST OF FIGURES}
  \pagestyle{lof}
  \thispagestyle{loftitle}
  \@starttoc{lof}
  \clearpage
}

%% Generate a List of Acronyms that are used in the dissertation.
%% See http://tug.ctan.org/cgi-bin/ctanPackageInformation.py?id=acronym
\newcommand{\listofacronyms}[2][]{
  \clearpage
  \normalbaselines
  \chapter*{LIST OF SYMBOLS}
%  \addcontentsline{toc}{chapter}{\numberline{~}LIST OF SYMBOLS}
  \pagestyle{acronympage}  %%%% changed from plain
  \thispagestyle{acronymtitle}    %%%% changed from plain
  \vspace{18pt}
%  \vspace{30pt}
  \begin{acronym}[#1]
    #2
	\input{symbols2}		%% Inserting the list of symbols -- Nur
  \end{acronym}
  \clearpage
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newpage
\def\listofsymbols{\input{symbols2} \clearpage}
\def\addsymbol #1: #2#3{$#1$ \> \parbox{13.2cm}{#2 \dotfill \pageref{#3}}\\}
\def\newnot#1{\label{#1}} 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\chapters} {
  \clearpage
  \singlespacing
  \setcounter{page}{1}
  \pagenumbering{arabic}
}

%% Bibliography should be single spaced, and placed in the TOC.
\renewcommand{\bibname}{BIBLIOGRAPHY}
\RequirePackage{url}
%\RequirePackage{natbib}
\newcommand{\bibpreamble}{\singlespace}
%\def\bibindent{0.25in}
\def\bibindent{0.0in} %% set not to indent references -- Nur
%\begin{thebibliography}{99\kern\bibindent}
%\makeatletter
\let\old@biblabel\@biblabel
\def\@biblabel#1{\old@biblabel{#1}\kern\bibindent}
\let\old@bibitem\bibitem
\def\bibitem#1{\old@bibitem{#1}\leavevmode\kern-\bibindent}
%\makeatother
%% The author will need to pick a bibliography style in the dissertation.
%% Examples include:
%% \bibliographystyle{agu04}
%% \bibliographystyle{unsrt} %% Added references style here insted of main page -- Nur
%% \bibliographystyle{apalike} %author-year
%% \bibliographystyle{chicago}
\bibliographystyle{unsrt} %% Added references style here insted of main page -- Nur

%% Hampton University does not want Large fonts.  Make them bold instead. 
\renewcommand{\Large}{\large}
\renewcommand{\LARGE}{\large}
\renewcommand{\huge}{\large}
\renewcommand{\Huge}{\large}

%% Get Captions to conform.
\RequirePackage{caption}
%\captionsetup{font={small,it},labelsep=period,labelfont={bf,up},width=\textwidth,format=hang,singlelinecheck=false}

%Anusha
%\captionsetup{font={small,it},labelsep=period,labelfont={up},width=
\captionsetup{font={normal},labelsep=period,labelfont={up},width=\textwidth,format=hang,singlelinecheck=false} %% Remove hang to remove caption indent -- Nur
%\captionsetup{font=[12pt],labelsep=period,labelfont={up},width=\textwidth,format=hang,singlelinecheck=false} %% its not working with 12pt -- Nur
%\newcommand{\HUcaption}[2]{\caption[#1]{\textup{\textbf{#1.}} #2} \hfill}
\newcommand{\HUcaption}[2]{\caption[#1]{\textup{#1.} #2} \hfill}
\newcommand{\HUTableFont}[1]{{\normalsize ~\\ \emph{#1}}}

\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\lhead{}
\chead{}
\rhead{\thepage}
\lfoot{}
\cfoot{}
\rfoot{}

\RequirePackage{afterpage}
\RequirePackage{indentfirst}

%%%%%%%%%%%%%%%%
\newenvironment{VITA}{
  \clearpage
  \thispagestyle{fancy}
  \pagestyle{fancy}
%  \chapter*{VITA}
  \addcontentsline{toc}{chapter}{\numberline{~}VITA}
  \doublespacing
  \vspace{0.1in}
} {
  \clearpage
  }

%\def\vita{\newpage\thispagestyle{headings}%
% \begingroup\Large\bf\centerline{Vita}\endgroup\nobreak\vskip 30pt
%\begingroup\normalfont\Large\bf\centerline{VITA}\endgroup\nobreak\vskip 40pt
%  \typeout{Vita.}
% \addcontentsline{toc}{chapter}{VITA}}

