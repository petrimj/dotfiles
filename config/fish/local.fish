# Add aliases
### Added sublime editor as main editor
set SUBL "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

### Sometimes I mistake if I'm in remote or not
alias rmate '/usr/local/bin/subl'

# Set default editor
set -U EDITOR subl

# Shortcuts
alias d "cd ~/Documents/Dropbox"
alias dl "cd ~/Downloads"
alias dt "cd ~/Desktop"
alias p "cd ~/Projects"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash "sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update 'sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill "ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

