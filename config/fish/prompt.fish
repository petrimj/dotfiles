# Terminal startup script
# function fish_greeting
#     echo -n "Welcome to $USER's "
#     set_color green
#     echo -n fish
#     set_color normal
#     echo "!"
# end

# Terminal window title
# This is for rescuetime
function fish_title
    echo -n (whoami)@(hostname):(pwd)
end

# Custom prompt: Show current branch in shell
# function fish_prompt
#   # Fill up z database on every prompt
#   # docs: https://github.com/sjl/z-fish
#   z --add "$PWD"
#
#   # Quite nice source for colors: http://colours.neilorangepeel.com/
#   echo -n (whoami)
#   set_color "#FFDAB9" #peachpuff
#   # echo -n '@'
#   set_color normal
#   # echo -n (hostname)':'
#   set_color "#E9967A" #darksalmon
#   echo -n (prompt_pwd)
#   set_color normal
#
#
#   if is_git
#     echo -n '('
#     if is_git_dirty
#       set_color red
#     else if is_git_ahead
#       set_color yellow
#     else
#       set_color green
#     end
#     echo -n (git_branch)
#     set_color normal
#     echo -n ') '
#   end
#   echo -n '> '
# end

# Show git branch on right prompt
# function fish_right_prompt
#   if is_git
#     if is_git_dirty
#       set_color red
#     else if is_git_ahead
#       set_color yellow
#     else
#       set_color green
#     end
#     echo -n (git_branch)
#     set_color normal
#     echo -n ' '
#   end
# end


set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch green
set __fish_git_prompt_color_upstream_ahead yellow
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'


function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end

