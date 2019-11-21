% ---------------------------------------------------------- %
% Title: My Custom Letter
% Author: Hauke Licht 
% Description: Class provides custom letter
% ---------------------------------------------------------- %
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myletter}[2018/05/07 My Custom Letter]

%% scrlttr2 options

% no fold marks
\DeclareOption{nofold}{
  \PassOptionsToClass{foldmarks=false}{scrlttr2}
}

% one fold mark in middle of page 
\DeclareOption{onefold}{
  \PassOptionsToClass{foldmarks=blmtP}{scrlttr2}
}

% two fold marks
\DeclareOption{twofold}{
  \PassOptionsToClass{foldmarks=mBT}{scrlttr2}
}

%% babel options

% german
\DeclareOption{ngerman}{
  \AtEndOfClass{
    \setlength{\parskip}{6 pt}
    \setlength{\parindent}{0 pt}
  }
  \PassOptionsToPackage{ngerman}{babel}
}

% english
\DeclareOption{english}{
  \PassOptionsToPackage{ngerman,english}{babel}
}

%% address settings
\DeclareOption{private}{
  \AtBeginDocument{
    \setkomavar{fromname}{Hauke Licht}
    \setkomavar{fromaddress}{%
      Burstwiesenstrasse 78\\%
      CH-8055 Zürich
    }
    \setkomavar{fromphone}[\Telefon\enskip]{+41\,76\,475\,71\,76}
    \setkomavar{fromemail}[\Letter\enskip]{%
        \href{mailto:hauke.licht@t-online.de}{hauke.licht@t-online.de}%
    }
  }
}

\DeclareOption{work}{
  \AtBeginDocument{
    \setkomavar{fromname}{Hauke Licht}
    \setkomavar{fromaddress}{%
      Affolternstrasse 56\\%
      CH-8050 Zurich\\%
      \IfStrEq*{\languagename}{ngerman}{Raum}{Room} H\,361%
    }
    \setkomavar{fromphone}[\Telefon\enskip]{+41\,44\,634\,54\,51}
    \setkomavar{fromemail}[\Letter\enskip]{%
        \href{mailto:hauke.licht@ipz.uzh.ch}{hauke.licht@ipz.uzh.ch}%
    }
  }
}


%% Fallback
\DeclareOption*{
  \ClassWarning{myletter}{Unknown option '\CurrentOption'}
}

%% Execute default options
% \ExecuteOptions{nofold}
% \ExecuteOptions{ngerman}
\ExecuteOptions{private}

%% Process given options
\ProcessOptions\relax

%% Load base
\LoadClass[%
  a4paper,%
  fromrule=afteraddress,%
  fromphone,%
  fromemail,%
  version=last,%
  firstfoot=false%
]{scrlttr2}

%% Load additional packages and commands.
% \RequirePackage{custom}
\RequirePackage{graphics}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage{framed}
\RequirePackage{alltt}
\RequirePackage[utf8]{inputenc}
\RequirePackage{marvosym} % Allows the use of symbol
\RequirePackage{babel}
\IfFileExists{upquote.sty}{\RequirePackage{upquote}}{}
\RequirePackage{fontspec}
\RequirePackage{hyperref}
\RequirePackage{xstring}

%% Additional TeX/LaTeX code...

% define colors 
\definecolor{fgcolor}{rgb}{0.345, 0.345, 0.345}
\definecolor{shadecolor}{rgb}{.97, .97, .97}
\definecolor{messagecolor}{rgb}{0, 0, 0}
\definecolor{warningcolor}{rgb}{1, 0, 1}
\definecolor{errorcolor}{rgb}{1, 0, 0}

\newcommand{\hlnum}[1]{\textcolor[rgb]{0.686,0.059,0.569}{#1}}%
\newcommand{\hlstr}[1]{\textcolor[rgb]{0.192,0.494,0.8}{#1}}%
\newcommand{\hlcom}[1]{\textcolor[rgb]{0.678,0.584,0.686}{\textit{#1}}}%
\newcommand{\hlopt}[1]{\textcolor[rgb]{0,0,0}{#1}}%
\newcommand{\hlstd}[1]{\textcolor[rgb]{0.345,0.345,0.345}{#1}}%
\newcommand{\hlkwa}[1]{\textcolor[rgb]{0.161,0.373,0.58}{\textbf{#1}}}%
\newcommand{\hlkwb}[1]{\textcolor[rgb]{0.69,0.353,0.396}{#1}}%
\newcommand{\hlkwc}[1]{\textcolor[rgb]{0.333,0.667,0.333}{#1}}%
\newcommand{\hlkwd}[1]{\textcolor[rgb]{0.737,0.353,0.396}{\textbf{#1}}}%

\newenvironment{knitrout}{}{} % an empty environment to be redefined in TeX


% \makeatletter
% \def\maxwidth{ %
%   \ifdim\Gin@nat@width>\linewidth
%     \linewidth
%   \else
%     \Gin@nat@width
%   \fi
% }
% \makeatother

% \makeatletter
% \newenvironment{kframe}{%
%  \def\at@end@of@kframe{}%
%  \ifinner\ifhmode%
%   \def\at@end@of@kframe{\end{minipage}}%
%   \begin{minipage}{\columnwidth}%
%  \fi\fi%
%  \def\FrameCommand##1{\hskip\@totalleftmargin \hskip-\fboxsep
%  \colorbox{shadecolor}{##1}\hskip-\fboxsep
%      % There is no \\@totalrightmargin, so:
%      \hskip-\linewidth \hskip-\@totalleftmargin \hskip\columnwidth}%
%  \MakeFramed {\advance\hsize-\width
%    \@totalleftmargin\z@ \linewidth\hsize
%    \@setminipage}}%
%  {\par\unskip\endMakeFramed%
%  \at@end@of@kframe}
% \makeatother


\defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
\setmainfont{Helvetica}%Helvetica Neue

% \AtBeginDocument{
%   \setkomavar{signature}{\\% 
%     \vspace{-40pt}%
%     \includegraphics[scale=0.7]{%
%       /Users/lichthau/Documents/private/pics/signatures/my_signature.pdf%
%     }\\%
%     \usekomavar{fromname}%
%   }
% }

\endinput