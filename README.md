# Sagar LaTeX Styles — v2.0

Custom `.sty` / `.cls` files for ICSE/ISC question papers, notes and worksheets.
**All v1.x file names and environment names still work.** Existing documents should compile unchanged.

Requires TeX Live / MiKTeX **2022 or newer** (siunitx v3, LaTeX kernel 2022). Works with pdfLaTeX, XeLaTeX and LuaLaTeX.

---

## 1. What is in the box

| File | Purpose | Loads |
|---|---|---|
| `sagar-base.sty` **(new)** | Fonts, microtype, setspace, colour palette, graphicx, `multicol`, `multirow`, table tools, `\rupee`. The one place shared things live. | — |
| `sagar-math.sty` | amsmath, mathtools, siunitx, `\cosec`, `\bvec` (option `derivs` adds `\dv \ddv \pdv`) | base |
| `sagar-graphics-tikz-core.sty` | TikZ, tkz-euclide, pgfplots (option `noplots` skips pgfplots) | base |
| `sagar-graphics-extended.sty` | circuitikz, statistics plots, decorations. **Fixed** (v1 required a file that did not exist) | tikz-core |
| `sagar-boxes.sty` | All coloured boxes + `\highlight`, `\emphred`, … Make new boxes in one line | base |
| `sagar-article-core.sty` | Notes layout: spacing, margins, todonotes (option `todos`), QR codes | base |
| `sagar-exam-core.sty` | Exam margins + `exam.cls` labels and marks (option `lean`) | base |
| `sagar-exam-extended.sty` | Header / instructions / section / question / grade-table boxes | exam-core, boxes |
| `sagar-notes.sty` + `sagar-notes.cls` | Headers/footers, section styling, teacher/student mode; class = article + everything + hyperref | all of the above |
| `exam-minimal.sty` | Lean exam preamble = base + tikz-core (no plots) + exam-core (lean) | |
| `sagar-graphics-core.sty`, `sagar-graphics-tikz.sty` | Compatibility shims for old names. Do not use in new documents | |

```
sagar-base
 ├─ sagar-math
 ├─ sagar-graphics-tikz-core ── sagar-graphics-extended
 ├─ sagar-boxes
 ├─ sagar-article-core
 ├─ sagar-exam-core ── sagar-exam-extended (also loads boxes)
 └─ sagar-notes.sty ── sagar-notes.cls
```

---

## 2. Install (once per machine)

Put the repo inside your personal TEXMF tree so every project can find it, wherever it lives on disk.

**Linux / macOS (TeX Live)**
```bash
mkdir -p "$(kpsewhich -var-value TEXMFHOME)/tex/latex"
cd "$(kpsewhich -var-value TEXMFHOME)/tex/latex"
git clone https://github.com/sagart23/latex-styles-sagar.git
texhash "$(kpsewhich -var-value TEXMFHOME)"
```

**Windows (MiKTeX)**
1. Create `C:\Users\<you>\texmf\tex\latex\` and clone the repo into it.
2. MiKTeX Console → Settings → Directories → add `C:\Users\<you>\texmf`.
3. Tasks → **Refresh file name database**.

**Check it works:** `kpsewhich sagar-base.sty` should print a path.
Update later with `git pull`. A refresh is only needed when *new* files are added (v2.0 adds several, so refresh once).

**Overleaf / a colleague's machine:** upload the `.sty`/`.cls` files you use to the project root (they cannot see your TEXMF tree).

---

## 3. Quick recipes

**Notes / worksheets** (the class does everything)
```latex
\documentclass{sagar-notes}            % student copy
% \documentclass[teacher]{sagar-notes} % shows \hint, \ans, \teacheronly
\setupschool{My School}{MS}{Mathematics Department}
\begin{document} ... \end{document}
```
Class options: `teacher`/`student`, `10pt`/`11pt`/`12pt` (default 12), `oneside`/`twoside` (default twoside); anything else goes to `article`.

**Full exam paper**
```latex
\documentclass[a4paper,addpoints,12pt]{exam}
\usepackage{sagar-math}
\usepackage{sagar-graphics-tikz-core}
\usepackage{sagar-exam-extended}   % pulls in exam-core + boxes
```

**Lean exam paper** (own margins, only what a paper needs)
```latex
\documentclass[a4paper,addpoints,12pt]{exam}
\usepackage[margin=2cm]{geometry}
\usepackage{exam-minimal}
```

Working examples are in `examples/`.

**Multi-column and merged cells (now loaded everywhere)**
- Text columns: `\begin{multicols}{2} … \end{multicols}` (package `multicol`)
- Merged table cells: `\multicolumn{3}{|c|}{…}` (built into LaTeX) and `\multirow{2}{*}{…}` (package `multirow`)

**Your own box in one line**
```latex
\NewSagarBox{tipbox}{secondarygreen}{5}{70}{Tip}            % \begin{tipbox} … \end{tipbox}
\NewSagarTitledBox{remark}{primaryblue}{5}{80}{Remark}      % \begin{remark}{Title} … \end{remark}
```
Arguments: environment, colour, background %, frame darkness %, title.

**Change the palette once**
```latex
\definecolor{primaryblue}{RGB}{0,80,140}   % after the \usepackage lines; boxes, headers and links follow
```

---

## 4. Should I use these instead of a big preamble?

Yes, with one rule: **shared, stable things go in the `.sty` files; things specific to one document stay in that document.**

Keep in the `.sty` files: fonts, packages, colours, boxes, math macros, TikZ libraries, table tools.
Keep in each `.tex`: title, school/exam name, hyperref tweaks, headers for that paper, watermarks, one-off macros.

Why it suits a folder tree with many subfolders:
- Installed in TEXMF, the files are found from **any** subfolder. No `../../` paths, no `\input{../../preamble}`, nothing breaks when you move a project.
- One fix (e.g. a colour or a box) updates every document on the next compile.
- Each document's preamble shrinks to about 5 lines.

Habits that avoid surprises:
- Track the folder with git and commit when you change a style. Every file carries a version/date line, and `\listfiles` at the end of a `.tex` prints which versions were used.
- A change in a `.sty` affects **old** documents when you recompile them. For papers you must reproduce exactly (e.g. past exams), tag the repo (`git tag 2026-board-exam`) or keep a copy of the styles next to the final PDF.
- When you share a document, send the `.sty` files it uses along with it.
- Load packages in your documents *after* the sagar files. For xcolor options, use `\PassOptionsToPackage{dvipsnames}{xcolor}` **before** the first sagar file. For page layout use `\geometry{…}`, not a second `\usepackage[…]{geometry}` (that is an option clash).

---

## 5. What changed in v2.0

**Redundancy removed**
- `fontenc`, `lmodern`, `microtype`, `setspace`, `tfrupee`, `graphicx` and the table packages were repeated in 3–5 files → now only in `sagar-base`.
- The `exam.cls` label/marks block existed twice (`exam-core`, `exam-minimal`) → once.
- The colour palette was defined twice with different values → once.
- 11 near-identical 25-line box definitions → one shared style + one line per box (`sagar-boxes.sty` 326 → 81 lines, same look).
- `tcolorbox` libraries listed twice (`most` already includes them).

**Bugs fixed**
- `sagar-graphics-extended` could not load (required the non-existent `sagar-graphics-core`).
- Odd-page header in notes was always empty (used `\rightmark`, which was never set).
- `bookmark` was loaded before `hyperref` (hyperref warning) → now after.
- `headheight` was too small (fancyhdr warning) → 25 pt.
- `microtype`: `babel=true` without babel, and `tracking/kerning/spacing` crashed XeLaTeX/LuaLaTeX → fixed; `spacing=true` dropped (it silently disabled sentence spacing).
- siunitx `detect-all` (deprecated) → modern equivalent.
- `\maketitle` page had only a bare page number → now "Page 1 of N".
- `sagar-article-core` + `sagar-exam-core` in one document gave `Option clash for package geometry` → now set via `\geometry{}`.

**Modernised**
- `\NewTColorBox` / `\NewDocumentCommand`; engine-aware fonts (`iftex`); `sectsty` → `titlesec` (old `\sectionfont` etc. still work); `hyperref` + `pdfusetitle`; `\rupee` falls back to "Rs." with a warning if `tfrupee` is missing; `\bvec` no longer errors if you define your own.

**Visible differences from v1.x** (everything else looked identical in side-by-side renders of my test documents)
1. `exam-minimal` now uses the same blue/green as the rest (`#006699`/`#339966`) instead of its own `#1A5276`/`#1E8449`. To keep the old shades: `\definecolor{primaryblue}{HTML}{1A5276}`.
2. Odd-page notes headers now show the section title.
3. Section headings use `titlesec`; spacing matches `article` to within a few points.
4. The `sagar-graphics-tikz` shim is rebuilt from the old README description (core + extended + wrapfig + tabularray).

**Left as is** (your design, not touched): `\sectionheader` draws an empty pale strip under the title bar; the notes school name defaults to CAJCS.

---

## 6. Troubleshooting

| Message | Fix |
|---|---|
| `File 'sagar-base.sty' not found` | Refresh the file name database (see §2). |
| `Package sagar-base Warning: tfrupee not found` | Install `tfrupee` with your TeX distribution's package manager; until then `\rupee` prints "Rs.". |
| `Option clash for package geometry/xcolor/tcolorbox` | Use `\geometry{…}` / `\PassOptionsToPackage` instead of a second `\usepackage[…]`. |
| `Environment axis undefined` after `exam-minimal` | `exam-minimal` skips pgfplots on purpose; use `sagar-graphics-tikz-core` **before** it (or add `\usepackage{pgfplots}`). |
| `Page 1 of ??` | Compile twice (LastPage needs a second run). |

---

MIT License — © Sagar Tamhankar. See `LICENSE`.
