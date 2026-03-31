# Installation

## Requirements

- LaTeX2e (2020/10/01 or later)
- `tcolorbox` with `skins`, `breakable`, `xparse` libraries
- `tikz`, `xparse`, `etoolbox`, `enumitem`, `xcolor`

## Local Installation

Install the `scholia/` tree in a local texmf root:

```text
~/texmf/tex/latex/scholia/
```

Then load the package normally:

```latex
\usepackage{scholia}
```

For local repository builds, a custom `\CommonPath` macro can define the
package path:

```latex
\newcommand{\CommonPath}{path/to}
\usepackage{\CommonPath/scholia/scholia}
```

## As a Git Submodule

```sh
git submodule add https://github.com/esther-poniatowski/scholia.git common/scholia
```

Collaborators obtain the package automatically with
`git submodule update --init`.

## CTAN / TDS Archives

Scholia ships an `l3build` configuration for generating CTAN and TDS archives:

```sh
l3build check
l3build manifest
l3build ctan
```
