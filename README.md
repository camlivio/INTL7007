# INTL7007 — Interactive R Tutorials

One Quarto project producing the whole tutorial site for INTL7007. Everything
runs in the student's browser via [Quarto Live](https://r-wasm.github.io/quarto-live/)
(webR / WebAssembly) — no R, no RStudio, no installs, no accounts.

**Live:** https://camlivio.github.io/INTL7007/

## Layout

| Source | URL | What it is |
|---|---|---|
| `index.qmd` | `/` | Landing page listing the tutorials |
| `dice/index.qmd` | `/dice/` | Week 2 — R Basics & The Weighted Dice |
| `llm/index.qmd` | `/llm/` | Week 3 — Working With an LLM, Part I: Prompt It |

Supporting files: `styles.css` (shared by all pages), `_extensions/` (Quarto
Live — **must be committed**), `llm/voting.csv` (Gerber, Green & Larimer 2008;
229,444 rows), a plain-R fallback script beside each tutorial, and
`dice/dice-tutorial.Rmd` (the original `learnr` version, needs RStudio +
`learnr`).

`docs/` is the rendered site — **this is what GitHub Pages serves.**

## Adding next week's tutorial

1. `mkdir week4 && ` write `week4/index.qmd`.
2. Frontmatter must use a **relative** css path and a **relative** include:

   ```yaml
   format:
     live-html:
       css: ../styles.css
   ```

   ```
   {{< include ../_extensions/r-wasm/live/_knitr.qmd >}}
   ```
3. Add `week4/index.qmd` to `render:` in `_quarto.yml`, and any data files to
   `resources:`.
4. Add a `### [Week 4 — ...](week4/)` entry to `index.qmd`.
5. Re-render.

### Loading a data file into webR

Put the file in the tutorial's own folder, list it under the project's
`resources:` in `_quarto.yml`, **and** declare it in the document frontmatter:

```yaml
webr:
  resources:
    - voting.csv
```

The `webr:` key is what actually uploads it to the browser's virtual
filesystem; the project `resources:` key only copies it into `docs/`. You need
both. Then `read.csv("voting.csv")` works in a `{webr}` cell.

## Re-rendering

```bash
quarto render
```

If `quarto` isn't on your PATH (it isn't — RStudio bundles its own):

```bash
/Applications/RStudio.app/Contents/Resources/app/quarto/bin/quarto render
```

Preview locally before publishing:

```bash
cd docs && python3 -m http.server 8788
```

## Publishing

The repo `camlivio/INTL7007` is populated by **browser drag-and-drop upload**,
not `git push`. Pages serves from `main` + `/docs`. To publish, re-render and
upload the contents of `docs/` — including `docs/.nojekyll`, which stops GitHub
running Jekyll over the Quarto output.

## Never publish from `INTL7007-Labs`

That folder holds the gradebook (`INTL7007_grades_Spring26.xlsx`). Only
`voting.csv` was copied out of it, and that is public textbook data (Llaudet,
*Data Analysis for Social Science*). Nothing else from it belongs in a public
repo.

## Caveat: paths are relative on purpose

GitHub Pages serves this at `/INTL7007/`, not at a domain root, so a
root-absolute path like `/styles.css` resolves to `camlivio.github.io/styles.css`
and 404s. Keep every internal path relative.
