function v
    if test (count $argv) -eq 0
        nvim .
    else
        nvim $argv
    end
end

function cd
    if test (count $argv) -eq 0
        builtin cd ~
    else
        builtin cd $argv
    end
end

alias ll="exa --all --tree --level=2 --icons --ignore-glob='node_modules|.git|.DS_Store'"
alias l="eza -all -l"
alias cf="cd ~/.config/"
alias cfn="cd ~/.config/nvim/"
alias lg="lazygit"
alias ds="cd /mnt/c/Users/kamil/Desktop"
alias prev="prevd"
alias next="nextd"
alias tmr="tmux kill-session -t"
alias tmn="tmux new -s"
alias pn="pnpm"
alias y="yarn"
alias pr="cd /home/kamil/projects/"
alias proj="cd /home/kamil/projects/"
