% ibl.cls
% Class for Inquiry-based Learning document
% Jim Hefferon jhefferon (at) smcvt.edu
% --- Class structure: identification part
% ---
\ProvidesClass{test}[2013/04/13 version 0.99 of Inquiry-based Learning book class (Jim Hefferon)]
\NeedsTeXFormat{LaTeX2e}

% ========================================
% I want the booleans offered by this package
\usepackage{etoolbox}

% Use these to set options from the command line.
% See http://stackoverflow.com/a/1466610
\providecommand{\defaultcompact}{\setbool{optioncompact}{true}}
\providecommand{\defaultbooklength}{0}

% --- Class structure: declaration of options part
% ---
% This class extends the article class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.ibl" exists, then it is loaded
\DeclareOption*{\InputIfFileExists{\CurrentOption.ibl}{}{
%
\PassOptionsToClass{\CurrentOption}{book}}}

% compact option: make shorter-length output, for copying and handing out
\newbool{optioncompact}
\boolfalse{optioncompact}
\DeclareOption{compact}{
  \defaultcompact
  % \booltrue{optioncompact}
}

% Include a minimal number of exercises, or medium number, or all?
% \newcommand{\defaultbooklength}{0}
\newcommand{\booklength}{\defaultbooklength}
\DeclareOption{minimallength}{
  \def\booklength{0}
}
\DeclareOption{middlelength}{
  \def\booklength{1}
}
\DeclareOption{maximallength}{
  \def\booklength{2}
}
\newcommand{\current@useforbooklength}{\defaultbooklength}
% Put these in text to set which exercises get used.
% Each problem or exercise environment takes an optional
% argument, and these are suitable:
%  * \begin{problem}[\midlength] .. \end{problem}
%    causes the entire problem, including the instructions and the exercises, 
%    to be omitted from the text unless the option middlelength or 
%    maximallength was used.
% * \begin{exercise}[maxlength]  .. \end{exercise}
%    omits this exercise from the text unless the option maximallength
%    was used
% Note that the exercises and solutions get put in the otherproblem document.
% So you can mark something for there only.  
\newcommand{\minlength}{0}
\newcommand{\midlength}{1}
\newcommand{\maxlength}{2}
\newcommand{\inflength}{3}  % larger than maximal length

% --- Class structure: execution of options part
% ---
\ProcessOptions \relax
% --- Class structure: declaration of options part
% ---
\LoadClass{book}

% \usepackage{jh}
\usepackage{ibl}

\usepackage[RGB]{xcolor}
% Colors from "Still not getting any" by sp613g, https://kuler.adobe.com/#themeID/181115 
% See also the asy files
\definecolor{lighti}{RGB}{219,213,242}
\definecolor{darki}{RGB}{22,64,89}
\definecolor{base}{RGB}{201,235,242}
\definecolor{darkii}{RGB}{69,115,110}
\definecolor{lightii}{RGB}{242,226,196}

% Hyper references
\RequirePackage{hyperref}
% From http://en.wikibooks.org/wiki/LaTeX/Hyperlinks
\hypersetup{
    bookmarks=true,         % show bookmarks bar?
    unicode=false,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitW},    % fits the width of the page to the window
    pdftitle={Proofs},    % title
    pdfauthor={Jim Hefferon},     % author
    pdfsubject={Mathematical Proofs},   % subject of the document
    pdfcreator={Jim Hefferon},   % creator of the document
    pdfproducer={pdflatex}, % producer of the document
    pdfkeywords={proofs} {Free textbook} {Inquiry-based} {Moore method}, % list of keywords
    pdfnewwindow=true,      % links in new window
    colorlinks=true,       % false: boxed links; true: colored links
    linkcolor=black,          % color of internal links (change box color with linkbordercolor)
    citecolor=black,        % color of links to bibliography
    filecolor=black,      % color of file links
    urlcolor=black           % color of external links
}


% % ========================================
% % Page layout
% \RequirePackage[left=1.45in,right=1.45in,top=1in,bottom=1in]{geometry}

\RequirePackage[english]{isodate}
\isodate

\RequirePackage{fancyhdr}
% \renewcommand\footrule{\begin{minipage}{1\textwidth}
% \color{darkii}\hrule width \hsize height 0.8pt   
% \end{minipage}\par}%

% \renewcommand\headrule{
% \begin{minipage}{1\textwidth}\vspace*{-2ex}
% \color{darkii}\hrule width \hsize height 0.8pt
% \end{minipage}}%

\fancypagestyle{firstpage}{%
\fancyhf{} % clear all six fields
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{prefacepage}{%
\fancyhf{} % clear all six fields
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}

% \fancypagestyle{bodypage}{%
% \fancyhf{}% clear all six fields
% \fancyhead[RE,LO]{\small Introduction to Proof, \today}
% \fancyhead[LE,RO]{\small page \thepage}
% \renewcommand{\headrulewidth}{0.7pt}
% \renewcommand{\footrulewidth}{0pt}
% }

% \pagestyle{prefacepage}
% \AtBeginDocument{\thispagestyle{firstpage}}


% ========================================
% Preface has epigrams set in ragged
\RequirePackage{ragged2e}


% % ========================================
% \usepackage{mathtools}  % imports amsmath
% \DeclarePairedDelimiter\absval{\lvert}{\rvert}%
% \newcommand{\lcm}{\operatorname{lcm}}

% \RequirePackage{amsthm}
% \renewcommand{\qedsymbol}{\rule{0.5em}{2ex}}
% ========================================
% Exercises are inside environments
\RequirePackage{thmtools}
\usepackage{
nameref, %\nameref
hyperref, %\autoref
% n.b. \Autoref is defined by thmtools
cleveref, % \cref
% n.b. cleveref after! hyperref
}

% Count the number of exercises so a person can comment some out to adjust
% the semester-long number.
% \newcounter{exercisecount}
% \AtEndDocument{\typeout{Total number of exercises: \theexercisecount.}}

\declaretheoremstyle[
spaceabove=1.1ex plus .1ex, spacebelow=1.1ex plus .2ex minus .1ex,
headfont=\normalfont\scshape,
notefont=\mdseries, notebraces={(}{)},
bodyfont=\normalfont,
headformat={\NUMBER\hspace*{0.5em}\NAME.\spacefactor=1000 \NOTE},
headpunct={},
postheadspace=0.5em plus .03em,
qed=\qedsymbol
]{jhstyle}
\newcommand{\notetext}[1]{(\textsc{#1})\hspace{0.35em}} % such as \item \notetext{Transitivity}

% \newcommand{\exercisename}{Exercise}
\theoremstyle{jhstyle}
\declaretheorem[name=Exercise,numberwithin=chapter]{ex}
% \addtotheorempreheadhook[ex]{\addtocounter{exercisecount}{1}} % count exery ex
\declaretheorem[name=Definition,sibling=ex]{df} % see defn of \definend
\declaretheorem[name=Note,sibling=ex]{nt}
\declaretheorem[name=Axiom,numberwithin=chapter]{ax}
% \declaretheorem[name=Answer,sibling=ex]{df} % see defn of answer environment 


% ========================================
% Chapter formatting
\RequirePackage[sc,medium,compact,raggedright,nobottomtitles,clearempty]{titlesec}
% \titleformat{command}[shape]{format}{label}{sep}{before-code}[after-code]
% \titlespacing*{command}{left}{before-sep}{after-sep}[right-sep]  % *-d form omits paragraph indent after title
% \titleformat{\chapter}[block]{\color{darki}\Large\scshape}{Chapter \thechapter}{1em}{\Writetofile{}{}}[\thispagestyle{firstpage}]
% \titlespacing*{\chapter}{0em}{4ex}{2ex} 
% \titleformat{\section}[block]{\color{darki}\large\scshape}{}{0em}{}[]
% \titlespacing*{\section}{0em}{7ex}{1ex} 
% \titleformat{\chapter}[display]{\color{darki}\Large\scshape}{\filleft\MakeUppercase{\chaptertitlename} {\Huge\thechapter}}{1em}{}[\thispagestyle{firstpage}]
% \titlespacing*{\chapter}{0em}{4ex}{2ex} 
% \titleformat{\section}[block]{\large\scshape}{}{0em}{}[]
% \titlespacing*{\section}{0em}{7ex}{1ex} 

% ========================================
% Lists
\RequirePackage{enumitem}

% Count number of exercises with parts; see also counter exercisecount
% \newcounter{exerciseswithpartscount}
% \AtEndDocument{\typeout{Number of exercises with parts: \theexerciseswithpartscount.}}
% \newcounter{exercisepartscount}
% \AtEndDocument{\typeout{Count of parts: \theexercisepartscount.}}
% \newcounter{exercisetotal}
% \AtEndDocument{\setcounter{exercisetotal}{\value{exercisecount}}%
% \addtocounter{exercisetotal}{\value{exercisepartscount}}%
% \addtocounter{exercisetotal}{-\value{exerciseswithpartscount}}%
% \typeout{Number for students to do is Total-Number+Count=\theexercisetotal.}}


% For these exercises, when done on the board I have one student do them
% all. 
\newlist{jhitems}{enumerate*}{1}
\setlist*[jhitems,1]{%
  mode=unboxed,
  before=\unskip{\hspace*{.5em plus .05em minus .02em}\linebreak[1]},
  after={.},
  itemjoin={\unskip{,\hspace{.5em plus .05em minus .02em}}\linebreak[1]},
  label={ (\roman*)},
}
\newenvironment{items}{%
\begin{jhitems}
}{%
\end{jhitems}
}


% ========================================
% Font
\usepackage{fourier}
\usepackage[T1]{fontenc}

% ========================================
% Cover
\newcommand{\coverpage}[1]{%  argument is possibly "Answers to Exercises"
\vspace*{\fill}
\begin{center}
  \setlength{\unitlength}{1in}
  \newcommand{\enormoussize}{\fontsize{30pt}{20pt}\selectfont}
  {\enormoussize\scshape \makebox[0em][l]{\raisebox{24pt}{\large\itshape \hspace*{15pt}An Inquiry-Based}}{\color{darkii}Introduction to Proofs}}  \\[5pt]
  {\Large\scshape \makebox[23em][r]{\color{darkii}#1}}
\end{center}
\vspace*{\fill}
\begin{flushright}
  \large\color{darki}
  \begin{tabular}{@{}l@{}}
  Jim Hef{}feron  \\
  version \version
  \end{tabular}
\end{flushright}
}



% ========================================
% The appendix should not write the title to the answersbody file
\newbool{inappendix}
\boolfalse{inappendix}
\let\jh@appendix\appendix   % remember LaTeX's definition
\renewcommand{\appendix}{\booltrue{inappendix}\jh@appendix}


% ========================================
% Convenient definitions

% % Graphics, with a caption
% \newcommand{\grf}[2]{\begin{tabular}{@{}c@{}}\includegraphics{#1} \\ #2\end{tabular}}

% % Vulgar fractions
% \RequirePackage{xfrac}

% % Script characters
% \RequirePackage{mathrsfs}
% \newcommand{\eqcl}[1]{{\mathscr E}_{#1}}

% % euscript characters
% \RequirePackage{euscript}
% \newcommand{\partition}[1]{\EuScript{#1}}

% % mathdots fot dots from lower-left to upper right
% \RequirePackage{mathdots}

% % Misc commands
% \newcommand{\definend}[1]{\textit{#1}}
% \newcommand{\pord}{Prove or disprove}
% \DeclareMathOperator{\add}{add}
% \DeclareMathOperator{\mul}{mul}
% \newcommand*{\symdiff}{\mathbin{\triangle}}
% \newcommand{\universalset}{\Omega}
% \DeclareMathOperator{\range}{Ran}
% \DeclareMathOperator{\image}{Im}
% \newcommand{\hint}{\textit{Hint:} }
% \newcommand{\remark}{\textit{Remark:} }


% ====================================================
% VERSION number
\newcommand{\version}{0.99}

\endinput