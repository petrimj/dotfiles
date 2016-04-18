##
# Update git hooks from defaults
##
function update-git-hooks --description 'Updates new hooks from to ~/.git_template/hooks/'
  if is_git
    cp ~/.git_template/hooks/* .git/hooks/
    echo "Git hooks are updated!"
  else
    echo "This is not git directory :(..."
  end
end
