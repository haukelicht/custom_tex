\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{workingpaper}[2019/05/28 My working paper LaTeX class]

% -------------------------------------- %
% ------ Preliminary Declarations ------ %
% -------------------------------------- %

% --- Article class ---% 

\LoadClass[a4paper]{article}

% --- Parsers ---% 

\RequirePackage{ifthen}
\RequirePackage{xparse}
\@ifpackageloaded{kvoptions}{}{\RequirePackage{kvoptions}}

% function takes package options (optionally) and 
% package name, and loads or adapts it
\NewDocumentCommand{\loadpkg}{%
  O{}%
  m%
}{%
  \@ifpackageloaded{#2}{%
    \ifelsethen{\equal{#1}{}}{%
      % no action if no new arguments%
    }{%
      \PassOptionsToClass{#1}{#2}%
    }%
  }{%
    \RequirePackage[#1]{#2}%
  }%
}


% --- Characters, fonts and symbols --- %

% encoding and font style
\loadpkg[utf8]{inputenc}
\loadpkg[T1]{fontenc}
\loadpkg{lmodern}

% extended math mode functionality
\loadpkg{amsmath}
\loadpkg{amsthm}
\loadpkg{amssymb}

% language use
\loadpkg[english]{babel}
\IfFileExists{csquotes.sty}{\RequirePackage{csquotes}}{}


% --- Layout --- %

\loadpkg{geometry}

% title layout
\loadpkg{titling}
% push title 1 inch towards top of page
\setlength{\droptitle}{-1in}

% customize title section headings
\loadpkg[raggedright]{titlesec}

% allows to set linespacing with custom 'linespace' option
\loadpkg{setspace}

% customize footnotes
\addtolength{\skip\footins}{6pt}
% create footnote separator for multiple footnotes
\newcommand{\fnsep}{\textsuperscript{,\,}}

% URL style
\loadpkg{url}
\urlstyle{same}


% -------------------------------------- %
% ----------- Declare Options ---------- %
% -------------------------------------- %

% set global options parameters
\SetupKeyvalOptions{%
   family=WP,
   prefix=WP@,
}

% options passed to 'babel' package
\DeclareStringOption[ngerman,english]{languages}

% --- Layout --- %

% options passed to 'margins' package
\DeclareStringOption[1.5in]{mleft}%
\DeclareStringOption[1.5in]{mright}%
\DeclareStringOption[1in]{mtop}%
\DeclareStringOption[1in]{mbottom}%

% option to set linespacing using the 'setspace' package
\DeclareStringOption[onhalf]{linespace}

% --- Referencing --- %

% back-referencing
\DeclareStringOption[black]{citecolor}%
\DeclareStringOption[black]{linkcolor}%
\DeclareStringOption[black]{urlcolor}%

% biblatex option
\DeclareBoolOption[true]{biblatex}
\DeclareBoolOption[true]{bibibid}
\DeclareStringOption[false]{biburl}
\DeclareStringOption[false]{bibdoi}
\DeclareStringOption[false]{bibisbn}
\DeclareStringOption[true]{bibdashed}
\DeclareStringOption[2]{bibmaxcite}
\DeclareStringOption[99]{bibmaxbib}

\DeclareStringOption[%
  % default .bib file path
  ~/switchdrive/Documents/work/phd/phd_research.bib%
]{bibpath}


% pass all other unknown arguments to 'article' class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% -------------------------------------- %
% ----------- Parse Options ------------ %
% -------------------------------------- %


\ProcessKeyvalOptions*
\ProcessOptions\relax

% --- Layout --- %

\PassOptionsToClass{%
  a4paper%
  , left=\WP@mleft%
  , right=\WP@mright%
  , top=\WP@mtop%
  , bottom=\WP@mbottom%
}{geometry}

% set line spacing
\ifthenelse{\equal{\WP@linespace}{single}}{
  % if 'single'
  \singlespacing
}{
  % else 
  \ifthenelse{\equal{\WP@linespace}{onehalf}}{
    % if 'onehalf'
    \onehalfspacing
  }{
    % else
    \ifthenelse{\equal{\WP@linespace}{double}}{
      % if 'double'
      \doublespacing
    }{
      % Warning
      \ClassWarningNoLine{workingpaper}{%
        Unknown value passed to argument `spacing`. Defaults 'onhalf'. 
        (Choose either of 'single', 'onehalf', or 'double'.)%
      }
    }
  }
}


% --- Language --- % 

% pass 'languages' arguments to 'babel' package
\PassOptionsToPackage{\WP@languages}{babel}


% --- Referencing --- % 

% pass arguments to 'hyperref' package
\loadpkg[%
  colorlinks=true%
  , citecolor=\WP@citecolor%
  , linkcolor=\WP@linkcolor%
  , urlcolor=\WP@urlcolor%
  , hyperfootnotes=true%
]{hyperref}

% start evaluating 'biblatex' option
\ifWP@biblatex
  
  % bibliography setup
  \loadpkg[%
    bibencoding=utf8%
    , hyperref=true%
    , url=\WP@biburl%
    , doi=\WP@bibdoi%
    , isbn=\WP@bibisbn%
    , backref=false%
    , natbib=true%
    , backend=bibtex%
    , style=authoryear-icomp%
    , sorting=nyt%
    , dashed=\WP@bibdashed%
    , mincitenames=1%
    , maxcitenames=\WP@bibmaxcite%
    , maxbibnames=\WP@bibmaxbib%
  ]{biblatex}%

  % default library path
  \addbibresource{\WP@bibpath}%

  % clear references 
  \AtEveryBibitem{%
    \clearlist{language}%
    \clearfield{month}%
    \clearfield{day}%
    \clearfield{type}%
    \clearfield{note}%
  }%

  % start evaluating 'bibibid' option
  \ifWP@bibibid
    % switch off ibid
    \citetrackertrue
  \else
    % switch off ibid
    \citetrackerfalse
  % end evaluating 'ibid' option
  \fi

% end evaluating 'biblatex' option
\fi



% -------------------------------------- %
% ------ Additional Declarations ------- %
% -------------------------------------- %


% define custom theorem style (requires 'amsthm' package)
\makeatletter
\newtheoremstyle{indented}
  {6pt}% space before
  {6pt}% space after
  {%
    \addtolength{\@totalleftmargin}{\parindent}%
    \addtolength{\linewidth}{-2\parindent}%
    \parshape 1 \parindent \linewidth%
  }% body font
  {}% indent
  {\bfseries}% header font
  {:}% punctuation
  {.5em\itshape}% after theorem header
  {}% header specification (empty for default)
\makeatother

% define new theorem-like environments (requires 'amsthm' package)
\theoremstyle{indented}
\newtheorem{RQ}{RQ}
\newtheorem{hypo}{Hypothesis}

