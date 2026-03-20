-- build.lua for scholia package
-- l3build configuration for CTAN distribution
--
-- Usage:
--   l3build ctan    - Create CTAN distribution archive
--   l3build install - Install to local texmf tree
--
-- Note: Regression fixtures live in tests/ as standalone .tex documents rather
-- than .lvt/.tlg pairs, so `l3build check` uses the check phase as a hook host
-- for the standalone suite instead of the stock log-comparison harness.

module = "scholia"

local regression_test_files = {
  "test-beamer-headline.tex",
  "test-cards.tex",
  "test-interactive.tex",
  "test-interactive-beamer.tex",
  "test-minimalist-compat.tex",
  "test-noicons.tex",
  "test-noicons-beamer.tex",
  "test-typedpages.tex",
}

-- Package metadata
packageversion = "0.2.0"
packagedate    = "2026-03-20"

-- Source files - include all subdirectories
sourcefiles    = {
  "scholia.sty",
  "base/*.sty",
  "beamer/*.sty",
  "callouts/*.sty",
  "cards/*.sty",
  "typedpages/*.sty",
  "labels/*.sty",
  "exercises/*.sty",
  "grading/*.sty",
  "numbering/*.sty",
  "math/*.sty",
  "summary/*.sty",
  "progression/*.sty",
  "interactive/*.sty",
  "i18n/*.tex",
  "icons/pdf/*.pdf",
}

checkfiles     = {}
testfiledir    = "tests"

-- Installation files
-- l3build unpacks installfiles into a flat temporary directory. Keep only the
-- root entry point there, then install the nested module tree with tdsdirs.
installfiles   = {"scholia.sty"}

-- Documentation
-- l3build stages documentation in a flat temporary directory, which collides
-- with Scholia's nested module tree and bypasses the package's repository
-- layout. Ship the manual source and prebuilt PDFs as docfiles, then build
-- them from the repository tree before packaging.
typesetfiles   = {}
docfiles       = {
  "README.md",
  "CHANGES.md",
  "CREDITS.md",
  "MANIFEST.md",
  "doc/scholia-manual.tex",
  "doc/scholia-manual.pdf",
  "tests/*.tex",
  "tests/*.pdf",
}
textfiles      = {"LICENSE"}

-- Exclude from distribution
excludefiles   = {
  "icons/svg/*",    -- SVG sources not distributed
  "build.lua",      -- Build script not distributed
}

-- Keep directory structure in TDS
flatten        = false
flattentds     = false

tdsdirs = {
  ["base"] = "tex/latex/scholia/base",
  ["beamer"] = "tex/latex/scholia/beamer",
  ["callouts"] = "tex/latex/scholia/callouts",
  ["cards"] = "tex/latex/scholia/cards",
  ["typedpages"] = "tex/latex/scholia/typedpages",
  ["labels"] = "tex/latex/scholia/labels",
  ["exercises"] = "tex/latex/scholia/exercises",
  ["grading"] = "tex/latex/scholia/grading",
  ["numbering"] = "tex/latex/scholia/numbering",
  ["math"] = "tex/latex/scholia/math",
  ["summary"] = "tex/latex/scholia/summary",
  ["progression"] = "tex/latex/scholia/progression",
  ["interactive"] = "tex/latex/scholia/interactive",
  ["i18n"] = "tex/latex/scholia/i18n",
  ["icons/pdf"] = "tex/latex/scholia/icons/pdf",
}

-- checkinit_hook below runs the standalone regression documents, recorder
-- audits, and installed-use smoke test directly. A real engine is still needed
-- so that l3build enters the check phase and executes the hook.
checkengines   = {"pdftex"}
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

-- Manifest generation for the nested source tree. The stock l3build manifest
-- walker only lists files in a single directory, so subdirectories such as
-- base/, beamer/, cards/, and icons/ must be grouped explicitly.
local manifest_code_layout = {
  {
    name = "Package entry point",
    dir = ".",
    files = {"scholia.sty"},
  },
  {
    name = "Base modules (`base/`)",
    dir = "base",
    files = {"*.sty"},
  },
  {
    name = "Beamer modules (`beamer/`)",
    dir = "beamer",
    files = {"*.sty"},
  },
  {
    name = "Callout modules (`callouts/`)",
    dir = "callouts",
    files = {"*.sty"},
  },
  {
    name = "Card modules (`cards/`)",
    dir = "cards",
    files = {"*.sty"},
  },
  {
    name = "Typed-page modules (`typedpages/`)",
    dir = "typedpages",
    files = {"*.sty"},
  },
  {
    name = "Label modules (`labels/`)",
    dir = "labels",
    files = {"*.sty"},
  },
  {
    name = "Exercise modules (`exercises/`)",
    dir = "exercises",
    files = {"*.sty"},
  },
  {
    name = "Grading modules (`grading/`)",
    dir = "grading",
    files = {"*.sty"},
  },
  {
    name = "Numbering modules (`numbering/`)",
    dir = "numbering",
    files = {"*.sty"},
  },
  {
    name = "Math modules (`math/`)",
    dir = "math",
    files = {"*.sty"},
  },
  {
    name = "Summary modules (`summary/`)",
    dir = "summary",
    files = {"*.sty"},
  },
  {
    name = "Progression modules (`progression/`)",
    dir = "progression",
    files = {"*.sty"},
  },
  {
    name = "Interactive modules (`interactive/`)",
    dir = "interactive",
    files = {"*.sty"},
  },
  {
    name = "Localization files (`i18n/`)",
    dir = "i18n",
    files = {"*.tex"},
  },
  {
    name = "PDF icon assets (`icons/pdf/`)",
    dir = "icons/pdf",
    files = {"*.pdf"},
  },
}

local manifest_doc_layout = {
  {
    name = "Manual sources (`doc/`)",
    dir = "doc",
    files = {"*.tex"},
  },
  {
    name = "Documentation PDFs (`doc/`)",
    dir = "doc",
    files = {"*.pdf"},
  },
  {
    name = "Regression tests (`tests/`)",
    dir = "tests",
    files = {"*.tex", "*.pdf"},
  },
  {
    name = "Package metadata",
    dir = ".",
    files = {"README.md", "CHANGES.md", "CREDITS.md", "MANIFEST.md"},
  },
  {
    name = "License",
    dir = ".",
    files = {"LICENSE"},
  },
}

local manifest_repo_only_layout = {
  {
    name = "Build support",
    dir = ".",
    files = {"build.lua"},
    exclude = {},
  },
  {
    name = "SVG icon sources (`icons/svg/`)",
    dir = "icons/svg",
    files = {"*.svg"},
    exclude = {},
  },
}

local function manifest_dir(root, dir)
  if root == "." or root == "" then
    return dir
  end
  if dir == "." or dir == "" then
    return root
  end
  return root .. "/" .. dir
end

local function manifest_add_layout(groups, root, layout)
  for _, entry in ipairs(layout) do
    groups[#groups + 1] = {
      name = entry.name,
      description = entry.description or "",
      dir = manifest_dir(root, entry.dir),
      files = entry.files,
      exclude = entry.exclude,
      skipfiledescription = true,
    }
  end
end

function manifest_setup()
  local groups = {
    {
      subheading = "Repository manifest",
      description = [[
The following groups list the files included in the development repository of the package.
Files listed with a ‘†’ marker are included in the TDS but not CTAN files, and files listed
with ‘‡’ are included in both.
]],
    },
  }

  manifest_add_layout(groups, ".", manifest_code_layout)
  manifest_add_layout(groups, ".", manifest_doc_layout)
  manifest_add_layout(groups, ".", manifest_repo_only_layout)

  groups[#groups + 1] = {
    subheading = "TDS manifest",
    description = [[
The following groups list the files included in the TeX Directory Structure used to install
the package into a TeX distribution.
]],
  }

  -- Derive the shipped TDS layout from the repository tree rather than the
  -- generated build/distrib tree. This keeps `l3build manifest` accurate even
  -- from a clean checkout before `l3build ctan` has populated build outputs.
  manifest_add_layout(groups, ".", manifest_code_layout)
  manifest_add_layout(groups, ".", manifest_doc_layout)

  groups[#groups + 1] = {
    subheading = "CTAN manifest",
    description = [[
The following groups list the files included in the CTAN package.
]],
  }

  -- The CTAN archive preserves the same repository subtrees as the packaged
  -- source/doc payload, so the manifest can reuse the declared layout directly.
  manifest_add_layout(groups, ".", manifest_code_layout)
  manifest_add_layout(groups, ".", manifest_doc_layout)

  return groups
end

local stock_install_files = install_files

local function copyfiles_preserving_tree(file_globs, source, target_root)
  for _, file_glob in pairs(file_globs) do
    for _, p in ipairs(tree(source, file_glob)) do
      local relpath = string.gsub(p.src, "^%./", "")
      local relroot = dirname(relpath)
      local target = target_root
      if relroot ~= "." and relroot ~= "" then
        target = target .. "/" .. relroot
      end
      mkdir(target)
      cp(relpath, source, target)
    end
  end
end

local function run_release_latexmk(source, filename)
  local command = string.format(
    'latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error -recorder "%s"',
    filename
  )
  return run(source, command)
end

local function typeset_release_tree(source, file_glob)
  for _, p in ipairs(tree(source, file_glob)) do
    local _, filename = splitpath(p.src)
    local errorlevel = run_release_latexmk(source, filename)
    if errorlevel ~= 0 then
      return errorlevel
    end
  end
  return 0
end

local function typeset_regression_documents()
  for _, filename in ipairs(regression_test_files) do
    local errorlevel = run_release_latexmk("tests", filename)
    if errorlevel ~= 0 then
      return errorlevel
    end
  end
  return 0
end

local function build_release_documents()
  local errorlevel = typeset_release_tree(docfiledir, "scholia-manual.tex")
  if errorlevel ~= 0 then
    return errorlevel
  end
  return typeset_regression_documents()
end

local function install_full_package_tds(target, skip_build)
  local errorlevel = stock_install_files(target, false, false)
  if errorlevel ~= 0 then
    return errorlevel
  end

  if not skip_build then
    errorlevel = build_release_documents()
    if errorlevel ~= 0 then
      return errorlevel
    end
  end

  local source_root = target .. "/source/" .. moduledir
  local doc_root = target .. "/doc/" .. moduledir

  errorlevel = cleandir(source_root) + cleandir(doc_root)
  if errorlevel ~= 0 then
    return errorlevel
  end

  copyfiles_preserving_tree(sourcefiles, sourcefiledir, source_root)
  copyfiles_preserving_tree(docfiles, docfiledir, doc_root)
  for _, file in pairs(textfiles) do
    cp(file, textfiledir, doc_root)
  end

  return 0
end

local function read_file(path)
  local file = assert(io.open(path, "rb"))
  local content = file:read("*all")
  file:close()
  return content
end

local function file_contains(path, fragment)
  local file = io.open(path, "r")
  if not file then
    return false
  end
  for line in file:lines() do
    if string.find(line, fragment, 1, true) then
      file:close()
      return true
    end
  end
  file:close()
  return false
end

local function audit_runtime_icons()
  local pdf_icons = {}
  for _, p in ipairs(tree(sourcefiledir, "icons/pdf/*.pdf")) do
    local _, filename = splitpath(p.src)
    pdf_icons[filename] = true
  end

  local missing_pdf = {}
  local png_refs = {}
  for _, file_glob in ipairs(sourcefiles) do
    if file_glob:match("%.sty$") then
      for _, p in ipairs(tree(sourcefiledir, file_glob)) do
        local content = read_file(p.src)
        for stem in string.gmatch(content, "([%w%-]+)%.png") do
          png_refs[stem .. ".png"] = true
        end
        for stem in string.gmatch(content, "([%w%-]+)%.pdf") do
          local filename = stem .. ".pdf"
          if not pdf_icons[filename] then
            missing_pdf[filename] = true
          end
        end
      end
    end
  end

  local bad = false
  for filename in pairs(png_refs) do
    if not bad then
      print("Unexpected runtime PNG icon reference(s):")
      bad = true
    end
    print("  " .. filename)
  end
  for filename in pairs(missing_pdf) do
    if not bad then
      print("Missing PDF icon asset(s):")
      bad = true
    end
    print("  " .. filename)
  end
  if bad then
    return 1
  end
  return 0
end

local function audit_noicons_recorders()
  for _, path in ipairs({
    "tests/test-noicons.fls",
    "tests/test-noicons-beamer.fls",
  }) do
    local file = io.open(path, "r")
    if not file then
      print("Missing recorder file: " .. path)
      return 1
    end
    for line in file:lines() do
      if string.find(line, "icons/pdf/", 1, true) or string.find(line, "icons/png/", 1, true) then
        file:close()
        print("Icon asset load leaked into noicons recorder: " .. path)
        print("  " .. line)
        return 1
      end
    end
    file:close()
  end
  return 0
end

local function write_installed_smoke_doc(dir, filename)
  local file = assert(io.open(dir .. "/" .. filename, "w"))
  file:write([[\documentclass[11pt,a4paper]{article}
\usepackage[english]{scholia}

\renewcommand{\Author}{Installed Smoke Test}
\renewcommand{\Year}{2025--2026}

\begin{document}

\begin{definitionbox}{Installed callout}
  The generated TDS tree should load icons and submodules without \texttt{\string\CommonPath}.
\end{definitionbox}

\newTypedPage{installed-diagnostic-1}{diagnostic}{Functions}{Installed-path diagnostic}
This page confirms that installed-use loading resolves package modules and icons from the generated TDS tree.

\end{document}
]])
  file:close()
end

local function run_installed_smoke_check()
  local smoke_root = testdir .. "/installed-use"
  local smoke_tds = smoke_root .. "/tds"
  local smoke_file = "scholia-installed-smoke.tex"
  local smoke_fls = smoke_root .. "/scholia-installed-smoke.fls"
  local errorlevel = cleandir(smoke_root)
  if errorlevel ~= 0 then
    return errorlevel
  end
  mkdir(smoke_root)

  errorlevel = install_full_package_tds(smoke_tds, true)
  if errorlevel ~= 0 then
    return errorlevel
  end

  write_installed_smoke_doc(smoke_root, smoke_file)
  errorlevel = run(
    smoke_root,
    'TEXINPUTS="tds/tex/latex//:" pdflatex -interaction=nonstopmode -halt-on-error -file-line-error -recorder "' .. smoke_file .. '"'
  )
  if errorlevel ~= 0 then
    return errorlevel
  end

  if not file_contains(smoke_fls, "tds/tex/latex/scholia/scholia.sty") then
    print("Installed smoke did not load scholia.sty from the generated TDS tree.")
    return 1
  end
  if not file_contains(smoke_fls, "tds/tex/latex/scholia/icons/pdf/book-marked.pdf") then
    print("Installed smoke did not load packaged icon assets from the generated TDS tree.")
    return 1
  end
  return 0
end

function checkinit_hook()
  local errorlevel = build_release_documents()
  if errorlevel ~= 0 then
    return errorlevel
  end

  errorlevel = audit_runtime_icons()
  if errorlevel ~= 0 then
    return errorlevel
  end

  errorlevel = audit_noicons_recorders()
  if errorlevel ~= 0 then
    return errorlevel
  end

  return run_installed_smoke_check()
end

function install_files(target, full, dry_run)
  if not full or dry_run then
    return stock_install_files(target, full, dry_run)
  end
  return install_full_package_tds(target)
end

-- Preserve the repository tree in the CTAN archive. The stock copyctan()
-- flattens files when sourcefiledir/docfiledir are the package root.
function copyctan()
  local pkgdir = ctandir .. "/" .. ctanpkg
  mkdir(pkgdir)

  for _, file_group in pairs({bibfiles, demofiles, docfiles, pdffiles, scriptmanfiles, typesetlist}) do
    local ctantarget = pkgdir
    if docfiledir ~= currentdir then
      ctantarget = ctantarget .. "/" .. docfiledir
    end
    copyfiles_preserving_tree(file_group, docfiledir, ctantarget)
  end
  local sourcetarget = pkgdir
  if sourcefiledir ~= currentdir then
    sourcetarget = sourcetarget .. "/" .. sourcefiledir
  end
  copyfiles_preserving_tree(sourcefiles, sourcefiledir, sourcetarget)
  for _, file in pairs(textfiles) do
    cp(file, textfiledir, pkgdir)
  end
end
