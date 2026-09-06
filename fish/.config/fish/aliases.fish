# Files
abbr l 'eza --icons'
abbr ls 'eza --icons'
abbr ll 'eza -alh --icons'
abbr la 'eza -a --icons'
abbr lt 'eza --tree --ignore-glob="node_modules|.git"'
abbr tree 'eza --tree --ignore-glob="node_modules|.git"'
alias bat "batcat --color=always"
alias cat "batcat --color=always"


# Navigation
abbr ..    "cd .."
abbr ...   "cd ../.."
abbr ....  "cd ../../.."
abbr ..... "cd ../../../.."
abbr mkdir 'mkdir -p'


# Vim
abbr vim "nvim"
abbr v "nvim"


# Location
abbr dotfiles "cd ~/dotfiles"
abbr dot "cd ~/dotfiles"
abbr d "cd ~/dotfiles"
abbr dev "cd ~/dev"
abbr pr "cd ~/projects"
abbr dt "cd ~/dotfiles/"


# Git
abbr g "git"
abbr gi "git"
abbr gs "git status"
abbr lg "lazygit"
abbr lzg "lazygit"


# Usefull
alias reload 'source ~/.config/fish/config.fish'
alias ip 'curl -s ifconfig.me'
alias update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
abbr cls "clear"
abbr c "claude"
abbr t "tmux"
abbr b "bun"
abbr pi "ssh -X xcvrys@192.168.0.212"
abbr o "omp"
