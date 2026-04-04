# Configuration

## Package Options

Options are passed at load time:

```latex
\usepackage[english]{scholia}
\usepackage[beamer]{scholia}
\usepackage[interactive]{scholia}
\usepackage[minimal]{scholia}
```

| Option | Description | Default |
| ------ | ----------- | ------- |
| `english` | English strings. | Yes |
| `french` | French strings. | No |
| `beamer` | Enable Beamer presentation mode. | No |
| `solutions` | Show solutions in exercises (via `\solutionBlank`). | No |
| `interactive` | Enable hide/reveal features based on OCG (requires capable viewer). | No |
| `noicons` | Disable icon loading (text-only callouts). | No |
| `minimal` | Minimal dependencies (skips table packages, implies `noicons`). | No |
| `draft` | Draft mode (reserved for future use). | No |

## Compatibility

### TeX Engines

| Engine | Status |
|---|---|
| pdfLaTeX | Covered by the regression suite. |
| XeLaTeX | Not yet covered by the regression suite. |
| LuaLaTeX | Not yet covered by the regression suite. |

### Document Classes

| Class | Status |
|---|---|
| `article` | Covered by the regression suite. |
| `beamer` | Covered by the regression suite. |
| `book`, `report`, `memoir`, `scrartcl` | Not yet in the regression suite. |

### TeX Distributions

| Distribution | Status |
|---|---|
| TeX Live 2024 | Tested. |
| MiKTeX | Untested (expected to work). |

## Requirements

- LaTeX2e (2020/10/01 or later)
- `tcolorbox` with `skins`, `breakable`, `xparse` libraries
- `tikz`, `xparse`, `etoolbox`, `enumitem`, `xcolor`

## Internal Structure

These internal files under `base/`, `beamer/`, `callouts/`, `cards/`,
`typedpages/`, `grading/`, `exercises/`, and related directories form the
implementation layout. The source code documents the modules for maintainers,
but the internal API is not stable for external documents.
