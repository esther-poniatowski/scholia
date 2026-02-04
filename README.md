# Scholia

**Educational document formatting for mathematics pedagogy**

Scholia is a LaTeX package providing structured environments for creating educational mathematics documents, including callout boxes, exercise environments, grading tools, and worksheet layouts.

## Features

- **Callout Boxes** — 13 styled callout types (definitions, theorems, warnings, tips, methods, etc.)
- **Exercise Environments** — Guided, semi-guided, autonomous, and modeling exercises
- **Grading Tools** — Rubrics, grading scales, and point tracking
- **Fiche System** — Worksheet layouts with cross-referencing
- **Numbering Systems** — Structured steps, questions, and subquestions
- **Interactive Hide/Reveal** — OCG-based clickable content toggling for progressive disclosure
- **i18n Support** — French and English localizations

## Installation

### Local Installation

Place all `.sty` files in a directory accessible to your LaTeX installation, or use the `\CommonPath` mechanism:

```latex
\newcommand{\CommonPath}{path/to/scholia}
\usepackage{\CommonPath/scholia}
```

### TeX Live / MiKTeX

*(Coming soon via CTAN)*

## Quick Start

```latex
\documentclass{article}
\usepackage{scholia}

\begin{document}

\begin{definitionbox}[Function]
A \textbf{function} $f: A \to B$ assigns exactly one element of $B$
to each element of $A$.
\end{definitionbox}

\begin{warningbox}[Common Mistake]
Do not confuse a function with its graph!
\end{warningbox}

\begin{exguided}[Linear Equations]
Solve $2x + 5 = 11$.

\exstep{Subtract 5 from both sides}
$2x = 6$

\exstep{Divide by 2}
$x = 3$
\end{exguided}

\end{document}
```

## Package Options

| Option        | Description                                                     |
|---------------|-----------------------------------------------------------------|
| `french`      | Use French strings (default)                                    |
| `english`     | Use English strings                                             |
| `beamer`      | Enable Beamer presentation mode                                 |
| `solutions`   | Show solutions in exercises (via `\solutionBlank`)              |
| `interactive` | Enable OCG-based hide/reveal features (requires capable viewer) |
| `noicons`     | Disable icon loading (text-only callouts)                       |
| `minimal`     | Minimal dependencies (skips table packages, implies `noicons`)  |
| `draft`       | Draft mode (for future use)                                     |

```latex
\usepackage[english]{scholia}
\usepackage[beamer]{scholia}
\usepackage[interactive]{scholia}  % Enable hide/reveal
\usepackage[minimal]{scholia}      % Reduced dependencies
```

## Callout Types

| Environment | Purpose | Color |
|-------------|---------|-------|
| `definitionbox` | Mathematical definitions | Blue |
| `theorembox` | Theorems and propositions | Purple |
| `proofbox` | Mathematical proofs | Light purple |
| `warningbox` | Warnings and common mistakes | Orange |
| `errorbox` | What NOT to do | Red |
| `tipbox` | Tips and strategies | Green |
| `methodbox` | Step-by-step methods | Teal |
| `notationbox` | Notation conventions | Gray |
| `objectivebox` | Learning objectives | Yellow |
| `summarybox` | Summaries and recaps | Light gray |
| `remarkbox` | Observations | Purple |
| `questionbox` | Questions | Blue |
| `instructionbox` | Instructions | Gray |

Each callout has two variants:
- `*box` — Full box with optional title: `\begin{warningbox}[Title]...\end{warningbox}`
- `*mark` — Title-only banner command: `\warningmark{Title}` or `\warningmark[centered]{Title}`

## Exercise Environments

| Environment | Description |
|-------------|-------------|
| `exguided` | Step-by-step guided exercise |
| `exsemiguided` | Partial guidance with hints |
| `exauto` | Independent work (with difficulty stars) |
| `exmodel` | Problem-solving/modeling tasks |
| `excorrection` | Solution/correction display |

### Exercise Commands

- `\exstep{description}` — Numbered step
- `\resetExerciseSteps` — Reset step counter
- `\highlight{text}` — Subtle highlighting
- `\solutionBlank{answer}` — Conditional blank/answer

## Grading Tools

```latex
\begin{gradebox}[Grading Scale]
\gradeitem{Correct method}{2}
\gradeitem{Correct answer}{1}
\gradetotal{3}
\end{gradebox}
```

## Numbering

```latex
\begin{question}
What is $2 + 2$?
\end{question}

\begin{question}
Simplify the following:
\begin{subquestion}
$\frac{4}{8}$
\end{subquestion}
\begin{subquestion}
$\frac{6}{9}$
\end{subquestion}
\end{question}
```

## Interactive Hide/Reveal

The `interactive` option enables clickable content toggling using PDF Optional Content Groups (OCG). Hidden content appears with a dotted underline and reveals when clicked.

**Requirements:** PDF viewer with OCG support (Adobe Reader, PDF.js). Apple Preview does not support OCG toggling.

```latex
\usepackage[interactive]{scholia}

\begin{document}

% Basic hide/reveal
The capital of France is \hide{Paris}.

% With custom reveal color
The answer is \hide[red]{42}.

% In math mode
The derivative of $\sin(x)$ is $\hide{\cos(x)}$.

% Without underline indicator
The secret is \hideNoUnderline{hidden}.

\end{document}
```

### Beamer Integration

In Beamer presentations, the `\Hide` command combines OCG toggling with slide overlays:

```latex
\usepackage[beamer,interactive]{scholia}

\begin{frame}{Quiz}
  Question: What is $2 + 2$?

  % Hidden on slide 1, revealed from slide 2
  \Hide{1}{2-}{The answer is 4}
\end{frame}
```

### Commands

| Command                             | Description                             |
|-------------------------------------|-----------------------------------------|
| `\hide{content}`                    | Hidden content with dotted underline    |
| `\hide[color]{content}`             | Hidden content with custom reveal color |
| `\hideNoUnderline{content}`         | Hidden content without underline        |
| `\Hide{hide}{show}{content}`        | Beamer: hide on slides, show on slides  |
| `\Hide[color]{hide}{show}{content}` | Beamer variant with custom color        |

## Sub-packages

Scholia is modular. Individual components can be loaded separately:

| Package               | Features                       |
|-----------------------|--------------------------------|
| `scholia-callouts`    | Callout box system             |
| `scholia-exercises`   | Exercise environments          |
| `scholia-grading`     | Grading tools                  |
| `scholia-numbering`   | Steps and questions            |
| `scholia-fiches`      | Worksheet layouts              |
| `scholia-math`        | Math expression helpers        |
| `scholia-interactive` | OCG-based hide/reveal features |

## Requirements

- LaTeX2e (2020/10/01 or later)
- `tcolorbox` with `skins`, `breakable`, `xparse` libraries
- `tikz` with standard libraries
- `xparse`, `etoolbox`, `enumitem`, `xcolor`

## Compatibility

### TeX Engines

| Engine | Status |
|--------|--------|
| pdfLaTeX | ✅ Tested |
| XeLaTeX | ✅ Tested |
| LuaLaTeX | ✅ Tested |

### Document Classes

| Class | Status |
|-------|--------|
| `article` | ✅ Tested |
| `book` | ✅ Tested |
| `report` | ✅ Tested |
| `memoir` | ✅ Tested |
| `scrartcl` (KOMA) | ✅ Tested |
| `beamer` | ✅ Tested (use `[beamer]` option) |

### TeX Distributions

| Distribution | Status |
|--------------|--------|
| TeX Live 2024 | ✅ Tested |
| MiKTeX | ⚠️ Untested (should work) |

## License

Copyright 2025-2026 Esther Poniatowski

This work may be distributed and/or modified under the conditions of the
LaTeX Project Public License (LPPL), version 1.3c or later.

See [LICENSE](LICENSE) for the full license text.

## Credits

- Icons: [Lucide](https://lucide.dev/) (ISC License)
- Interactive hide/reveal feature: Réginald Bayle (original concept and implementation)

## Author

Esther Poniatowski <esther.poniatowski@ens.psl.eu>

---

*Version 0.1.1 — 2026-02-02*
