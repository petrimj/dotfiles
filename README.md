# dotfiles
![Coding should be fun!](https://media.giphy.com/media/ytwDCq9aT3cgEyyYVO/giphy-tumblr.gif "Coding should be fun!")

[@onnimonni](https://github.com/onnimonni) dotfiles.

Big thanks for [@anttiviljami](https://github.com/anttiviljami) for years of guidance.
I hope someday I will learn to play [vimgolf](http://www.vimgolf.com/) but until then I will need these cheats.

Many configs and aliases are copied from [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles/) and [paulirish/dotfiles](https://github.com/paulirish/dotfiles). Thank you guys for sharing these for me!

## Includes
- Fish shell as default shell & plenty of noob friendly fish functions
- Different fish configuration between local and remote shells (see [local.fish](config/fish/local.fish) & [remote.fish](config/fish/remote.fish))
- Automatically starts ssh agent when terminal is opened
- Automatic [rmate](https://github.com/aurora/rmate/blob/master/rmate) settings in order to use sublime text in remote servers.
- Automatic [english spell checking](git_template/hooks/prepare-commit-message) on git commits with [customizable word list](aspell.en.pws)
- Few [automatic syntax checks](git_template/hooks/pre-commit) on git commits (ruby,php,json)
- Custom nano keyboard mappings (I like `ctrl+c`, `ctrl+v` and `ctrl+f` a lot more than nano defaults)
- Monokai theme for terminal (but darker background for better contrast)

### Hardcore stuff which is probably useful only for me
- Custom keyboard mappings with [seil](https://pqrs.org/osx/karabiner/seil.html.en) and [karabiner](https://pqrs.org/osx/karabiner/)
- This includes my own keyboard layout based on Dvorak ( but allows finnish to be typed as well).

## Requirements
[rcm](https://github.com/thoughtbot/rcm)

## Recommended utilities

- **aspell** - for automatic spell checking in git commits
- **cowsay** - it makes ansible deployments much more funnier
- **wifi-password** - it makes ansible deployments much more funnier

## Recommended free applications
- **spectacle** - Really fancy open source window resizer
- **iterm2** - Better terminal
- **karabiner** - Custom keyboard mappings
- **seil** - Override system keys into whatever you want to
- **slack** - Override system keys into whatever you want to

These all will be installed using `.install.sh`.

## Recommended paid applications
**[copyclip2](https://fiplab.com/apps/copyclip-for-mac)** -
Saves ridiculous amount of hours because and only costs 4.99$.

## Installation
```
$ git clone https://github.com/onnimonni/dotfiles ~/.dotfiles
$ rcup -d ~/.dotfiles -x LICENSE -x README.md
```

### Install all settings and utilities in OS-X
```
# Installs utilities and additional settings
$ bash ~/.dotfiles/.install.sh

# Installs os-x sensible defaults from mathiasbynens/dotfiles
$ bash ~/.dotfiles/osx
```

## Update configs
```
# This only works in fish shell
$ update-dotfiles
```

## UNLICENSE
Use this package as you want to. Sharing is caring!


