# Shorthand for opening editor
function edit --description 'Open file in your $EDITOR'
  if test -s $argv
    echo 'usage: edit filename'
  else if test -e $argv
    #TODO: here we should have logic to all in sublime but images in photoshop or gimp
    eval $EDITOR $argv
  else
    echo "edit: $argv: No such file or directory"
  end
end
