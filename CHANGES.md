# Scholia Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [0.1.1] - 2026-02-02

### Added

- **Interactive hide/reveal module** (`interactive/main.sty`):
  - `\hide{content}` — Clickable hidden content with dotted underline placeholder
  - `\hide[color]{content}` — Custom reveal color support
  - `\hideNoUnderline{content}` — Hidden content without underline indicator
  - `\Hide{hide-slides}{show-slides}{content}` — Beamer integration with slide overlays
  - Uses PDF Optional Content Groups (OCG) via `ocgx2` package
  - Works with both text and math modes
- **New package option**: `interactive` — Enables OCG-based hide/reveal features
- **New package option**: `solutions` — Shows solutions in exercises

### Technical

- New colors in `base/colors.sty` for hide/reveal functionality
- Test files in `tests/` directory for interactive features

### Credits

- Interactive module based on implementation by Réginald Bayle

---

## [0.1.0] - 2026-01-31

### Added

- **Package structure**: Main entry point `scholia.sty` with modular sub-packages
- **Callout system**: 13 callout types with `*box` and `*title` variants
  - `definitionbox`, `theorembox`, `proofbox`
  - `warningbox`, `errorbox`, `tipbox`
  - `methodbox`, `notationbox`, `objectivebox`
  - `summarybox`, `remarkbox`, `questionbox`, `instructionbox`
- **Exercise environments**:
  - `exguided`, `exsemiguided`, `exauto`
  - `exmodel`, `excorrection`
  - `\exstep` command for numbered steps
- **Grading tools**:
  - `gradebox`, `gradetable`, `gradesummary`, `graderubric`
  - Point tracking with `\gradeitem`, `\gradetotal`
- **Numbering system**:
  - `step`, `substep`, `question`, `subquestion` environments
  - `\q` and `\subq` shorthand commands
- **Fiche system**: Worksheet document layouts with cross-referencing
- **i18n support**: French (default) and English localizations
- **Package options**: `french`, `english`, `beamer`
- **Icons**: Lucide icon set (ISC License)

### Technical

- LPPL 1.3c license
- Proper `\ProvidesPackage` declarations with version metadata
- Modular architecture: 14 sub-packages for individual feature loading
- Class detection for article/beamer conditional features
- Dependency declarations via `\RequirePackage`

---

## [Unreleased]

### Planned

- CTAN submission
- Comprehensive user manual (PDF)
- XeLaTeX and LuaLaTeX testing
- Additional callout types
- Beamer theme integration

---

*Maintained by Esther Poniatowski <esther.poniatowski@ens.psl.eu>*
