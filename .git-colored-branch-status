# copied form .bashrc
# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# Configure colors, if available.
if [ -x /usr/bin/tput ] && tput setaf 1 >& /dev/null; then
  c_reset="\[$(/usr/bin/tput sgr 0)\]"
  c_user=
  c_path=
  #c_user="\[$(/usr/bin/tput bold)$(/usr/bin/tput setaf 3)\]"
  #c_path="\[$(/usr/bin/tput setaf 3)\]"
  c_git_clean="\[$(/usr/bin/tput bold)$(/usr/bin/tput setaf 2)\]"
  c_git_dirty="\[$(/usr/bin/tput bold)$(/usr/bin/tput setaf 1)\]"
  c_git_semi_dirty="\[$(/usr/bin/tput bold)$(/usr/bin/tput setaf 3)\]"
else
  c_reset=
  c_user=
  c_path=
  c_git_clean=
  c_git_dirty=
  c_git_semi_dirty=
fi

# Function to assemble the Git parsingart of our prompt.
git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  git_branch=$(git branch 2> /dev/null | sed -n '/^\*/s/^\* //p')
  status=$(git status --porcelain 2> /dev/null)

  # untracked check
  if $(echo "$status" | grep '?? ' &> /dev/null); then
    git_color="$c_git_dirty"
    dirty=1
  else
    git_color="$c_git_clean"
    dirty=0
  fi

  # diff check & clean
  if ! git diff HEAD --quiet 2> /dev/null >&2; then
    if [ dirty=0 ]; then
      git_color="$c_git_dirty"
      dirty=1
    fi
 fi

  # check for unpushed commits
  if ! git diff $git_branch origin/$git_branch --quiet 2> /dev/null >&2; then
    if [ dirty=0 ]; then
      git_color="$c_git_semi_dirty"
    fi
  fi

  echo "[$git_color$git_branch${c_reset}]"
}

# The holy prompt.
PROMPT_COMMAND='PS1="${c_user}\u${c_reset}@${c_user}\h${c_reset}:${c_path}\w${c_reset}$(git_prompt)\$ "'
