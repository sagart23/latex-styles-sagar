# Sagar LaTeX Style Files

Custom `.sty` files for exams, notes, and mathematics.

These packages are designed for ICSE/ISC-style question papers and professional-looking study notes.

---

## 📦 Packages Included

| Package | Purpose |
|--------|---------|
| `sagar-math.sty` | Core math packages — AMS, mathtools, physics, siunitx, rupee symbol, `\cosec` |
| `sagar-graphics-tikz.sty` | Graphics, tables & plotting — TikZ, pgfplots, circuitikz, tabularray, wrapfig, etc. |
| `sagar-boxes.sty` | All tcolorbox environments — definitions, theorem, example, notes, solutions, teaching tips, highlight commands |
| `sagar-exam-core.sty` | Exam layout — geometry, margin points, boxes for instructions/header/section, question formatting (for `exam` class) |
| `sagar-article-core.sty` | Notes/article layout — fonts, spacing, headers/footers, microtype, QR, todo notes (for `article` class) |

---

## 🔧 Installation

Clone this repository **directly inside your local TEXMF tree** so LaTeX can find the `.sty` files automatically.

### Linux (TeX Live)

```bash
mkdir -p ~/texmf/tex/latex
cd ~/texmf/tex/latex
git clone https://github.com/sagart23/latex-styles-sagar.git
texhash ~/texmf    # only needed the first time or when new .sty files are added
````

### Windows (MiKTeX)

1. Make sure you have (or create) a user TEXMF path:

```
C:\Users\<username>\texmf\
```

2. In MiKTeX Console → Settings → Directories → Add:

```
C:\Users\<username>\texmf
```

3. Clone the repo inside the LaTeX tree:

```bash
cd "C:/Users/<username>/texmf/tex/latex"
git clone https://github.com/<YOUR_USERNAME>/latex-styles-sagar.git
```

4. MiKTeX Console → Tasks → **Refresh FNDB**
   (only needed the first time or when new `.sty` files are added)

---

## ✨ Usage Examples

### Exam Document (`exam` class)

```latex
\documentclass[a4paper,addpoints,12pt]{exam}

\usepackage{sagar-math}
\usepackage{sagar-graphics-tikz}
\usepackage{sagar-boxes}
\usepackage{sagar-exam-core}

\begin{document}
\begin{questions}
  \question[2] Solve: \( 2x + 3 = 7 \).
\end{questions}
\end{document}
```

### Notes / Article Document (`article` class)

```latex
\documentclass[a4paper,12pt,twoside]{article}

\usepackage{sagar-math}
\usepackage{sagar-graphics-tikz}
\usepackage{sagar-boxes}
\usepackage{sagar-article-core}

\begin{document}
\section{Introduction}

\begin{definition}{Rational Number}
A number that can be written as \( \frac{p}{q} \) where \( p,q \in \mathbb{Z} \) and \( q \neq 0 \).
\end{definition}

\end{document}
```

---

## 🔁 Updating on Any Machine

```bash
cd path/to/texmf/tex/latex/latex-styles-sagar
git pull
```

⚠️ FNDB refresh is only required if **new `.sty` files are added**.
Updating existing ones does **not** need refresh.

---

## 📝 Versioning (recommended practice)

Inside each `.sty` file, keep:

```latex
\ProvidesPackage{sagar-math}[2025/11/24 v1.1 Sagar math package]
```

Whenever you change a file:

* update date + version number
* commit + push

This helps track which document was built with which version.

---

## 📄 License

This project is licensed under the **MIT License**.

You are free to use, copy, modify, and distribute the `.sty` files in personal or commercial projects, as long as attribution to **Sagar Tamhankar** is maintained.

---

## 📬 Contact / Issues / Requests

If you encounter bugs, want a new feature or environment, or want to request improvements, open an **Issue** on GitHub.

Happy TeX-ing! 🚀

Just say **“enhance repo”** and I’ll set it up step-by-step.
```
