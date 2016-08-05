#!/bin/bash
set -e

# Helper function
function command_exists () {
  command -v "$1" >/dev/null 2>&1
}

# Install Xcode commandline tools
if ! xcode-select -p; then
  xcode-select --install
  echo "Install Xcode commandline tools and run this command again: $ $0"
  exit 1
else
  echo "Xcode commandline tools already installed!"
fi

# Ask for sudo only once
echo "Enter your sudo password for one time. This is for installing pip."
sudo -v

# Install brew
if ! command_exists brew; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install utilities
brew tap thoughtbot/formulae
brew tap caskroom/cask
brew install rcm aspell ansible wifi-password fish node docker gpg2 thefuck cowsay  # Last one is must have

# Install PHP7
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew unlink php56
brew install php70

# Install Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '070854512ef404f16bac87071a6db9fd9721da1684cd4589b1196c3faf71b9a2682e2311b36a5079825e155ac7ce150d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

if [ -f composer.phar ];
  mv composer.phar /usr/local/bin/composer
fi

# Install hub github helper
brew install hub

# Replace OSX utilities with newer ones
brew tap homebrew/dupes
brew install openssh --with-keychain-support

# Install pygmentize
sudo easy_install pip
sudo pip install pygments --upgrade

# Install travis gem for .travis.yml syntax checking
gem install travis --no-rdoc --no-ri

# Install useful applications for developers using cask
brew cask install spectacle iterm2 flux seil karabiner google-chrome firefox \
                  virtualbox slack skype gpgtools vagrant vagrant-manager vlc hipchat

# Activate dotfiles for the first time
rcup -d ~/.dotfiles -x UNLICENSE -x README.md -x osx -x plist -x init

##
# Activate karabiner settings
# These will allow you to move with arrow keys using fn+wasd or fn+ijkl
# These will also allow to enter number with homerow space+{asdfghjkl}
##

# Install karabiner settings
mkdir -p $HOME/Library/Application\ Support/Karabiner/
cp ~/.dotfiles/init/karabiner.xml $HOME/Library/Application\ Support/Karabiner/private.xml

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
sudo cp ~/.dotfiles/init/onnimonni-Dvorak-QWERTY-CMD /Library/Keyboard\ Layouts/
sudo cp ~/.dotfiles/init/onnimonni-Dvorak-QWERTY-CMD.keylayout /Library/Keyboard\ Layouts/

##
# Start to use fish shell
##

# This adds /usr/local/bin/fish to shell options
grep -q -F "/usr/local/bin/fish" /etc/shells || echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

echo "INSTALLATION IS COMPLETE!"
echo "OPTIONAL FINAL STEP:"
echo "Activate onnimonni-Dvorak keyboard layout from"
echo "GO: System Preferences -> Keyboard \
-> Input Sources -> search 'onni' -> activate onnimonni-Dvorak"
