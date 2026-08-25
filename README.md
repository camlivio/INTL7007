# R Basics & The Weighted Dice

An interactive first-hour R tutorial that runs **entirely in the student's
browser** — no R, no RStudio, no installs, no accounts. Built with
[Quarto Live](https://r-wasm.github.io/quarto-live/) (webR / WebAssembly).

Adapted from Garrett Grolemund, *Hands-On Programming with R*, Ch. 1–3.

## Contents

| Path | What it is |
|---|---|
| `index.qmd` | Source of the interactive tutorial |
| `docs/` | Rendered site — **this is what GitHub Pages serves** |
| `dice-fallback.R` | Plain R script, same content, for use in real RStudio |
| `files/dice-tutorial.Rmd` | Original `learnr` version (needs RStudio + `learnr`) |
| `styles.css` | Tutorial styling |
| `_extensions/` | Quarto Live extension — **must be committed** |

## Publishing to GitHub Pages

1. Push this folder to a **public** repo.
2. Repo → **Settings → Pages** → Source: *Deploy from a branch* →
   branch `main`, folder **`/docs`** → Save.
3. Wait ~1 minute. The tutorial is live at
   `https://<user>.github.io/<repo>/`

`docs/.nojekyll` is already present — it stops GitHub trying to run Jekyll over
the Quarto output.

## Re-rendering after edits

Edit `index.qmd`, then from this folder:

```bash
quarto render
```

Commit the changed `docs/` along with your source edit. If `quarto` isn't on your
PATH, RStudio ships its own copy:

```bash
/Applications/RStudio.app/Contents/Resources/app/quarto/bin/quarto render
```

## Notes for teaching

- **First load takes a few seconds** while webR downloads (~30 MB, then cached).
  Have students open the link at the very start of class, before you talk.
- Needs internet, and a reasonably current browser. Works on Chromebooks.
- Every student gets their own private R session; there is no server to
  overload, so class size doesn't matter.
- webR is a sandbox — students can't read their own files or install arbitrary
  packages. That's the tradeoff for zero setup. Section "Next step" points them
  to `dice-fallback.R` for doing it in real R.
- The two moments worth pausing on: Section 5, when they notice
  `sample(die, 2)` never gives a double; and Section 8, comparing the two
  histograms.
- Challenge 3 has no clean answer — the maximum possible mean is 12 (all
  probability on the 6). Good closing discussion.
