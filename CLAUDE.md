# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal CV/resume and cover letter built on the [Awesome-CV](https://github.com/posquit0/Awesome-CV) LaTeX template. It uses the `awesome-cv.cls` class file compiled with **XeLaTeX**.

## Build Commands

The Makefile only builds the example documents. For personal documents, compile directly:

```bash
# Build personal resume
xelatex my-resume.tex

# Build personal cover letter
xelatex my-coverletter.tex

# Build example documents (resume, cv, coverletter)
make examples

# Clean example PDFs
make clean
```

XeLaTeX is required (not pdflatex) because the template uses `fontspec`, `unicode-math`, Roboto, Source Sans Pro, and FontAwesome6.

## Architecture

- **awesome-cv.cls** — The document class defining all styling, commands, and environments. This is the core of the template (~820 lines).
- **my-resume.tex** — Main resume document. Sets page geometry, color theme (`awesome-skyblue`), personal info, and imports section files.
- **my-coverletter.tex** — Main cover letter document. Same header config as resume, plus recipient/letter metadata.
- **my_resume/** — Modular section files (`summary.tex`, `experience.tex`, `certificates.tex`, `education.tex`, `courses.tex`, `languages.tex`, etc.) imported by `my-resume.tex`.
- **examples/** — Upstream example documents and their section files in `examples/resume/` and `examples/cv/`.

## Key Conventions

**Document structure pattern:** Each main `.tex` file configures the preamble (geometry, colors, personal info), then uses `\input{my_resume/section.tex}` to pull in content sections. Sections are commented out in the main file when not needed.

**Entry commands in section files:**
- `\cventry{position}{company}{location}{dates}{description}` — work experience
- `\cvhonor{award}{title}{location}{date}` — honors, certificates
- `\cvskill{category}{skills}` — skills listing
- `\lettersection{Title}` — cover letter sections inside `\begin{cvletter}...\end{cvletter}`

**Color theme:** Set via `\colorlet{awesome}{awesome-skyblue}` in the main tex files. Available: `awesome-emerald`, `awesome-skyblue`, `awesome-red`, `awesome-pink`, `awesome-orange`, `awesome-nephritis`, `awesome-concrete`, `awesome-darknight`.

**Photo:** Configured with `\photo[circle,noedge,left]{./my_resume/linkedin}` — supports `circle|rectangle`, `edge|noedge`, `left|right`.
