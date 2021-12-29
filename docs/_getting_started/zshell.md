---
title: Z shell (zsh)
---

The Z shell (or zsh) is the default shell for macOS. Below are some setup and configuration notes for zsh on the Mac.

## Pure

The first thing to do on a new Mac is install Pure to improve the zsh prompt. Use the suggested theme in the Pure documentation.

https://github.com/sindresorhus/pure


## .zshrc

Create a `~/.zshrc` file to configure the Z shell. The `.zshrc` file shown below assumes Pure, Xcode, and Miniconda have been installed on the Mac.

```bash
# Pure prompt configuration
# https://github.com/sindresorhus/pure
# ----------------------------------------------------------------------------

fpath+=$HOME/.zsh/pure

autoload -U promptinit; promptinit
prompt pure

PURE_GIT_DOWN_ARROW=⬇︎

PURE_GIT_UP_ARROW=⬆︎

# Zsh configuration
# ----------------------------------------------------------------------------

# Enable completion system
autoload -Uz compinit && compinit

# Enable color for `ls` output
export CLICOLOR=1

# Set VIM as the default terminal editor
export VISUAL=vim
export EDITOR=vim

# Use ipdb debugger as the Python breakpoint() debugger
export PYTHONBREAKPOINT=ipdb.set_trace

# Start terminal in ~/Desktop directory and list files
cd ~/Desktop

# Open Sublime Text from command line
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# List line-by-line including hidden files
alias la="ls -aoh"

# List line-by-line
alias ll="ls -oh"

# Change directory without using `cd`
setopt AUTO_CD

# List files after changing directory
function chpwd() {
    emulate -L zsh
    ls
}
```
