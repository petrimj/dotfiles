#!/bin/env bash
set -e

# Ask for sudo only once
sudo -v

# Helper function
function command_exists () {
  command -v "$1" >/dev/null 2>&1
}

# Install Xcode commandline tools
xcode-select --install

# Install brew
if ! command_exists brew; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install utilities
brew tap thoughtbot/formulae
brew tap caskroom/cask
brew install rcm aspell wifi-password cowsay pip fish node docker  # Last one is must have

# Install pygmentize
pip install pygments --upgrade

# Install useful applications for developers using cask
brew cask install spectacle iterm2 flux seil karabiner google-chrome firefox \
                  virtualbox slack

# Activate dotfiles for the first time
rcup -d ~/.dotfiles -x LICENSE -x README.md

##
# Activate karabiner settings
# These will allow you to move with arrow keys using fn+wasd or fn+ijkl
# These will also allow to enter number with homerow space+{asdfghjkl}
##

# Install karabiner settings
mkdir -p /Users/onnimonni/Library/Application\ Support/Karabiner/
cp ~/.dotfiles/init/karabiner.xml /Users/onnimonni/Library/Application\ Support/Karabiner/private.xml

# Activate karabiner settings
/Applications/Karabiner.app/Contents/Library/bin/karabiner reloadxml

##
# Activate Seil settings
##
cli=/Applications/Seil.app/Contents/Library/bin/seil

# Map capslock -> backspace
# I make so much errors that it's nice to have backspace near the home row
$cli set keycode_capslock 51
/bin/echo -n .

# Change right ⌘ -> ⌥
# And right ⌥ -> ⌘ ( vice versa )
# This allows me to have ⌥ as close to spacebutton as possible
/bin/echo -n .
$cli set keycode_command_r 61
/bin/echo -n .
$cli set keycode_option_r 54

# Relaunch to activate settings
$cli relaunch

##
# Install OnniDvorak-QWERTY-CMD custom keyboard layout
##
cp ~/.dotfiles/init/OnniDvorak* /Library/Keyboard\ Layouts/

echo "OPTIONAL FINAL STEP:"
echo "Activate onnimonni-Dvorak keyboard layout from System Preferences -> Keyboard \
-> Input Sources -> search 'onni' -> activate onnimonni-Dvorak"
