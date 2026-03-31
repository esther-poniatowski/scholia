# Usage

Scholia provides a unified set of LaTeX environments for mathematics course
documents and Beamer presentations. The package loads with a single
`\usepackage{scholia}` and adapts its behavior through package options.

For package options and compatibility details, refer to
[Configuration](configuration.md).

## Callout Environments

Thirteen callout types cover the standard needs of mathematics instruction.
Each callout accepts an optional title argument:

```latex
\begin{definitionbox}[Function]
A \textbf{function} $f: A \to B$ assigns exactly one element of $B$
to each element of $A$.
\end{definitionbox}

\begin{theorembox}[Intermediate Value Theorem]
...
\end{theorembox}

\begin{warningbox}[Common Mistake]
Do not confuse a function with its graph!
\end{warningbox}
```

Available callout types:

| Environment | Purpose | Color |
|---|---|---|
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

### Title-Only Variants

Each callout has a banner command for title-only markers:

```latex
\warningmark{Common Mistake}
\warningmark[centered]{Common Mistake}
```

## Exercise Environments

Five exercise types address different pedagogical scenarios:

| Environment | Description |
|---|---|
| `exguided` | Step-by-step guided exercise |
| `exsemiguided` | Partial guidance with hints |
| `exauto` | Independent work (with difficulty stars) |
| `exmodel` | Problem-solving and modeling tasks |
| `excorrection` | Solution and correction display |

### Exercise Commands

- `\exstep[title]` — Numbered exercise step.
- `\resetexsteps` — Reset the exercise step counter.
- `\highlight{text}` — Subtle highlighting.
- `\solutionBlank{answer}` — Conditional blank or answer (controlled by the
  `solutions` package option).

```latex
\begin{exguided}[Linear Equations]
Solve $2x + 5 = 11$.
\exstep{Subtract 5 from both sides} $2x = 6$
\exstep{Divide by 2} $x = 3$
\end{exguided}
```

## Grading Tools

Grade boxes display rubrics alongside exercises:

```latex
\begin{gradebox}[Grading Scale]
\gradeitem{Correct method}{2}
\gradeitem{Correct answer}{1}
\gradetotal{3}
\end{gradebox}
```

## Cards

Cards provide a second callout family with a floating title label and a
circular icon badge:

```latex
\begin{cardbox}[title={Key insight}, icon={lightbulb.pdf}, color=blue]
Card body content.
\end{cardbox}
```

A built-in preset is available:

```latex
\begin{ideacard}[title={Key insight}]
Important observation.
\end{ideacard}
```

Custom presets register with:

```latex
\NewScholiaCardType{research}{color=scholia-research, icon=telescope.pdf}
```

## Numbering Systems

Structured numbering for questions and subquestions:

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

The `interactive` package option enables clickable content toggling based on
PDF Optional Content Groups (OCG). Hidden content appears with a dotted
underline and reveals when clicked.

**Requirement:** A PDF viewer with OCG support (Adobe Reader, PDF.js). Apple
Preview does not support OCG toggling.

```latex
\usepackage[interactive]{scholia}

% Basic hide/reveal
The capital of France is \hide{Paris}.

% With custom reveal color
The answer is \hide[red]{42}.

% In math mode
The derivative of $\sin(x)$ is $\hide{\cos(x)}$.

% Without underline indicator
The secret is \hideNoUnderline{hidden}.
```

| Command | Description |
|---|---|
| `\hide{content}` | Hidden content with dotted underline. |
| `\hide[color]{content}` | Hidden content with custom reveal color. |
| `\hideNoUnderline{content}` | Hidden content without underline. |
| `\Hide{hide}{show}{content}` | Beamer: hide on specified slides, show on others. |
| `\Hide[color]{hide}{show}{content}` | Beamer variant with custom color. |

### Beamer Integration

In Beamer presentations, the `\Hide` command combines OCG toggling with slide
overlays:

```latex
\usepackage[beamer,interactive]{scholia}

\begin{frame}{Quiz}
  Question: What is $2 + 2$?
  \Hide{1}{2-}{The answer is 4}
\end{frame}
```

## Beamer Tools

In beamer mode, scholia defaults to an objective banner controlled by:

```latex
\setobjective{Persistent objective text}
```

Headline behavior is reconfigured with:

```latex
\scholiaBeamerSetup{headline mode=frametitle}
\scholiaBeamerSetup{headline mode=progressbar, show frame number=false}
```

Supported modes:

- `objective` — persistent objective banner in the headline.
- `frametitle` — frametitle banner, empty headline.
- `progressbar` — thin progress bar in the headline and underlined frametitle.

Beamer utility helpers:

```latex
\titlebackground{images/title-background.jpg}
\bottomtext{Source: Author, Year}
\fadedoval[color=blue!50, horizontal radius=3cm]{Key idea}
```

## Icons

The public icon command:

```latex
\scholiaicon[height=1.2em, fallback={[idea]}]{lightbulb.pdf}
```

Runtime icon loading is PDF-only. The `noicons` option suppresses icon loads
across callouts, cards, exercises, typed pages, summaries, and beamer banners.

## Next Steps

- [Configuration](configuration.md) — Package options and compatibility.
- [Installation](installation.md) — Local texmf, submodule, CTAN setup.
