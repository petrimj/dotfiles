# dotfiles
[@onnimonni](https://github.com/onnimonni) dotfiles.

Big thanks for [@anttiviljami](https://github.com/anttiviljami) for guidance. I hope someday I will learn to play [vimgolf](http://www.vimgolf.com/) but until then I will need these cheats.

Many configs and aliases are copied from [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles/).

## Requirements
[rcm](https://github.com/thoughtbot/rcm)

## Installation
```
$ rcup -d ~/.dotfiles -x LICENSE -x README.md
```

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

## Recommended utilities

- **aspell** for automatic spell checking in git commits

### Install all in OS-X
```
$ brew tap thoughtbot/formulae
$ brew install rcm aspell cowsay # Last one is must have
```
