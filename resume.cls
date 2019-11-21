%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{amssymb}

\addtolength{\textheight}{-0.6cm}
\addtolength{\voffset}{0.3cm}
\addtolength{\footskip}{-0.4cm}


\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address (and date)
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \cvtitle#1{\def\@cvtitle{#1}} % Defines the \cvtitle command to set cvtitle
\def \@cvtitle {} % Sets \@cvtitle to empty by default

\def \date#1{\def\@date{#1}} % Defines the \date command to set date
\def \@date {} % Sets \@date to empty by default

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One to five address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax
\let \@addressfour \relax
\let \@addressfive \relax

% \address command can be used to set the address (last 4 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
    \@ifundefined{@addressthree}{
      \def \@addressthree {#1}
    }{
      \@ifundefined{@addressfour}{
        \def \@addressfour {#1}
      }{
        \@ifundefined{@addressfive}{
          \def \@addressfive {#1}
        }{
           \def \@addressone {#1}
        }
      }
    }
  }
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{%
  \begingroup%
    \def\ {\addressSep\ }%
    \centerline{#1}%
  \endgroup%
  \par%
  \addressskip%
}

% \printname is used to print the name as a page header

\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

% \printcvtitle is used to print the cvtitle as a page header
\def \printcvtitle {
  \begingroup
    \hfil{\cvtitlesize\sc \@cvtitle}\hfil
    \cvtitleskip\break
  \endgroup
}

% \printdate is used to print the name as a page header
\def \printdate {
  \begingroup
    \hfil{\datesize \@date}\hfil
    \dateskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  % \printcvtitle % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}
  }%
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}
  }%
  \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}
  }%
  \@ifundefined{@addressfour}{}{ % Print the second address if specified
    \printaddress{\@addressfour}
  }%
  \@ifundefined{@addressfive}{}{ % Print the third address if specified
    \printaddress{\@addressfive}
  }%
  \printdate % Print the date specified with \date
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \MakeUppercase{\bf #1} % Section cvtitle
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
  \item[]
}{
  \end{list}
  \sectionskip
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job cvtitle and location
 \smallskip
 {\bf #1} \hfill {#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job cvtitle and location line; else
  \\ % print in new line
  {\em #3} \hfill {\em #4}% Italic job cvtitle and location
  }\smallskip%
  \begin{list}{$\cdot$}{\leftmargin=2em \rightmargin=2em} % \cdot used for bullets, no indentation; otherwise \tiny$\surd$
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\cvtitlesize{\LARGE} % Size of the name at the top of the document
\def\datesize{\large} % Size of the date at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\medskip} % The space after your name at the top
\def\cvtitleskip{\bigskip} % The space after your name at the top
\def\dateskip{\medskip}  % The space after the date at the top
\def\sectionskip{\medskip} % The space after the heading section
