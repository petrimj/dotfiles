##
# onnimonni preferred aliases and functions
##

# Nice hack to help use aliases even with sudo
# http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo "sudo "

alias ll "ls -lah"


# Sometimes I forgot I'm using fish instead of bash and these help use '$'' and '!!'
function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end