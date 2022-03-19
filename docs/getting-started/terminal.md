---
title: Terminal
---

Mac developers often work in the Terminal to use the Swift package manager, install macOS packages with Homebrew, collaborate on projects with Git and GitHub, run server side Swift code, etc. Below are some tips for working in the macOS Terminal.

## Pure

The Z shell (or zsh) is the default shell for macOS. [Pure](https://github.com/sindresorhus/pure
) improves the zsh command prompt in the terminal. Use the suggested theme in the Pure documentation.

## Zsh configuration

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

# Coreutils aliases
# brew install coreutils
# ----------------------------------------------------------------------------

# List files line-by-line including hidden files
alias la="gls -aho --group-directories-first --color=auto"

# List files line-by-line excluding hidden files
alias ll="gls -ho --group-directories-first --color=auto"

# Zsh configuration
# ----------------------------------------------------------------------------

# Change to ~/Desktop when launching terminal
cd ~/Desktop

# Enable completion system
autoload -Uz compinit && compinit

# Enable color for `ls` output
export CLICOLOR=1

# Set VIM as the default terminal editor
export VISUAL=vim
export EDITOR=vim

# Use ipdb as the Python breakpoint() debugger
export PYTHONBREAKPOINT=ipdb.set_trace

# Open Sublime Text from command line
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Change directory without using `cd`
setopt AUTO_CD

# List files after changing directory
function chpwd() {
    emulate -L zsh
    la
}

# Workaround for Visual Studio Code integrated terminal
if [[ -v VSCODE_GIT_IPC_HANDLE ]]; then
    conda deactivate
    conda activate
fi
```

## Keyboard shortcuts

Various keyboard shortcuts for working with the command line prompt.

`Ctrl + a` - go to beginning of the line

`Ctrl + c` - cancel the command

`Ctrl + e` - go to end of the line

`Ctrl + u` - clear up to the beginning

## General commands

My preferred permissions for folders and files.

```bash
chmod 755   # folder permissions
chmod 644   # file permissions
```

Copy all the files in a folder into another folder.

```bash
cp -R folderA/. folderB
```

List the contents of a folder or of a specified folder.

```bash
ls
ls folderA/
```

Rename a file or folder.

```bash
mv oldname.txt newname.txt
mv oldfolder/ newfolder/
```

Remove a folder that already contains files.

```bash
rm -rf folderA/
```

Move all files from one folder to another folder. Example below demonstrates moving all the files from the Downloads folder to the Videos folder.

```bash
mv ~/Downloads/* ~/Videos
```

## Commands specific to macOS

Open a file from the macOS terminal.

```bash
open fileA.txt            # open a file in its default application
open -a safari fileA.txt  # opens with the specified application
open -R fileA.txt         # selects the file in a Finder window
```

Mount and unmount a volume on a Mac.

```bash
hdiutil attach Secure.dmg       # mount a dmg volume named "Secure.dmg"
hdiutil detach /Volumes/Secure  # unmount a volume named "Secure"
```
