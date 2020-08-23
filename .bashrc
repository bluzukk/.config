## BASH CONFIG (.bashrc)

## Sync bashrc with synced bashrc...
test -s ~/Sync/Creations/Rice/.bashrc && . ~/Sync/Creations/Rice/.bashrc || true
alias python=python3.5

################################################################
# BASICS
################################################################
alias c="clear"
alias cat="lolcat"
# alias q="exit"
alias ll="ls -l"
alias ls="ls --color=always --group-directories-first"
alias sl="ls --color=always --group-directories-first"
alias la="ls -A --group-directories-first"
alias grep="grep --color"
alias ka="killall"
alias t="st &"
alias ..="cd .."
alias ...="cd ../.."

alias proj="cd ~/Sync/Projects"
alias cr="cd ~/Sync/Creations"


################################################################
# PROGRAMM SHORTCUTS
################################################################
alias h="htop"
alias f="firefox"
alias q="qutebrowser"
alias r="ranger"
alias sr="sudo ranger"
alias m="mupdf"
alias music="cmus"


alias bs="vim ~/.bashrc"
alias xcfg="vim -p ~/.bashrc ~/.Xdefaults ~/.xinitrc ~/"

alias 30min="sudo shutdown -P 30"
alias 45min="sudo shutdown -P 45"
alias nvmetemp="sudo nvme smart-log /dev/nvme0 | grep temperature"
alias cpu="for i in {0..10000};do lscpu | grep 'CPU MHz';sleep 0.05;clear;done"
alias mp3="youtube-dl -x --audio-format mp3"

################################################################
# GIT
################################################################
alias gstat="git status"
alias gcheck="git checkout"
alias gpull="git pull"
alias clean="make clean"

################################################################
# STUFF
################################################################
alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"
alias fetch="neofetch --config off --block_range off --bold off --uptime_shorthand on --gtk_shorthand on --colors 8 1 8 5 5 9 --ascii_distro off --disable host uptime shell resolution theme icons memory"
alias eip_local="LANG=c ifconfig wlp3s0 | grep 'inet addr' | awk -F: '{print $2}' | awk '{print $1}'"
alias eip="curl https://ipecho.net/plain"
alias wifi_scan="iwlist wlp3s0 scan | grep ESSID"

################################################################
# TEMPLATES
################################################################
alias temp="cd ~/Sync/Creations/Templates/"
alias tex_paper="cp -r ~/Sync/Creations/Templates/latexPaper ./ && echo 'Copied latex template'"
alias tex_abgabe="cp -r ~/Sync/Creations/Templates/latexAbgabe ./ && echo 'Copied latex template'"

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between Bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi


# Sensible Bash - An attempt at saner Bash defaults
# Maintainer: mrzool <http://mrzool.cc>
# Repository: https://github.com/mrzool/bash-sensible
# Version: 0.2.2

# Unique Bash version check
# if ((BASH_VERSINFO[0] < 4))
# then
#   echo "sensible.bash: Looks like you"re running an older version of Bash."
#   echo "sensible.bash: You need at least bash-4.0 or some options will not work correctly."
#   echo "sensible.bash: Keep your software up-to-date!"
# fi

## GENERAL OPTIONS ##

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

## SMARTER TAB-COMPLETION (Readline bindings) ##

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

## SANE HISTORY DEFAULTS ##

# Append to the history file, don"t overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND="history -a"

# Huge history. Doesn"t appear to slow things down, so why not?
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don"t record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT="%F"

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
# bind ""\e[A": history-search-backward"
# bind ""\e[B": history-search-forward"
# bind ""\e[C": forward-char"
# bind ""\e[D": backward-char"

## BETTER DIRECTORY NAVIGATION ##

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 4> /dev/null
# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 4> /dev/null

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH="."

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you"re in
shopt -s cdable_vars
