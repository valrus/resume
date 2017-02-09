\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{coverletter}[2015/05/25 An elegant cover letter class]
\LoadClass[11pt]{letter}

% disable indent globally
% \setlength{\parindent}{0pt}
% some general improvements, defines the XeTeX logo
\RequirePackage{xltxtra}
% use xifthen
\RequirePackage{xifthen}
% use hyperlink for email and url
\RequirePackage{hyperref}
\RequirePackage{url}
\urlstyle{tt}
% use fontawesome
\RequirePackage{fontawesome}
% use xcolor for customizing color
%\RequirePackage[usenames,dvipsnames]{xcolor}
% loading fonts
\RequirePackage{fontspec}
% Graphical signature
\RequirePackage{graphicx}
% Main document font
% \setmainfont{Merriweather Sans}
\setmainfont{Rosario}
\newfontfamily{\slab}{Bitter}

\RequirePackage[
	a4paper,
%	left=0.8in,
%	right=0.8in,
	top=0.70in,
	bottom=0.55in,
	nohead
]{geometry}

\RequirePackage{enumitem}
\setlist{noitemsep} % removes spacing from items but leaves space around the whole list
%\setlist{nosep} % removes all vertical spacing within and around the list
\setlist[itemize]{topsep=0.25em, leftmargin=1.5pc}
\setlist[enumerate]{topsep=0.25em, leftmargin=1.5pc}
\RequirePackage[super]{nth}

% Remove excess space in signature
% https://texblog.org/2010/05/04/latex-letter-signature-as-image/
\renewcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
\stopbreaks
\noindent
\ifx\@empty\fromaddress\else
\hspace*{\longindentation}\fi
\parbox{\indentedwidth}{\raggedright
    \ignorespaces #1\\[0.0in]%
    \ifx\@empty\fromsig
        \fromname
\else \fromsig \fi\strut}%
\par}

\newcommand{\headername}[1]{
  \centerline{\Huge\scshape{#1}}
  \vspace{1.25ex}
}

% defines one's name
% usage: \name{<name>}
\newcommand{\nameTest}[1]{
  {\large\scshape{#1}}
}

% defines one's email
% usage: \email{<email>}
\newcommand{\email}[1]{\faEnvelope\ \href{mailto:#1}{#1}}
% defines one's phone
% usage: \phone{<phone>}
\newcommand{\phone}[1]{\faPhone\ {#1}}
% defines one's linkedin
% usage: \linkedin{<linkedin>}
\newcommand{\linkedin}[2][]{\faLinkedin\ 
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}
% defines one's GitHub
% usage: \github{<github>}
\newcommand{\github}[2][]{\faGithub\ 
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}
% defines one's homepage
% usage: \homepage{<homepage>}
\newcommand{\homepage}[2][]{\faLink\ 
  \ifthenelse{\isempty{#1}}%
    {\href{#2}{#2}}
    {\href{#2}{#1}}}

\newcommand{\basicInfo}[2]{
  \centerline{\sffamily\large{#1}}
  \vspace{0.25em}
  \centerline{\sffamily\large{#2}}
  \vspace{1.5ex}
}

\newcommand{\role}[2]{
  \ifthenelse{\isempty{#2}}%
    {\textit{#1}}
    {\textit{#1} #2}
  \vspace{0.5ex}
}
