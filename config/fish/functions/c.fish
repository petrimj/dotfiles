# `cat` with beautiful colors. uses Pygments if installed.
# Otherwise fallbacks to basic cat
function c --description 'Print file contents with colors'
  if command_exists pygmentize
    pygmentize -O style=monokai -f console256 -g $argv
  else
    cat --color=auto $argv
  end
end
