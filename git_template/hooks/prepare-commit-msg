#!/bin/sh
#
# Automatically adds branch name and branch description to every commit message.
#

##
# Installation on OSX:
# $ brew install aspell
#
# Then add Your custom word list to home folder
# The first line needs to be personal_ws-1.1 en 0
# $ nano ~/.aspell.en.pws
#
# For example:
#
# personal_ws-1.1 en 0 
# git
# json
# wordpress
# Facebook
# vagrant
# vagrantfile
# ansible
#
##

function command_exists () {
  command -v "$1" >/dev/null 2>&1
}

# If aspell is installed spell check all my commits
if command_exists aspell;
  # aspell has no idea of git hashes so remove them from spellchecking
  MESSAGE=$(cat "$1")
  HASHES=$(git rev-list --all)
  while read -r line; do
      MESSAGE=$(echo $MESSAGE | sed "s/$line//g")
  done <<< "$HASHES"

  # Spell check commit message
  TYPOS=$(echo $MESSAGE | aspell list -d en_US)
  if [ -n "$TYPOS" ]; then
    echo -e "ERROR: spell check failed on words: \n$TYPOS"
    echo "Edit ~/.aspell.en.pws to accept more words"
    echo "SKIP THIS: git commit -nm '$(cat "$1")'"
    exit 1
  fi
fi

# Get commit message
commit_msg=$(cat "$1")

# I'm lazy. Please capitalize first letter if I forgot to
commit_msg_capitalize="$(tr '[:lower:]' '[:upper:]' <<< ${commit_msg:0:1})${commit_msg:1}"

echo "$commit_msg_capitalize" > "$1"