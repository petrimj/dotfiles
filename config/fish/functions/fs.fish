function fs --description 'Print size of file recursively'
  du -hs $argv | cut -f -1 | tr -d ' '
end
