## Installations
 - [1Password](https://agilebits.com/downloads) (available from App Store)
 - developer tools: `xcode-select --install`
 - [Homebrew](http://brew.sh/)
 - [Chrome](https://www.google.ca/chrome/browser/desktop/index.html) (available from App Store)
 - [Anaconda](https://www.continuum.io/downloads) or Miniconda
 - [Slack](https://slack.com/downloads/osx) (available from App Store, which I think works better with notification settings)
 - [Spotify](https://www.spotify.com/ca-en/download/other/)
 - [Dropbox](https://www.dropbox.com/downloading)
 - Jupyter
   - base: `conda install -c conda-forge jupyterlab`
   - base: `conda install -n base nb_conda_kernels`
   - env: `conda install ipykernel`
   - Then, launch Jupyter from base, and select that env from the kernel dropdown


Optional, for me:

 - [MacTex](https://www.tug.org/mactex/)
 - [ImageMagick](https://www.imagemagick.org/script/binary-releases.php#macosx): `brew install imagemagick`
 - [R](https://cran.rstudio.com/bin/macosx/)
 - [RStudio](https://www.rstudio.com/products/rstudio/download/)

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
altair-data-*.json
```

and then execute `git config --global core.excludesfile '~/.gitignore_global'`

#### Defaults

```
git config --global core.editor nano
```
(or `code`, `emacs`, or whatever) 

Also

```
git config --global user.name "Mike Gelbart"
git config --global user.email mgelbart@cs.ubc.ca
```

#### Bashrc

In `~/.bash_profile` or `~/.zshrc` add the following aliases:

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

#### matplotlibrc

In `~/.matplotlib/matplotlibrc` add the following:

```
font.size : 16
```

#### set up ssh key(s)

Following instructions at https://help.github.com/articles/generating-an-ssh-key/

And then `ssh-add -K ~/.ssh/id_rsa` to store the passphrase in Keychain.

Then add the following to `~/.ssh/config`:

```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
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
- Turn off new mail sound
  - Mail --> Preferences --> General
  - New message sound: None
- Show all file extensions
  - Finder --> Preferences --> Advanced --> Show all filename extensions
- Chrome --> Chrome menu --> check "Warn before quitting" (to guard against pressing command-Q instead of command-W)
- Make screenshots better
  - In terminal: `defaults write com.apple.screencapture location ~/Downloads/` so they go to Downloads instead of Desktop
  - Follow [these instructions](https://macmost.com/skip-mac-mojave-screenshot-delay.html) to remove the delay:
    - Command+Shift+5
    - Click on the Options button that appears in the controls
    - Uncheck "Show Floating Thumbnail"
