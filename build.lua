-- build.lua for scholia package
-- l3build configuration for CTAN distribution
--
-- Usage:
--   l3build ctan    - Create CTAN distribution archive
--   l3build install - Install to local texmf tree
--
-- Note: Regression testing uses ../tests/run-tests.sh instead of l3build check
-- due to the package's nested directory structure.

module = "scholia"

-- Package metadata
packageversion = "0.1.0"
packagedate    = "2026-01-31"

-- Source files - include all subdirectories
sourcefiles    = {
  "scholia.sty",
  "base/*.sty",
  "callouts/*.sty",
  "fiches/*.sty",
  "refframes/*.sty",
  "exercises/*.sty",
  "grading/*.sty",
  "numbering/*.sty",
  "math/*.sty",
  "summary/*.sty",
  "progression/*.sty",
  "transmission/*.sty",
  "i18n/*.tex",
  "icons/pdf/*.pdf",
}

-- Installation files (same as source)
installfiles   = sourcefiles

-- Documentation
typesetfiles   = {"doc/scholia-manual.tex"}
docfiles       = {"README.md", "CHANGES.md", "CREDITS.md", "MANIFEST.md", "doc/scholia-manual.pdf"}
textfiles      = {"LICENSE"}

-- Exclude from distribution
excludefiles   = {
  "icons/svg/*",    -- SVG sources not distributed
  "icons/png/*",    -- PNG fallback not in primary distribution
  "build.lua",      -- Build script not distributed
}

-- Keep directory structure in TDS
flatten        = false
flattentds     = false

-- Disable l3build check (use ../tests/ instead)
-- Setting empty checkengines skips the check phase
checkengines   = {}
checkruns      = 0

-- CTAN configuration
ctanpkg        = "scholia"
ctanreadme     = "README.md"
ctanzip        = "scholia"

uploadconfig = {
  pkg          = "scholia",
  version      = packageversion,
  author       = "Esther Poniatowski",
  uploader     = "Esther Poniatowski",
  email        = "esther.poniatowski@ens.psl.eu",
  license      = "lppl1.3c",
  summary      = "Educational document formatting for mathematics pedagogy",
  description  = [[
    Scholia provides structured environments for creating educational
    mathematics documents: callout boxes (definitions, theorems, warnings),
    exercise environments, grading tools, and worksheet layouts.
    Supports French and English localization.
  ]],
  topic        = {"class", "education"},
  ctanPath     = "/macros/latex/contrib/scholia",
  repository   = "https://github.com/esther-poniatowski/scholia",
  bugtracker   = "https://github.com/esther-poniatowski/scholia/issues",
}
