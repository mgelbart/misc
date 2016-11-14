## Installations
 - developer tools: `xcode-select --install`
 - [Chrome](https://www.google.ca/chrome/browser/desktop/index.html)
 - [Julia](http://julialang.org/downloads/)
 - [1Password](https://agilebits.com/downloads)
 - [Anaconda](https://www.continuum.io/downloads)
 - [Slack](https://slack.com/downloads/osx)
 - [MacTex](https://www.tug.org/mactex/)
 - [Atom](https://atom.io/)
   - Atom --> Install Shell Commands
   - [LaTeX](https://atom.io/packages/latex): `apm install latex`
   - [Juno](https://github.com/JunoLab/uber-juno/blob/master/setup.md) for Julia: `apm install uber-juno`
   - [Markdown](https://atom.io/packages/markdown-preview-plus): `apm install markdown-preview-plus`
 - [Spotify](https://www.spotify.com/ca-en/download/other/)
 - [Homebrew](http://brew.sh/)
 - [ImageMagick](https://www.imagemagick.org/script/binary-releases.php#macosx): `brew install imagemagick`
 - [Skype](https://www.skype.com/en/download-skype/skype-for-computer/)
 - [R](https://cran.rstudio.com/bin/macosx/)
 - [RStudio](https://www.rstudio.com/products/rstudio/download/)
 - [Dropbox](https://www.dropbox.com/downloading)
 - [Matlab](https://www.mathworks.com/downloads/)

## Extra git stuff

#### Gitignore
In the file `~/.gitignore_global` put

```
.DS_Store
.ipynb_checkpoints
*~
.Trashes
.RHistory
```

and then execute `git config --global core.excludesfile '~/.gitignore_global'`

#### Default editor

```
git config --global core.editor atom
```
(or `emacs` or whatever) 
