# ~/.bashrc: executed by bash(1) for non-login shells.

source ~/.profile

# Terminal colours (after installing GNU coreutils)
NM="\[\033[0;38m\]" #means no background and white lines
HI="\[\033[0;37m\]" #change this for letter colors
HII="\[\033[0;31m\]" #change this for letter colors
SI="\[\033[0;33m\]" #this is for the current directory
IN="\[\033[0m\]"

source './.git-colored-branch-status'

MY_PS1="$NM[$HI\u $SU\w$NM]$IN"
PROMPT_COMMAND='PS1="$MY_PS1$(git_prompt): "'
export PATH="/usr/local/bin:/usr/local/sbin:/Users/andwen/Programs/play-1.2.5:/Users/andwen/bin:$PATH"
export PATH="$PATH:/Applications/dart-sdk/bin"
export COUCH="http://localhost:5984"
export JAVA_OPTS="-Djava.net.preferIPv4Stack=true"
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
alias ls='ls -aG'
alias ll='ls -alhG'
alias l='ls -lAG'

# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

git_version() {
  git --version | sed -e 's/.*\([0-9].[0-9].[0-9]\)/\1/'
}

if [ -f "/usr/local/Cellar/git/$(git_version)/etc/bash_completion.d/git-completion.bash" ]; then
  . "/usr/local/Cellar/git/$(git_version)/etc/bash_completion.d/git-completion.bash"
fi

if [ -f "/usr/local/Cellar/git/$(git_version)/etc/bash_completion.d/git-prompt.sh" ]; then
  . "/usr/local/Cellar/git/$(git_version)/etc/bash_completion.d/git-prompt.sh"
fi

. /usr/local/Library/Contributions/brew_bash_completion.sh

