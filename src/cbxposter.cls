%=========================================================================
% CBX Poster Class
%=========================================================================
% This is a class for creating technical posters.
%
% Author : Christopher Batten
% Date   : January 6, 2009
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cbxposter}[2008/01/06 ver 0.1]
\LoadClass[hyperref={draft}]{beamer}

%-------------------------------------------------------------------------
% Packages
%-------------------------------------------------------------------------

\RequirePackage{type1cm}
\RequirePackage{eulervm}
\RequirePackage[scaled]{helvet}
\RequirePackage{tikz}

\RequirePackage{graphicx}     % To include graphics
\RequirePackage{grffile}      % To include graphics
\RequirePackage{dblfloatfix}  % Fixes some issues with dbl col floats
\RequirePackage{textcomp}     % For non-math characters (eg. mu)
\RequirePackage{cite}         % Sort cite lists [1,2,3]
\RequirePackage{balance}      % Balance last columns
\RequirePackage{fancyvrb}     % Pretty code formatting
\RequirePackage{fancyhdr}     % For headers and footers
\RequirePackage{booktabs}     % Very nice table formatting
\RequirePackage{lipsum}       % Lorem Ipsum?

\RequirePackage{calc}         % Basic math operations
\RequirePackage{xifthen}      % Conditional code

\RequirePackage{fancybox}

%-------------------------------------------------------------------------
% Variables
%-------------------------------------------------------------------------

\gdef\cbxposter@title{}
\gdef\cbxposter@conference{}
\gdef\cbxposter@authors{}
\gdef\cbxposter@inst{}

\gdef\cbxposter@name{}
\gdef\cbxposter@address{}
\gdef\cbxposter@email{}
\gdef\cbxposter@web{}

\renewcommand{\title}[1]{\gdef\cbxposter@title{#1}}
\newcommand{\conference}[1]{\gdef\cbxposter@conference{#1}}
\newcommand{\authors}[1]{\gdef\cbxposter@authors{#1}}
\newcommand{\inst}[1]{\gdef\cbxposter@inst{#1}}

\newcommand{\name}[1]{\gdef\cbxposter@name{#1}}
\newcommand{\address}[1]{\gdef\cbxposter@address{#1}}
\newcommand{\email}[1]{\gdef\cbxposter@email{#1}}
\newcommand{\web}[1]{\gdef\cbxposter@web{#1}}

%-------------------------------------------------------------------------
% Page layout
%-------------------------------------------------------------------------

\geometry
{%
  paperwidth=46.5in,
  paperheight=35in,
  hmargin=0.32in,
  vmargin=0in,
  headsep=0in,
  head=0in,
  foot=0in
}

%-------------------------------------------------------------------------
% Font Sizes
%-------------------------------------------------------------------------

\def\fontscale{2}

\newlength{\cbxposter@templenA}
\newlength{\cbxposter@templenB}
\newcommand{\setscaledfont}[2]
{%
  \setlength{\cbxposter@templenA}{#1 * \real{#2}}%
  \setlength{\cbxposter@templenB}{#1 * \real{#2} * \real{1.2}}%
  \fontsize{\cbxposter@templenA}{\the\cbxposter@templenB}\selectfont%
}

\newcommand{\setscaledfontx}[3]
{%
  \setlength{\cbxposter@templenA}{#1 * \real{#2}}%
  \setlength{\cbxposter@templenB}{#1 * \real{#2} * \real{#3}}%
  \fontsize{\cbxposter@templenA}{\the\cbxposter@templenB}\selectfont%
}

% Smaller font sizes
\renewcommand*{\tiny}{\setscaledfont{5pt}{\fontscale}}
\renewcommand*{\scriptsize}{\setscaledfont{7pt}{\fontscale}}
\renewcommand*{\footnotesize}{\setscaledfont{8pt}{\fontscale}}
\renewcommand*{\small}{\setscaledfont{9pt}{\fontscale}}
\renewcommand*{\normalsize}{\setscaledfont{10pt}{\fontscale}}
\renewcommand*{\large}{\setscaledfont{12pt}{\fontscale}}
\renewcommand*{\Large}{\setscaledfont{14.40pt}{\fontscale}}
\renewcommand*{\LARGE}{\setscaledfont{17.28pt}{\fontscale}}
\renewcommand*{\huge}{\setscaledfont{20.74pt}{\fontscale}}
\renewcommand*{\Huge}{\setscaledfont{24.88pt}{\fontscale}}

% Larger font sizes
% \renewcommand*{\tiny}{\setscaledfont{7pt}{\fontscale}}
% \renewcommand*{\scriptsize}{\setscaledfont{8pt}{\fontscale}}
% \renewcommand*{\footnotesize}{\setscaledfont{9pt}{\fontscale}}
% \renewcommand*{\small}{\setscaledfont{10pt}{\fontscale}}
% \renewcommand*{\normalsize}{\setscaledfont{11pt}{\fontscale}}
% \renewcommand*{\large}{\setscaledfont{13pt}{\fontscale}}
% \renewcommand*{\Large}{\setscaledfont{14.40pt}{\fontscale}}
% \renewcommand*{\LARGE}{\setscaledfont{18.28pt}{\fontscale}}
% \renewcommand*{\huge}{\setscaledfont{20.74pt}{\fontscale}}
% \renewcommand*{\Huge}{\setscaledfont{24.88pt}{\fontscale}}

% set the normalfont (default)
\renewcommand*{\normalfont}{\normalsize}

%-------------------------------------------------------------------------
% Beamer Customization
%-------------------------------------------------------------------------

\mode<presentation>

% light blue : 13  7 0  0
% med1  blue : 21 12 0  9
% med2  blue : 68 36 0 16
% dark  blue : 76 41 0 67

\selectcolormodel{rgb}

\definecolor{cbxgreenA}    {RGB}{230, 248, 219}
\definecolor{cbxgreenB}    {RGB}{190, 227, 169}
\definecolor{cbxgreenC}    {RGB}{ 88, 171,  30}
\definecolor{cbxgreenD}    {RGB}{ 42,  76,  19}
\definecolor{cbxbluegreen} {RGB}{ 19,  76,  51}
\definecolor{cbxblueA}     {RGB}{223, 238, 255}
\definecolor{cbxblueB}     {RGB}{183, 206, 233}
\definecolor{cbxblueC}     {RGB}{ 69, 136, 214}
\definecolor{cbxblueD}     {RGB}{ 20,  50,  85}
\definecolor{cbxbrownA}    {RGB}{247, 243, 204}
\definecolor{cbxbrownB}    {RGB}{213, 205, 124}
\definecolor{cbxbrownC}    {RGB}{143, 132,  19}
\definecolor{cbxbrownD}    {RGB}{ 84,  67,   0}
\definecolor{cbxredA}      {RGB}{254, 217, 217}
\definecolor{cbxredB}      {RGB}{223, 167, 159}
\definecolor{cbxredC}      {RGB}{176,  24,  24}
\definecolor{cbxredD}      {RGB}{ 98,   9,   9}

\colorlet{cbxschemeA}{cbxblueA}
\colorlet{cbxschemeB}{cbxblueB}
\colorlet{cbxschemeC}{cbxblueC}
\colorlet{cbxschemeD}{cbxblueD}

% Headline colors and fonts

\setbeamercolor{headline}{fg=cbxschemeD,bg=cbxschemeB}
\setbeamercolor{separation line}{bg=cbxschemeD}
\setbeamercolor{caption name}{fg=black}
\setbeamerfont{caption name}{series=\bfseries,size=\normalsize}
\setbeamerfont{caption}{size=\normalsize}

% footline colors and fonts

\setbeamercolor{footline}{fg=cbxschemeD,bg=cbxschemeB}
\setbeamerfont{footline}{size=\normalsize}

% body colors and fonts

\setbeamercolor*{normal text}{fg=black,bg=cbxschemeA}

% block environment

\setbeamercolor*{block body}{bg=white,fg=black}
\setbeamercolor*{block title}{fg=cbxschemeD,bg=cbxschemeB}
\setbeamerfont{block title}{size=\LARGE}

% Misc Configuration

\setbeamertemplate{itemize items}[circle]
\setbeamertemplate{navigation symbols}{}  % no navigation on a poster

\mode<all>

%-------------------------------------------------------------------------
% Block Template
%-------------------------------------------------------------------------

\mode<presentation>

%\newcounter{blockcounter}
%\setbeamertemplate{block begin}{
%  \begin{beamercolorbox}[sep=1.5ex]{block title}%
%      {\addtocounter{blockcounter}{1}%
%        \begin{tikzpicture}[remember picture,overlay]
%          \draw[line width=3pt] (0.6,0.3) circle (0.65)
%                      node {\bf\large \textsf{\theblockcounter}};
%        \end{tikzpicture}%
%        \centerline{\bf\LARGE \textsf{\insertblocktitle\vphantom{y}}}}%
%  \end{beamercolorbox}%
%  {\ifbeamercolorempty[bg]{block body}{}{\nointerlineskip\vskip-0.5pt}}%
%  \usebeamerfont{block body}%
%  \begin{beamercolorbox}[sep=2ex,vmode]{block body}%
%}
%\setbeamertemplate{block end}{
%  \end{beamercolorbox}
%}

\newcounter{blockcounter}
\setbeamertemplate{block begin}{
  \begin{Sbox}
  \begin{minipage}{\textwidth}
  \begin{beamercolorbox}[sep=1.5ex]{block title}%
      {\addtocounter{blockcounter}{1}%
        \begin{tikzpicture}[remember picture,overlay]
          \draw[fill=cbxschemeA,color=cbxschemeA]
            (-0.6,-0.8) rectangle (1.5,1.4);
          \draw[fill=cbxschemeA,color=cbxschemeA]
            (1.47,-0.8) arc (-45:45:1.55);
          \draw[color=cbxschemeD]
            (0.5,0.35) node {\bf\Huge \textsf{\theblockcounter}};
        \end{tikzpicture}%
        \centerline{\bf\LARGE \textsf{\insertblocktitle\vphantom{y}}}}%
  \end{beamercolorbox}%
  \vspace{-1pt}%
  \color{cbxschemeD}\rule[\baselineskip]{\textwidth}{2.5pt}\\[-\baselineskip]
  \usebeamerfont{block body}%
  \begin{beamercolorbox}[sep=2ex,vmode]{block body}%
}
\setbeamertemplate{block end}{
  \end{beamercolorbox}%
  \end{minipage}%
  \end{Sbox}
  \setlength{\fboxsep}{0in}
  \setlength{\fboxrule}{2.5pt}
  \fcolorbox{cbxschemeD}{white}{\TheSbox}
}

\mode<all>

%-------------------------------------------------------------------------
% Headline Template
%-------------------------------------------------------------------------

\mode<presentation>

\setbeamertemplate{headline}{
  \leavevmode

  \begin{beamercolorbox}[wd=\paperwidth]{headline}
    \vspace{0.7in}

    \hspace{1in}
    \begin{minipage}[c]{0.55\textwidth}
    \usebeamercolor{title in headline}{\color{fg}\setscaledfontx{44pt}{\fontscale}{1.1}\textbf{\cbxposter@title}\par}
    \end{minipage}\hfill%
    \begin{minipage}[c]{0.36\textwidth}\centering
      \usebeamercolor{author in headline}{\color{fg}\Huge\textsf{\cbxposter@authors}\par}

      \vspace{0.2in}

      \usebeamercolor{institute in headline}{\color{fg}\huge\textsf{\cbxposter@inst}\par}
    \end{minipage}\hfill
%    \begin{minipage}[c]{0.05\textwidth}
%      \setlength{\fboxrule}{2.5pt}
%      \fcolorbox{cbxschemeD}{white}{\includegraphics[width=\textwidth]{qrcode.svg.pdf}}
%    \end{minipage}\hspace{1in}\mbox{}
    \vspace{0.5in}
  \end{beamercolorbox}

  \begin{beamercolorbox}[wd=\paperwidth]{lower separation line head}
    \rule{0pt}{2.5pt}
  \end{beamercolorbox}
}

\mode<all>

%-------------------------------------------------------------------------
% Footline Template
%-------------------------------------------------------------------------

\mode<presentation>

\setbeamertemplate{footline}{
  \begin{beamercolorbox}[wd=\paperwidth]{upper separation line foot}
    \rule{0pt}{2.5pt}
  \end{beamercolorbox}

  \begin{beamercolorbox}[leftskip=1cm,rightskip=1cm]{footline}%
    \vspace{0.5ex}
    \begin{center}
      \BF{Contact Author:}
      \cbxposter@name,
      \cbxposter@address,
      \url{\cbxposter@email}
    \end{center}
    \vspace{0.5ex}
  \end{beamercolorbox}
}

\mode<all>

%-------------------------------------------------------------------------
% Misc
%-------------------------------------------------------------------------

\newcommand{\cbxsection}[1]{{
  \centering
  \vspace{0.25in}
  {\color{cbxschemeD}%
  {\bf \Large #1\par}
  \vspace{-0.05in}
  \rule{0.9\textwidth}{2.5pt}\\[0.3in]}
}}

%-------------------------------------------------------------------------
% Assembly block formatting
%-------------------------------------------------------------------------

\renewcommand{\FancyVerbFormatLine}[1]
{%
  \parbox{1.5ex}{\raggedleft\theFancyVerbLine} #1%
}

%-------------------------------------------------------------------------
% Useful macros
%-------------------------------------------------------------------------

\newenvironment{cbxlist}[4][$\triangleright$]
{%
  \begin{list}{#1}
  {%
    \setlength{\leftmargin}{#2}
    \setlength{\rightmargin}{#3}
    \setlength{\labelwidth}{1em}%
    \setlength{\topsep}{0pt}
    \setlength{\parsep}{0pt}
    \setlength{\listparindent}{0pt}
    \setlength{\itemsep}{#4}
  }
}{%
  \end{list}
}

\newenvironment{cbxindent}[2]
{%
  \begin{list}{}
  {
    \setlength{\leftmargin}{#1}
    \setlength{\rightmargin}{#2}
    \item
  }
}{%
  \end{list}
}

\renewcommand{\texttilde}{{\char'176}}
\newcommand{\annotate}[1]{{\color{red}\bfseries [ #1 ]}}
\newcommand{\fixme}[1]{{\color{red}\bfseries [ FIXME: #1 ]}}
\newcommand{\wunits}[2]{\mbox{#1\,#2}}
\newcommand{\um}{\mbox{\textmu m}}
\newcommand{\X}{$\times$}
\newcommand{\x}{\thinspace$\times$\thinspace}
\newcommand{\by}{$\times$}
\newcommand{\tw}{\textwidth}
\newcommand{\cw}{\columnwidth}
\newcommand{\wu}[2]{\mbox{#1\,#2}}

\newcommand{\TT}[1]{\texttt{#1}}
\newcommand{\BF}[1]{\textbf{#1}}
\newcommand{\IT}[1]{\textit{#1}}
\newcommand{\RM}[1]{\textrm{#1}}
\newcommand{\mmsq}{mm\tsup{2}}
\newcommand{\umsq}{\textmu{}m\tsup{2}}

\newcommand{\tsup}[1]{\textsuperscript{#1}}
\newcommand{\tsub}[1]{\textsubcript{#1}}

% shreesha: added a new command that controls the font of verbatim blocks
\newcommand{\verbatimfont}[1]{\renewcommand{\verbatim@font}{\ttfamily#1}}

\RequirePackage{pgfpages}
\pgfpagesuselayout{resize to}%
[%
  physical paper width=\paperwidth,%
  physical paper height=\paperheight,%
%  physical paper width=40.5in,%
%  physical paper height=29.8in,%
  border shrink=0.25in%
]
\pgfpageslogicalpageoptions{1}{border code={\pgfsetlinewidth{5pt}\pgfstroke}}

