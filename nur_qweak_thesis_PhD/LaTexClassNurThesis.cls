%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% nurLaTexClass.cls %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Created this class for fancy editing %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{latexsym}
\usepackage{colortbl}
\usepackage{bm}
\usepackage{afterpage}
%\usepackage{natbib}
\usepackage[printonlyused]{acronym}
\usepackage{cite}
\usepackage{subcaption}					% caption extension
\usepackage{url}							% help including url's
\usepackage{amsmath,amssymb}				% in case one want AMS math macros and AMS symbols
\usepackage{graphicx}					% in case one want PostScript graphics 
\usepackage{booktabs}					% design of table, has an excellent documentation
\usepackage{lscape}						% allow to get landscape style for single page
%\usepackage{subfigure}					% allow side by side figure
\usepackage{sparticles} 					% package for displaying sparticle names
\usepackage{feynmf}						% package for feynman diagrams
\usepackage{fancyhdr}					% get a fancy header style
\usepackage{soul}						% help to strike through text using \st command
\usepackage{ragged2e} 					% to justify text
\usepackage{rotating}					% allow rotating text
\usepackage{fancyvrb}					% for fancy boxes
%\usepackage{arydshln}					% allow dashed line
\usepackage{breqn}						% allow split in equation
\usepackage{stmaryrd}					% package for special vector symbols
\usepackage{pbox}						% help create break inside table cell
\usepackage{multirow}					% allow merge cell in table
\usepackage{color}						% allows to mark entries in the tables with color
\usepackage[usenames,dvipsnames]{xcolor} % allows to coustomize color
\definecolor{darkred}{rgb}{0.7,0.0,0.0}	% 70% of red color
\definecolor{darkgreen}{rgb}{0.0,0.7,0.0}% 70% of green color
\definecolor{darkblue}{rgb}{0.0,0.0,0.7}	% 70% of blue color
\usepackage[backref=page]{hyperref}		% hyperlinks for pdf, backref to show pages in bibligraphy
\hypersetup{
			bookmarks=true,				% show bookmarks bar
			pdfborder=000,
			pdftex=true,
			%linktoc=none,section,page,all
			linktoc=page,					
			linkcolor=darkred,			% color of internal links
			citecolor=darkgreen,        	% color of links to bibliography
			filecolor=magenta,      		% color of file links
			urlcolor=blue,          		% color of external links
			colorlinks=true,         	% false: boxed links; true: colored links
%			hidelinks=true,				% hide all the hyperlinks
			pdffitwindow=false,     		% window fit to page when opened
			pdfauthor = {Nuruzzaman},	% put the author name in properties
			pdftitle = {P.hD. thesis of Nuruzzaman},	% put the title in properties
			pdfsubject = {thesis},		% put the subject in properties
			pdfkeywords = {thesis, pdf, nuruzzaman, jlab, hampton university, nndc, qweak, transverse, bnssa, nuclear transparency, curriculum vitae}	% put the author keywords in properties
			}
%\usepackage[font=singlespacing]{caption}
%\usepackage[hang,labelsep=none,skip=10pt,labelsep=quad,singlelinecheck=no]{caption}
\usepackage[labelsep=none,skip=10pt,labelsep=quad,singlelinecheck=no]{caption}
\usepackage{makeidx}						% allow to make a index page like book
\makeindex								%
\setlength{\pdfpagewidth}{8.5in}			% force the pdf page width to 8.5in for letter paper
\setlength{\pdfpageheight}{11in}			% force the pdf page length to 11in for letter paper
%\setlength{\pdfpagewidth}{8.27in}		% force the pdf page width to 8.27in for A4 paper
%\setlength{\pdfpageheight}{11.69in}		% force the pdf page length to 11.69in for A4 paper
\usepackage{setspace}					% allows to create single space
\usepackage{blindtext}					% allows to create long texts for testing
\usepackage{alltt}						% allows to insert bolck text like <pre> in html
\usepackage{morefloats}					% allocate more float skeletons than default; alternatively use \clearpage in text
%%\usepackage[pdftex]{graphicx} 			% required to import graphic files
%%\usepackage{mdwlist}
%% you can speed things up by compiling only one chapter at a time 
%\includeonly{appendixa}

\newcommand{\tab}{\hspace*{2em}}			% defining tabs
\def \variable {frameboxsize}			% defining box size
\def \frameboxsize {140mm}
\newcommand\degrees[1]{\ensuremath{#1^\circ}}% defining degrees

\newcommand{\inchsign}{^{\prime\prime}}	% use it like $123\inchsign$ for inches

\def\changemargin#1#2{\list{}{\rightmargin#2\leftmargin#1}\item[]}
\let\endchangemargin=\endlist 

%% for table cell wraping
\newcolumntype{L}{>{\centering\arraybackslash}m{1cm}}

%% changing the name to refernce from default bibliography
\renewcommand{\bibname}{References}

%% to show page number in refernce with correct format
\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{%
    \ifcase #1 (Not cited.)%
    \or        (Cited on page~#2.)%
    \else      (Cited on pages~#2.)%
    \fi}

%% Equations are within the section
\numberwithin{equation}{section}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setting up the front section of the thesis
\author{Nuruzzaman}

\newcommand{\thesisTitle}{Beam Normal Single Spin Asymmetry in Forward Angle Inelastic Electron-Proton Scattering Using the Q-weak Apparatus} 

\credentials{
M. S., Mississippi State University;\\
M. Sc., Indian Institute of Technology Roorkee; 
B. Sc., University of Kalyani
}

\abstractpageadvisor{Liguang Tang}  % Name of your advisor as it should appear on the Abstract page
\date{December 2014}
\degree{Doctor of Philosophy}
\department{Department of Physics}

\advisor{Liguang Tang, Ph.D.}
\member{David J. Mack, Ph.D.}
\member{Eric Christy, Ph.D.}
\member{Alberto Accardi, Ph.D.}
\dean{Patrena N. Benton, Ph.D.}

\title{\thesisTitle}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%