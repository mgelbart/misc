## Installations
 - [1Password](https://agilebits.com/downloads)
 - developer tools: `xcode-select --install`
 - [Homebrew](http://brew.sh/)
 - [Chrome](https://www.google.ca/chrome/browser/desktop/index.html)
 - [Julia](http://julialang.org/downloads/): `brew install Caskroom/cask/julia`
 - [f.lux](https://justgetflux.com/): `brew cask install flux`
 - [Anaconda](https://www.continuum.io/downloads)
 - [Slack](https://slack.com/downloads/osx)
 - [MacTex](https://www.tug.org/mactex/)
 - [Atom](https://atom.io/)
   - Atom --> Install Shell Commands
   - [LaTeX](https://atom.io/packages/latex): `apm install latex` and `apm install language-tex`
   - [Juno](https://github.com/JunoLab/uber-juno/blob/master/setup.md) for Julia: `apm install uber-juno`
   - [Markdown](https://atom.io/packages/markdown-preview-plus): `apm install markdown-preview-plus`
 - [Spotify](https://www.spotify.com/ca-en/download/other/)
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
.Trashes
.RHistory
__pycache__
~$*
~*
*~
.~
*.egg-info
.nbgrader.log
```

and then execute `git config --global core.excludesfile '~/.gitignore_global'`

#### Defaults

```
git config --global core.editor emacs
```
(or `atom` or whatever) 

Also

```
git config --global user.name "Mike Gelbart"
git config --global user.email mgelbart@cs.ubc.ca
```

#### Bashrc

In `~/.bash_profile` add the following aliases:

```
alias l="git status"
alias jp="jupyter notebook"
alias jl="jupyter lab"
alias unlock="chflags -R nouchg"
alias listf="du -hs * | gsort -h"

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
```

#### set up ssh key(s)

Following instructions at https://help.github.com/articles/generating-an-ssh-key/

And then `ssh-add -K ~/.ssh/id_rsa` to store the passphrase in Keychain.

Then add the following to `~/.ssh/config`:

```
Host *
  UseKeychain yes
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_rsa
```

so that you don't need to do this everytime you login (see [here](http://apple.stackexchange.com/questions/48502/how-can-i-permanently-add-my-ssh-private-key-to-keychain-so-it-is-automatically)).

## macOS preferences

- Scroll bars
  - System Preferences --> General
  - Show scroll bars: Always
  - Click in the scroll bar to: Jump to the spot that's clicked
- Enable [three finger drag](https://support.apple.com/en-ca/HT204609)
- Set clock to show date
- Set battery to show percentage
- Turn off autocorrect
  - System preferences --> Keyboard
  - Text tab
  - Uncheck the 3 boxes
- Mail app keyboard shortcut for archive
  - System preferences --> Keyboard
  - Shortcuts, App shortcuts
  - "+"
  - Mail
  - Menu Title: Archive
  - Shortcut: Cmd+E
- Turn of new mail sound
  - Mail --> Preferences --> General
  - New message sound: None
- Show all file extensions
  - Finder --> Preferences --> Advanced --> Show all filename extensions
- Chrome --> Chrome menu --> check "Warn before quitting" (to guard against pressing command-Q instead of command-W)
