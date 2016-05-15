# this script can never fail
# i use it in the fish_config
# call it with start_agent
# source: https://gist.github.com/rsff/9366074

# Read bash variables and set them in a fish way
function __refresh_gpg_agent_info -d "Re-load ~/.gpg-agent-info into environment"
  cat ~/.gpg-agent-info | sed 's/=/ /' | while read key value
    set -e $key
    set -U -x $key "$value"
  end
end

# gpg agent with yubikey
function start_agent

  # Start or re-use a gpg-agent.
  gpgconf --launch gpg-agent

  __refresh_gpg_agent_info

  set GPG_TTY (tty)
end

# Traditional ssh agent
#function start_agent
#  if [ -n $SSH_AUTH_SOCK ]
#        ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
#        if [ $status -eq 0 ]
#            test_identities
#        end
#  else
#        if [ -f $SSH_ENV ]
#            . $SSH_ENV > /dev/null
#        end
#      ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
#      if [ $status -eq 0 ]
#          test_identities
#      else
#        echo "Initializing new SSH agent ..."
#          ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
#        echo "succeeded"
#    chmod 600 $SSH_ENV
#    . $SSH_ENV > /dev/null
#        ssh-add
#  end
#  end
#end


function test_identities
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
        if [ $status -eq 2 ]
            start_agent
        end
    end
end
