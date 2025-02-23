if status is-login
    cd "/mnt/c/Users/kamil/Desktop"
end

set -q XDG_CONFIG_HOME || set XDG_CONFIG_HOME "$HOME/.config"

source $XDG_CONFIG_HOME/fish/welcome.fish
source $XDG_CONFIG_HOME/fish/aliases.fish

set -x VIRTUAL_ENV ~/.venv/nvim
set -x PATH $VIRTUAL_ENV/bin $PATH
