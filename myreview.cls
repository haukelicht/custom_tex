\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myreview}[2018/09/18 Custom Review LaTeX class]
 
\LoadClass[%
    12pt%
    , a4%
    , twocolumn%
]{article}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax
 
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}

\RequirePackage{setspace}
\onehalfspacing
\setlength{\columnsep}{4ex}

\RequirePackage{haukelicht}
\RequirePackage[%
    narrow=false%
    , topsep=0ex%
    , itemsep=-1ex%
]{items}

\RequirePackage{titling}
\setlength{\droptitle}{-1.5in}

\newcommand{\reviewhead}[3][\iauthor\thanks{\ \iaffiliation\ Contact: \iemail}]{%
    \title{\Large Review of \emph{#2}, Ph.D. Proposal by #3}%
    \author{\large #1}%
}