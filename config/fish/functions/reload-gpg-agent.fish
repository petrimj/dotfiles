##
# Update dotfiles from origin
##
function reload-gpg-agent --description 'Kills current gpg agent and starts new one'
  killall gpg-agent
  gpg-agent --daemon >/dev/null
  gpg-connect-agent reloadagent /bye
end
