##
# onnimonni preferred aliases and functions
##

##
# Get current conf file directory
# This needs to resolve symlinks from rcm
##
function fish_config_dir
    switch (uname)
    case Darwin # OS-X
        echo ( dirname ( readlink    (status --current-filename) ) )
    case '*'
        echo ( dirname ( readlink -f (status --current-filename) ) )
    end
end

set FDIR (fish_config_dir)

source $FDIR/helpers.fish
source $FDIR/aliases.fish
source $FDIR/hacks.fish
source $FDIR/prompt.fish
source $FDIR/colors.fish

# Use remote hacks if connection is not local and local hacks otherwise
if test -d $SSH_CONNECTION
    source $FDIR/local.fish
else
    source $FDIR/remote.fish
end

# Remove temporary variable afterwise
unset FDIR
