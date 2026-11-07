% sagar-notes.cls
% Class for Sagar's notes/worksheets: article + all sagar styles + hyperref.
%   \documentclass{sagar-notes}            student copy (default)
%   \documentclass[teacher]{sagar-notes}   teacher copy (hints, answers, teacher-only text)
% Other options: 10pt 11pt 12pt (default 12pt), oneside twoside (default twoside);
% anything else (fleqn, leqno, draft, ...) is passed on to article.
% Copyright (c) 2025-2026 Sagar Tamhankar -- MIT License
% ============================================================

\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{sagar-notes}[2026/11/07 v2.0 Sagar Notes Class]

% ------------------------------------------------------------
% Options
% ------------------------------------------------------------
\newcommand*{\sagar@size}{12pt}
\newcommand*{\sagar@side}{twoside}
\DeclareOption{teacher}{\PassOptionsToPackage{teacher}{sagar-notes}}
\DeclareOption{student}{\PassOptionsToPackage{student}{sagar-notes}}
\DeclareOption{10pt}{\renewcommand*{\sagar@size}{10pt}}
\DeclareOption{11pt}{\renewcommand*{\sagar@size}{11pt}}
\DeclareOption{12pt}{\renewcommand*{\sagar@size}{12pt}}
\DeclareOption{oneside}{\renewcommand*{\sagar@side}{oneside}}
\DeclareOption{twoside}{\renewcommand*{\sagar@side}{twoside}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper,\sagar@size,\sagar@side]{article}

% ------------------------------------------------------------
% Packages
% ------------------------------------------------------------
\RequirePackage{sagar-math}
\RequirePackage{sagar-graphics-tikz-core}
\RequirePackage{sagar-boxes}
\RequirePackage{sagar-article-core}
\RequirePackage{sagar-notes}

% ------------------------------------------------------------
% hyperref LAST, then bookmark (bookmark must come after hyperref)
% ------------------------------------------------------------
\PassOptionsToPackage{pdfusetitle}{hyperref}   % PDF title/author from \title / \author
\RequirePackage{hyperref}
\hypersetup{
  colorlinks = true,
  linkcolor  = primaryblue,
  citecolor  = secondarygreen,
  urlcolor   = primaryblue,
  filecolor  = accentorange,
  pdfstartview = FitH,
  linktoc    = all
}
\RequirePackage{bookmark}
\bookmarksetup{open, openlevel=2, numbered}

\endinput
