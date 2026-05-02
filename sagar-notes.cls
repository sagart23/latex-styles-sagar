\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sagar-notes}[2026/05/02 Sagar Notes Class]

% ============================================================
% OPTIONS HANDLING
% ============================================================

\newif\if@teacher

\DeclareOption{teacher}{\@teachertrue}
\DeclareOption{student}{\@teacherfalse}

% Default option
\ExecuteOptions{student}

\ProcessOptions\relax

% ============================================================
% BASE CLASS
% ============================================================

\LoadClass[a4paper,12pt,twoside]{article}

% ============================================================
% CORE PACKAGES
% ============================================================

\RequirePackage{sagar-math}
\RequirePackage{sagar-graphics-tikz-core}
\RequirePackage{sagar-boxes}
\RequirePackage{sagar-article-core}
\RequirePackage{sagar-notes}

% ============================================================
% APPLY MODE BASED ON OPTION
% ============================================================

\if@teacher
  \teachermode
\else
  \studentmode
\fi

% ============================================================
% HYPERREF (DEFAULT CONFIG)
% ============================================================

\RequirePackage{hyperref}
\hypersetup{
  colorlinks  = true,
  linkcolor   = primaryblue,
  citecolor   = secondarygreen,
  urlcolor    = primaryblue,
  filecolor   = accentorange,
  bookmarks   = true,
  bookmarksopen      = true,
  bookmarksopenlevel = 2,
  pdfstartview       = FitH,
  linktoc            = all
}

\endinput
