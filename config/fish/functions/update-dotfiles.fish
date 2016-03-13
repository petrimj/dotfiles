##
# Update dotfiles from origin
##
function update-dotfiles --description 'Update changes to ~/.dotfiles'
  git -C ~/.dotfiles pull origin master
  # Update new symlinks but ssh
  rcup -d ~/.dotfiles -x LICENSE -x UNLICENSE -x README.md -x ssh
  # Source new changes
  reload
end
