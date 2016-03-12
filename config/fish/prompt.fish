# Terminal startup script
function fish_greeting
    echo -n "Welcome to Onnimonni's "
    set_color green
    echo -n fish
    set_color normal
    echo "!"
    echo "Edit me in: "(fish_config_dir)
end

# Terminal window title
# This is for rescuetime
function fish_title
    echo -n (whoami)@(hostname):(pwd)
end

# Custom prompt: Show current branch in shell
function fish_prompt
    set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
    echo -n (whoami)'@'(hostname)':'
    set_color green
    echo -n (prompt_pwd)
    set_color blue
    echo -n '{'"$git_branch"'} '
    set_color normal
    echo -n '$ '
end