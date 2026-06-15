set -x EDITOR nvim
set -x VISUAL nvim

set -gx PNPM_HOME "/home/xcvrys/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

set -l mason_bin "$HOME/.local/share/nvim/mason/bin"
if not string match -q -- $mason_bin $PATH
  set -gx PATH "$mason_bin" $PATH
end
