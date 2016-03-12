# For later changes
function update-dotfiles
  git -C ~/.dotfiles pull origin master
  # Update new symlinks but ssh
  rcup -d ~/.dotfiles -x LICENSE -x README.md -x ssh
end

##
# Add aliases
##

# Prevent overwriting by accident
alias cp "cp -iv"
alias mv "mv -iv"

# Shortcuts
alias g "git"
alias h "history"
alias j "jobs"

##
# Skip all custom checks in my custom scripts
##
function run-it-please
  begin
    set -lx SKIP_CUSTOM_CHECKS true
    eval command $history[1]
  end
end

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1 # GNU `ls`
  set -U colorflag "--color"
else # OS X `ls`
  set -U colorflag "-G"
end


# List all files colorized in long format
alias l "ls -lF $colorflag"

# List all files colorized in long format, including dot files
alias la "ls -laF $colorflag"

# List only directories
alias lsd "ls -lF $colorflag | grep --color=never '^d'"

# Always use color output for `ls`
alias ls "command ls $colorflag"
set -U LS_COLORS 'no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep 'grep --color=auto'
alias fgrep 'fgrep --color=auto'
alias egrep 'egrep --color=auto'

# Enable aliases to be sudo’ed (these are basically the only which ever occur)
function sudo
  if test "$argv" = !!
    eval command sudo $history[1]
  else if test "$argv" = "ll"
    command sudo ls -lah $colorflag
  else
    command sudo $argv
  end
end

# Allow reloading fish config after changes
alias reload "source ~/.config/fish/config.fish"

# Get week number
alias week 'date +%V'

# IP addresses
alias ip "dig +short myip.opendns.com @resolver1.opendns.com"
alias localip "ipconfig getifaddr en0"
alias ips "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Flush Directory Service cache
alias flush "dscacheutil -flushcache; and killall -HUP mDNSResponder"

# View HTTP traffic
alias sniff "sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump "sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# .DS_Store is so evil
alias scp "rsync -avz --exclude '.DS_Store'"
alias rsync "rsync --exclude '.DS_Store'"

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null; or alias hd "hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null; or alias md5sum "md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null; or alias sha1sum "shasum"

# Recursively delete `.DS_Store` files
alias cleanup "find . -type f -name '*.DS_Store' -ls -delete"

# Run docker commands in project with docker-compose.yml
function dexec
    docker exec -it (docker-compose ps -q web) $argv
end

##
# Check headers from curl with normal GET method
# Usage: $ headers google.fi
##
alias headers "curl -sD - -o /dev/null"

##
# Check if command exists
# @param $1 command_name
# @return boolean
##
function command_exists
    command -v "$argv" >/dev/null 2>&1
end

##
# Remove variables
##
function unset
    set --erase "$argv"
end
