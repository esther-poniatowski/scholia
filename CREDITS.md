# Credits and Attributions

This document acknowledges third-party resources used in the Scholia LaTeX package.

## Icons

The icons included in this package are from **Lucide Icons**.

- **Source:** https://lucide.dev/
- **License:** ISC License
- **Copyright:** Copyright (c) for portions of Lucide are held by Cole Bemis 2013-2022 as part of Feather (MIT). All other copyright (c) for Lucide are held by Lucide Contributors 2022.

### ISC License Text

```
Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

### Icons Used

The following Lucide icons are included in this package:

| Icon Name | Usage |
|-----------|-------|
| `triangle-alert` | Attention callouts |
| `lightbulb` | Hint callouts |
| `book-marked` | Definition callouts, Notions fiches |
| `crosshair` | Objective callouts |
| `cog` | Method callouts |
| `pencil-line` | Exercise fiches |
| `check` | Correction fiches |
| `clipboard-check` | Auto-evaluation fiches |
| `goal` | Evaluation fiches |
| `library-big` | Summary fiches |
| `star` | Key points fiches |
| `search` | Research fiches |
| `megaphone` | Presentation fiches |
| `ban` | Fail callouts |
| `compass` | Notation callouts |
| `component` | Proposition callouts |
| `flag` | Remark callouts |

Icons have been modified (recolored) for integration with the package color schemes.

### Distribution Format

Icons are organized by format:
- **`icons/pdf/`**: PDF files (vector) - used by default for high-quality output
- **`icons/png/`**: PNG files (raster) - fallback for compatibility
- **`icons/svg/`**: SVG source files - for regenerating icons in different formats or colors

The package uses PDF icons by default for crisp vector rendering at any size.

## Beamer Theme

The `minimalist` Beamer theme included in this package is an original work.

## Contributors

The following individuals have contributed code or ideas to this package:

| Contributor        | Contribution                                                                                                                        |
|--------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **Réginald Bayle** | Interactive hide/reveal feature (`interactive` module) - OCG-based toggle functionality for progressive content disclosure in PDFs |

## Fonts

This package does not bundle any fonts. It uses system fonts via `fontspec` when compiled with XeLaTeX or LuaLaTeX.
