set -x EDITOR nvim
set -x VISUAL nvim

set -gx PNPM_HOME "/home/xcvrys/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
