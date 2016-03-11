##
# onnimonni preferred aliases and functions
##


function f_exists 
    command -v "$argv" >/dev/null 2>&1
end

alias ll "ls -lah"

if f_exists rmate
   alias rmate "rmate --port=52777" 
end

##
# Fix 'sudo !!' and 'sudo ll' because I use them so much :(
##
function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else if test "$argv" = 'll'
        eval command sudo ls -lah
    else
        command sudo $argv
    end
end

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