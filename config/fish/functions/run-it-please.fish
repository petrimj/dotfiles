##
# Skip all custom checks in my custom scripts
# All my custom scripts respect SKIP_CUSTOM_CHECKS variable
# ATM this is used only in git hooks
##
function run-it-please
  begin
    set -lx SKIP_CUSTOM_CHECKS "true"
    eval $history[1]
  end
end
