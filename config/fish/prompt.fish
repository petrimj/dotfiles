# Terminal startup script
function fish_greeting
    echo -n "Welcome to $USER's "
    set_color green
    echo -n fish
    set_color normal
    echo "!"
end

# Terminal window title
# This is for rescuetime
function fish_title
    echo -n (whoami)@(hostname):(pwd)
end

# Custom prompt: Show current branch in shell
function fish_prompt
  # Fill up z database on every prompt
  # docs: https://github.com/sjl/z-fish
  z --add "$PWD"

  # Quite nice source for colors: http://colours.neilorangepeel.com/
  # Show prompt
  set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
  set_color normal
  echo -n (whoami)
  set_color "#FFDAB9" #peachpuff
  echo -n '@'
  set_color normal
  echo -n (hostname)':'
  set_color "#E9967A" #darksalmon
  echo -n (prompt_pwd)
  set_color "#6495ED" #cornflowerblue
  echo -n '{'"$git_branch"'} '
  set_color normal
  echo -n '> '
end
