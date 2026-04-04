# Scholia

[![Maintenance](https://img.shields.io/maintenance/yes/2026)]()
[![License: LPPL](https://img.shields.io/badge/License-LPPL--1.3c-blue.svg)](https://www.latex-project.org/lppl/)

Structures mathematics course documents and Beamer presentations through modular LaTeX
macros.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Quick Start](#quick-start)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [Acknowledgments](#acknowledgments)
- [License](#license)

## Overview

### Motivation

Mathematics courses and presentations require a consistent set of environments
(definitions, theorems, exercises, grading rubrics) with uniform styling, numbering,
and pedagogical conventions. Without a shared package, each document re-implements
these environments with inconsistent interfaces and styling.

### Advantages

- **Unified environment library** — a single `\usepackage{scholia}` loads 13 callout
  types, exercise environments, grading tools, and numbering systems.
- **Beamer integration** — headline modes, objective banners, progress bars, and slide
  composition helpers integrate directly into presentations.
- **Interactive features** — clickable hide/reveal toggles content visibility through
  OCG layers for progressive disclosure in PDFs.
- **i18n support** — localizations cover French and English.

---

## Features

- [x] **Callouts**: Render 13 styled callout types (definition, theorem, proof,
  warning, error, tip, method, notation, objective, summary, remark, question,
  instruction) plus concise and title-only variants.
- [x] **Cards**: Display floating-label card callouts with badge icons and custom
  presets.
- [x] **Typed Pages**: Insert standalone page banners, full-page wrappers, and
  summary/keypoint helpers.
- [x] **Numbering Systems**: Track structured steps, substeps, questions, and
  subquestions.
- [x] **Exercises and Grading**: Compose guided, semi-guided, autonomous, and modeling
  exercises with rubrics, grading tables, and point tracking.
- [x] **Beamer Tools**: Configure headline modes, objective banners, progress bars, and
  slide composition helpers.
- [x] **Interactive Hide/Reveal**: Toggle content visibility through clickable OCG
  layers.
- [x] **Code Listings**: Typeset code with `pythonlisting` and `scholialisting`
  environments without global `listings` side effects.

---

## Quick Start

```latex
\documentclass{article}
\usepackage{scholia}

\begin{document}

\begin{definitionbox}[Function]
A \textbf{function} $f: A \to B$ assigns exactly one element of $B$
to each element of $A$.
\end{definitionbox}

\begin{exguided}[Linear Equations]
Solve $2x + 5 = 11$.
\exstep{Subtract 5 from both sides} $2x = 6$
\exstep{Divide by 2} $x = 3$
\end{exguided}

\end{document}
```

---

## Documentation

| Guide | Content |
| ----- | ------- |
| [Installation](docs/guide/installation.md) | Local texmf, git submodule, CTAN/TDS setup |
| [Usage](docs/guide/usage.md) | Callouts, exercises, grading, cards, numbering, Beamer, hide/reveal |
| [Configuration](docs/guide/configuration.md) | Package options, compatibility, requirements |

---

## Contributing

Contribution guidelines are described in [CONTRIBUTING.md](CONTRIBUTING.md).

---

## Acknowledgments

### Authors

**Author**: Esther Poniatowski

### Credits

- Icons: [Lucide](https://lucide.dev/) (ISC License).
- Interactive hide/reveal: Réginald Bayle (original concept).

---

## License

Copyright 2025-2026 Esther Poniatowski.

This work may be distributed and/or modified under the conditions of the
LaTeX Project Public License (LPPL), version 1.3c or later.
See [LICENSE](LICENSE) for the full license text.
