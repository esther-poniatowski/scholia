# Scholia

Modular LaTeX package for structured educational documents and Beamer presentations in mathematics teaching.

## Features

- **Callouts** — 13 styled callout types plus concise and title-only variants
- **Cards** — Floating-label card callouts with badge icons and custom presets
- **Typed Pages** — Standalone page banners, full-page wrappers, and summary/keypoint helpers
- **Numbering Systems** — Structured steps, substeps, questions, and subquestions
- **Exercises and Grading** — Guided exercises, rubrics, grading tables, and point tracking
- **Beamer Tools** — Headline modes, objective banners, progress bars, and slide composition helpers
- **Interactive Hide/Reveal** — Clickable content toggling based on OCG layers for progressive disclosure
- **Shared Icons** — Single icon interface backed by PDF, reused across the package
- **Code Listing Helpers** — Explicit `pythonlisting` and `scholialisting` environments without global `listings` side effects
- **i18n Support** — French and English localizations

## Installation

### Local Installation

Install the `scholia/` tree in a local texmf root, for example:

```text
~/texmf/tex/latex/scholia/
```

Then load the package normally:

```latex
\usepackage{scholia}
```

For local repository builds, a custom `\CommonPath` macro can define the package path:

```latex
\newcommand{\CommonPath}{path/to}
\usepackage{\CommonPath/scholia/scholia}
```

### CTAN / TDS Archives

Scholia ships an `l3build` configuration for generating CTAN and TDS archives:

```bash
l3build check
l3build manifest
l3build ctan
```

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
| `english`     | Use English strings (default)                                   |
| `french`      | Use French strings                                              |
| `beamer`      | Enable Beamer presentation mode                                 |
| `solutions`   | Show solutions in exercises (via `\solutionBlank`)              |
| `interactive` | Enable hide/reveal features based on OCG (requires capable viewer) |
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

- `\exstep[title]` — Numbered exercise step
- `\resetexsteps` — Reset the exercise step counter
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

## Cards

Cards are a second callout family with a floating title label and a circular icon
badge.

```latex
\begin{cardbox}[title={Key insight}, icon={lightbulb.pdf}, color=blue]
Card body content.
\end{cardbox}
```

Scholia currently ships one built-in preset:

```latex
\begin{ideacard}[title={Key insight}]
Important observation.
\end{ideacard}
```

Custom presets can be registered with:

```latex
\NewScholiaCardType{research}{color=scholia-research, icon=telescope.pdf}
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

The placeholder commands `\revealAll` and `\hideAll` currently warn only; they
do not implement a global toggle yet.

## Beamer Tools

In beamer mode, Scholia defaults to an objective banner controlled by:

```latex
\setobjective{Persistent objective text}
```

Headline behavior can be reconfigured with:

```latex
\scholiaBeamerSetup{headline mode=frametitle}
\scholiaBeamerSetup{headline mode=progressbar, show frame number=false}
```

Supported modes are:
- `objective` — persistent objective banner in the headline
- `frametitle` — frametitle banner, empty headline
- `progressbar` — thin progress bar in the headline and underlined frametitle

Beamer utility helpers:

```latex
\titlebackground{images/title-background.jpg}
\bottomtext{Source: Author, Year}
\fadedoval[color=blue!50, horizontal radius=3cm]{Key idea}
```

## Shared Icon Helper

The public icon command is:

```latex
\scholiaicon[height=1.2em, fallback={[idea]}]{lightbulb.pdf}
```

Runtime icon loading is PDF-only. The `noicons` option suppresses icon loads
across callouts, cards, exercises, typed pages, summaries, and beamer banners.

## Public Surface

Load the package at the top level:

```latex
\usepackage{scholia}
```

The internal files under `base/`, `beamer/`, `callouts/`, `cards/`,
`typedpages/`, `grading/`, `exercises/`, and related directories are part of
Scholia's implementation layout. They are documented for maintainers, but they
are not a stable public interface for external documents.

## Requirements

- LaTeX2e (2020/10/01 or later)
- `tcolorbox` with `skins`, `breakable`, `xparse` libraries
- `tikz` with standard libraries
- `xparse`, `etoolbox`, `enumitem`, `xcolor`

## Compatibility

### TeX Engines

| Engine | Status |
|--------|--------|
| pdfLaTeX | ✅ Covered by the current regression suite |
| XeLaTeX | ⚠️ Not covered by the current regression suite |
| LuaLaTeX | ⚠️ Not covered by the current regression suite |

### Document Classes

| Class | Status |
|-------|--------|
| `article` | ✅ Covered by the current regression suite |
| `beamer` | ✅ Covered by the current regression suite |
| `book`, `report`, `memoir`, `scrartcl` | ⚠️ Not in the current regression suite |

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

*Version 0.2.0 — 2026-03-20*
