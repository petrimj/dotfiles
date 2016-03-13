# Enable aliases to be sudo’ed
# (these are basically the only which ever occur)
# I would want to use all aliases with sudo but it seems not possible with fish
function sudo
  if test "$argv" = !!
    eval command sudo $history[1]
  else if test "$argv" = "ll"
    command sudo ls -lah $colorflag
  else
    command sudo $argv
  end
end
