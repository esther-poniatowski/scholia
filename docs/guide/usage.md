# Usage

Scholia adapts its behavior through package options passed at load time.
For option details and compatibility, refer to [Configuration](configuration.md).

```latex
\usepackage{scholia}
```

## Callout Environments

Thirteen callout types cover the standard needs of mathematics instruction.
Each callout type generates two environments:

- `<type>box` -- full callout with content area, accepting an optional title
  and an optional second argument for tcolorbox keys.
- `<type>mark` -- compact title-only banner, accepting an optional first
  argument for tcolorbox keys.

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
| `definitionbox` | Mathematical definitions | Cyan |
| `theorembox` | Theorems and propositions | Red |
| `proofbox` | Mathematical proofs | Gray (dotted frame) |
| `warningbox` | Warnings and common mistakes | Orange |
| `errorbox` | Common errors | Dark red |
| `tipbox` | Tips and strategies | Yellow |
| `methodbox` | Step-by-step methods | Blue |
| `notationbox` | Notation conventions | Gray-brown |
| `objectivebox` | Learning objectives | Green |
| `summarybox` | Summaries and recaps | Light gray (dotted frame) |
| `remarkbox` | Observations | Purple |
| `questionbox` | Questions | Blue |
| `instructionbox` | Instructions | Gray |

### Title-Only Variants

Each callout has a banner command for title-only markers:

```latex
\warningmark{Common Mistake}
\warningmark[centered]{Common Mistake}
```

### Special Callout Variants

`methodconcise` renders a method callout without a title bar:

```latex
\begin{methodconcise}
Apply the product rule.
\end{methodconcise}
```

`exampleillustration` provides a minimal dotted-border box for examples
alongside theoretical callouts:

```latex
\begin{exampleillustration}
Applying the theorem to $f(x) = x^2$ on $[0, 1]$...
\end{exampleillustration}
```

### Inline Hint Commands

`\methodHint` and `\approachHint` insert brief inline markers within
corrections or exercises:

```latex
\methodHint{Use the multiplication coefficient.}
\approachHint{Via the proportion definition.}    % Approach 1
\approachHint*{Via percentage of percentage.}    % Approach 2
```

### TikZ Node Styles

Callout boxes have TikZ node equivalents for parallel layouts where
precise positioning matters:

| TikZ style | Equivalent callout |
|---|---|
| `defnode` | `definitionbox` |
| `theoremnode` | `theorembox` |
| `warningnode` | `warningbox` |
| `tipnode` | `tipbox` |
| `exnode` | `exampleillustration` |
| `smallexnode` | Compact example node |
| `callout tikznode=<color>` | Generic callout node |
| `example tikznode` | Generic example node |

```latex
\begin{tikzpicture}
  \node[defnode] (def) {Definition content...};
  \node[exnode, right=1cm of def] {Example content...};
\end{tikzpicture}
```

## Exercise Environments

Four exercise types and one correction environment address different
pedagogical scenarios:

| Environment | Description |
|---|---|
| `exguided` | Step-by-step guided exercise |
| `exsemiguided` | Partial guidance with hints |
| `exauto` | Independent work (with optional difficulty stars) |
| `exmodel` | Problem-solving and modeling tasks |
| `excorrection` | Solution and correction display |

Each exercise environment accepts an optional title. `exauto` accepts a
second optional argument for difficulty level (1--3, displayed as stars).

```latex
\begin{exguided}[Linear Equations]
Solve $2x + 5 = 11$.
\exstep[Subtract 5] $2x = 6$
\exstep[Divide by 2] $x = 3$
\end{exguided}

\begin{exauto}[Polynomials][2]
Factor $x^2 - 5x + 6$.
\end{exauto}
```

### Exercise Inner Structure

| Command/Environment | Description |
|---|---|
| `\exstep[title]` | Lettered exercise step (a, b, c...) |
| `\resetexsteps` | Reset the step counter |
| `hint` | Italic hint block inside an exercise |
| `furtherreading` | Italic further-reading block inside an exercise |

```latex
\begin{exauto}[Integration]
\exstep Compute $\int x^2 \,dx$.
\begin{hint}
Apply the power rule.
\end{hint}
\exstep Verify by differentiation.
\begin{furtherreading}
See Chapter 5 for substitution techniques.
\end{furtherreading}
\end{exauto}
```

### Two-Column Exercise Layout

`extwocol` displays exercise content in two columns. An optional argument
adds a dotted separator:

```latex
\begin{extwocol}
Left-column content...
\columnbreak
Right-column content...
\end{extwocol}

\begin{extwocol}[separator]
Left-column content...
\columnbreak
Right-column content...
\end{extwocol}
```

### Correction Environment

`excorrection` displays corrections with automatic numbering. An optional
first argument overrides the exercise number (useful for partial correction
sheets):

```latex
\begin{excorrection}{Solving equations}
...
\end{excorrection}

\begin{excorrection}[3]{Polynomial factorization}
...  % Forces exercise number 3
\end{excorrection}
```

### Question Statement Highlight

`\qstatement` highlights a question statement inside a correction, with
automatic circled numbering:

```latex
\begin{excorrection}{Functions}
\qstatement{Calculate the image of 4.}
The image is $f(4) = 2 \times 4 + 1 = 9$.

\qstatement{Determine the antecedent(s) of 7.}
Solve $2x + 1 = 7$, so $x = 3$.
\end{excorrection}
```

## Fill-in and Blank Commands

| Command | Description |
|---|---|
| `\dotsBlank{n}` | Insert `n` sets of dots |
| `\fillBlank{width}` | Dotted underline of specified width |
| `\blankLine{width}` | Simple underline of specified width |
| `\solutionBlank{width}{answer}` | Show answer or blank depending on `solutions` mode |
| `\solutionDotsBlank{n}{answer}` | Show answer or dots depending on `solutions` mode |
| `\highlight{text}` | Subtle light-gray background highlighting |

```latex
Name: \fillBlank{5cm}

The derivative of $\sin(x)$ is \solutionBlank{3cm}{$\cos(x)$}.

Complete: $2 + 3 = $ \solutionDotsBlank{3}{$5$}.
```

The `solutions` package option controls conditional blanks:

```latex
\usepackage[solutions]{scholia}  % reveals answers
```

## Grading Tools

### Grade Box

`gradebox` displays a rubric alongside exercises:

```latex
\begin{gradebox}[Grading Scale]
\gradeitem{Correct method}{2 pts}
\gradeitem{Correct answer}{1 pt}
\gradetotal{3 pts}
\end{gradebox}
```

### Grade Table

`gradetable` provides a structured three-column layout for point allocation:

```latex
\begin{gradetable}{Quadratic Equations}
\graderow{Factoring}{Correct factorization}{2 pts}
\graderow{Solving}{Both roots found}{2 pts}
\graderowtotal{4 pts}
\end{gradetable}
```

### Detailed Rubric

`graderubric` creates a multi-page rubric table with optional column widths:

```latex
\begin{graderubric}
\gradedetailedrow{Q1.a}{Correct setup of equation}{2}
\gradedetailedrow{Q1.b}{Verification step}{1}
\end{graderubric}

\begin{graderubric}[0.25][0.60]  % custom column widths
\gradedetailedrowlist{Q2}{%
  \begin{itemize}
    \item Correct diagram
    \item Labeled axes
  \end{itemize}
}{3}
\gradecompetency{Analysis}{Clear reasoning}{2}
\end{graderubric}
```

### Inline and Integrated Grading

| Command | Description |
|---|---|
| `\gradeinline{2 pts}` | Right-aligned point indicator in text |
| `\gradeq{2 pts}` | Point indicator for question environments |
| `\gradesubq{1 pt}` | Point indicator for subquestion environments |

### Grade Summary and Tracking

`gradesummary` renders a dotted-border box for end-of-exercise summaries:

```latex
\begin{gradesummary}[Final Score]
Total: 20 points
\end{gradesummary}
```

Automatic point tracking accumulates points across tracked items:

```latex
\resetgradepoints
\gradeitemtracked{Q1}{Description}{3}
\gradeitemtracked{Q2}{Description}{5}
\showgradetotal  % outputs "Total: 8 pts"
```

## Numbering Systems

Two visual styles serve different structural roles:

### Squared Items (Procedural Steps)

Squared items display `[1]`, `[2]`, `[3]` with lettered sub-items
`(a)`, `(b)`, `(c)`:

```latex
\begin{squareditem}[Title]
First step content...
\begin{squaredsubitem}
Sub-step detail...
\end{squaredsubitem}
\end{squareditem}
```

Lightweight command variants skip the environment overhead:

```latex
\squaremark First step...
\squaresubmark Sub-step...
```

Semantic aliases map squared items to procedural steps:

| Alias | Equivalent |
|---|---|
| `step` / `endstep` | `squareditem` / `endsquareditem` |
| `substep` / `endsubstep` | `squaredsubitem` / `endsquaredsubitem` |
| `\s` | `\squaremark` |
| `\subs` | `\squaresubmark` |

### Circled Items (Exercise Questions)

Circled items display encircled numbers with circled-letter sub-items:

```latex
\begin{circleditem}
What is $2 + 2$?
\end{circleditem}

\begin{circleditem}
Simplify the following:
\begin{circledsubitem}
$\frac{4}{8}$
\end{circledsubitem}
\begin{circledsubitem}
$\frac{6}{9}$
\end{circledsubitem}
\end{circleditem}
```

Lightweight command variants:

```latex
\circmark What is $2 + 2$?
\circsubmark Part (a)...
```

Semantic aliases map circled items to exercise questions:

| Alias | Equivalent |
|---|---|
| `question` / `endquestion` | `circleditem` / `endcircleditem` |
| `subquestion` / `endsubquestion` | `circledsubitem` / `endcircledsubitem` |
| `\q` | `\circmark` |
| `\subq` | `\circsubmark` |

The `stepnum` counter alias allows resetting step numbering via
`\setcounter{stepnum}{0}`.

## Semantic Inline Labels

Ten label commands create colored inline boxes for categorizing content.
Each label supports a starred form that adds a navigation arrow:

```latex
\notionlabel{Definition 2.1}
\methodlabel*{See Method M3}
```

| Command | Color | Purpose |
|---|---|---|
| `\notionlabel` | Cyan | Theoretical content |
| `\exerciselabel` | Orange | Practice activities |
| `\solutionlabel` | Green | Answers and corrections |
| `\methodlabel` | Blue | Methods and procedures |
| `\assessmentlabel` | Red | Formal evaluations |
| `\autochecklabel` | Purple | Self-evaluation |
| `\keypointlabel` | Gold | Key highlights |
| `\researchlabel` | Reddish-orange | Exploration |
| `\summarylabel` | Gray-brown | Overviews |
| `\diagnosticlabel` | Steel blue | Student records |

## Typed Pages

Typed pages create visually distinct document sections with type-based
styling, banners, relative pagination, and cross-referencing. Typed pages
load only in article mode (not beamer).

### Creating a Typed Page

`\newTypedPage` initializes a new section with all metadata:

```latex
\newTypedPage{3e-functions-N1}{notion}{Functions}{Images and antecedents}
```

Arguments: `{reference}{type key}{chapter title}{topic title}`.

### Registered Page Types

| Type key | Purpose |
|---|---|
| `notion` | Theoretical content |
| `exercise` | Practice activities |
| `solution` | Answers and corrections |
| `autocheck` | Self-evaluation |
| `method` | Methods and procedures |
| `assessment` | Formal evaluations |
| `summary` | Overviews |
| `keypoint` | Key highlights |
| `research` | Cultural exploration |
| `presentation` | Oral presentations |
| `diagnostic` | Student records |

### Full-Page Typed Page Environment

`typedpagefull` wraps content in a full-page colored frame that breaks
across pages:

```latex
\begin{typedpagefull}{ref-N1}{notion}{Chapter Title}{Topic Title}
Content here...
\end{typedpagefull}

\begin{typedpagefull}[norules]{ref-N1}{notion}{Chapter Title}{Topic Title}
Content with suppressed header/footer rules...
\end{typedpagefull}
```

### Specialized Page Environments

| Environment | Type | Options |
|---|---|---|
| `summarypage` | `summary` | Standard header/footer |
| `keypointpage` | `keypoint` | Suppressed header/footer rules |

```latex
\begin{summarypage}{ref-S1}{Functions}{Chapter Summary}
Summary content...
\end{summarypage}
```

### Cross-Referencing

```latex
\typedPageLabel{ref-N1}   % create label (called automatically by \newTypedPage)
\typedPageRef{ref-N1}     % reference a typed page
```

### Document Metadata

Typed pages read `\Author` and `\Year` for header/footer display:

```latex
\renewcommand{\Author}{J. Doe}
\renewcommand{\Year}{2025--2026}
```

## Summary Grids

The summary module builds competency grids and resource indexes for
chapter overviews. Summary grids load only in article mode (not beamer).

### Competency Table

`summaryTable` renders a three-column grid (checkbox, competency, resources):

```latex
\begin{summaryTable}
\summarySection{Algebra}
\summaryCompetenceStar*{Solve linear equations}{\summaryRef{method}{M1}}
\summaryCompetenceStar*{Factor polynomials}{\summaryRef{notion}{N2}[Factoring]}
\end{summaryTable}
```

`\summaryRef{type}{reference}[optional title]` creates a colored inline
reference to a typed page.

Row coloring can be controlled per-section:

```latex
\summarySetRowColor{blue!5}
...rows...
\summaryResetRowColor
```

### Resource Index

`indexTypeTable` lists resources by category with icon banners:

```latex
\begin{indexTypeTable}{notion}
\indexEntry{N1}{Definition of a fraction}
\indexEntry{N2}{Equal fractions}
\end{indexTypeTable}

\begin{indexTypeTable}*{method}   % starred: with header row
\indexEntry{M1}{Cross multiplication}
\end{indexTypeTable}
```

## Progression (Beamer)

The progression module provides session tracking and progressive outlines
for beamer presentations.

### Session List

`sessionList` highlights the current session in a numbered list:

```latex
\begin{sessionList}{2}  % current session = 2
\sessionItem{1}{Introduction to derivatives}
\sessionItem{2}{Chain rule and applications}
\sessionItem{3}{Integration techniques}
\end{sessionList}
```

### Progressive Outline

The outline system renders a TikZ diagram with steps, arrows, and
highlighting:

```latex
% 1. Configure (optional)
\outlineSet{box width=3.2cm, box height=1.6cm, scale=0.82}

% 2. Declare steps
\outlineStep{1}{0}{0}{blue}{Rate model}{Microscopic dynamics}
\outlineStep{2}{4.2}{0}{green}{Low-rank}{Pattern decomposition}

% 3. Declare arrows
\outlineArrow{s1}{s2}{}                 % straight arrow
\outlineArrow{s2}{s3}{|- (s3.north) --} % custom path

% 4. Render
\outlineFrame{1}    % beamer frame highlighting step 1
\outlineRender{0}   % TikZ picture only, no highlight
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
| `\hide{content}` | Hidden content with dotted underline |
| `\hide[color]{content}` | Hidden content with custom reveal color |
| `\hideNoUnderline{content}` | Hidden content without underline |
| `\Hide{hide}{show}{content}` | Beamer: hide on specified slides, show on others |
| `\Hide[color]{hide}{show}{content}` | Beamer variant with custom color |

### Beamer Integration

In Beamer presentations, `\Hide` combines OCG toggling with slide overlays:

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

- `objective` -- persistent objective banner in the headline.
- `frametitle` -- frametitle banner, empty headline.
- `progressbar` -- thin progress bar in the headline and underlined frametitle.

Beamer utility helpers:

```latex
\titlebackground{images/title-background.jpg}
\bottomtext{Source: Author, Year}
\fadedoval[color=blue!50, horizontal radius=3cm]{Key idea}
```

## Layout and Structure Commands

### Block Headers

```latex
\chapterBlock{Chapter Title}        % underlined chapter header
\sectionBlock[gray!15]{Section}     % colored-background section header
```

### Notation Helpers

```latex
\notionLine{\texttt{f(x)}}{Image of $x$ under $f$}
```

### Inline Boxes

```latex
\inlineframebox[blue]{text}     % colored inline frame
\inlineframebox[blue]*{text}    % with arrow prefix
\annotationBox{red}{Tag}        % small rounded annotation tag
```

## Code Listing Environments

```latex
\begin{scholialisting}[language=bash]
echo "Hello"
\end{scholialisting}

\begin{pythonlisting}
def f(x):
    return x ** 2
\end{pythonlisting}

Inline: \code{print("hello")}
```

## Icons

The public icon command:

```latex
\scholiaicon[height=1.2em, fallback={[idea]}]{lightbulb.pdf}
```

A TikZ style embeds icons inside nodes:

```latex
\node[icon={1cm}{lightbulb.pdf}] {};
```

Runtime icon loading is PDF-only. The `noicons` option suppresses icon loads
across callouts, cards, exercises, typed pages, summaries, and beamer banners.

## Math Helpers

`\StackRel` stacks three expressions vertically as a math relation:

```latex
$A \StackRel{=}{\neq}{\text{def}} B$
```

## Next Steps

- [Configuration](configuration.md) -- Package options and compatibility.
- [Installation](installation.md) -- Local texmf, submodule, CTAN setup.
