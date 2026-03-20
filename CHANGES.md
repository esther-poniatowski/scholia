# Scholia Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [0.2.0] - 2026-03-20

### Added

- **Beamer headline modes** (`beamer/scholia-headline.sty`):
  - Three mutually exclusive modes: `objective` (default), `frametitle`, `progressbar`
  - Keyed configuration via `\scholiaBeamerSetup{headline mode=progressbar}`
  - Progress-bar mode: thin colored bar in headline, underline frametitle with
    optional circled frame number
  - Configurable keys: `progress color`, `progress background color`,
    `progress thickness`, `frametitle underline color`, `show frame number`
  - Legacy wrappers: `\headlineshowsframetitle`, `\headlineshowsprogressbar`
- **Beamer utilities** (`beamer/scholia-utilities.sty`):
  - `\titlebackground{image-path}` — full-bleed background image overlay
  - `\bottomtext{text}` — push footnote-size text to slide bottom
  - `\fadedoval[keys]{text}` — faded elliptical region with key-driven interface
- **Card callout family** (`cards/scholia-cards-framework.sty`, `cards/scholia-cards-types.sty`):
  - New visual family: floating label + circular icon badge layout
  - Generic `cardbox` environment with pgfkeys configuration
  - Type registration via `\NewScholiaCardType`
  - Built-in preset: `ideacard` (neutral gray, flat lightbulb icon)
- **Shared icon helper** (`base/scholia-graphics.sty`):
  - `\scholiaicon[height=..., raise=..., fallback={...}]{filename}` — unified icon
    inclusion with `noicons` fallback
  - Internal `\scholia@icon@render` for framework code
  - Icon constants moved from `base/scholia-factories.sty` to `base/scholia-graphics.sty`

- **Installed-package safety**:
  - Renamed generic internal module filenames that shadow standard packages in a TDS install (`graphics.sty`, `layout.sty`, `article.sty`, `outline.sty`)
  - Installed-use loading through `\usepackage{scholia}` now works from the generated TDS tree without `\CommonPath`
- **Minimalist compatibility layer** (`beamer/scholia-minimalist-compat.sty`):
  - Opt-in via `\usepackage[beamer,minimalistcompat]{scholia}`
  - Symbol command aliases: `\downarrowblack`, `\lightbulb`, `\observation`, etc.
  - `ideaboxgray` environment alias
- **New icons**: 10 flat-style icons imported with `minimalist-` prefix
- **New color**: `scholia-idea` (neutral gray for idea cards)
- **New package option**: `minimalistcompat` — enables compatibility aliases

### Changed

- `base/scholia-beamer.sty` is now a thin loader; feature logic lives in
  `beamer/scholia-headline.sty` and `beamer/scholia-utilities.sty`
- Internal Scholia submodules now use unique `scholia-*` basenames and load
  through `\RequirePackage`, so package boundaries are enforced without
  `framework.sty`/`types.sty`/`main.sty` collisions

### Fixed

- Headline mode switching now restores the default frametitle template when
  documents return to `objective` mode
- `cardbox`, `\scholiaicon`, and `\fadedoval` now reset keyed state for each
  invocation instead of leaking values across calls
- Summary tables now resolve legacy fiche names through the typed-page registry,
  so summary banners, references, and typed pages share one type configuration
- `noicons` now suppresses icon asset loading consistently across callouts,
  exercises, grading tools, typed pages, summaries, and beamer banners
- `minimalistcompat` now supports the legacy `\setTitleBackground` workflow and
  the original five-argument `\fadedoval` form used by migrated decks
- `base/scholia-graphics.sty` now advertises only distributed PDF icon paths;
  runtime icon references are PDF-only, so the unshipped PNG fallback is gone
- `build.lua` now typesets the manual and regression fixtures during `l3build ctan`
  and preserves the nested source tree in the generated TDS archive
- `l3build manifest` now derives the TDS and CTAN file listings from the declared
  package layout, so those sections stay populated from a clean checkout
- `l3build check` now executes the standalone regression suite, recorder audits,
  and generated-TDS installed-use smoke compile through `checkinit_hook`
- Release metadata and manual examples now match the shipped module names,
  version/date headers, and semantic color names

---

## [0.1.1] - 2026-02-02

### Added

- **Interactive hide/reveal module** (`interactive/scholia-interactive.sty`):
  - `\hide{content}` — Clickable hidden content with dotted underline placeholder
  - `\hide[color]{content}` — Custom reveal color support
  - `\hideNoUnderline{content}` — Hidden content without underline indicator
  - `\Hide{hide-slides}{show-slides}{content}` — Beamer integration with slide overlays
  - Uses PDF Optional Content Groups (OCG) via `ocgx2` package
  - Works with both text and math modes
- **New package option**: `interactive` — Enables OCG-based hide/reveal features
- **New package option**: `solutions` — Shows solutions in exercises

### Technical

- New colors in `base/scholia-colors.sty` for hide/reveal functionality
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
