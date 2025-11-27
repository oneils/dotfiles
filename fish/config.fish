if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Setting PATH for Python 3.11
# The original version is saved in /Users/lex/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"

set -gx EDITOR nvim

alias vvim vim
alias vim nvim
alias v nvim
alias obs="cd '$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes' && nvim"

# theme for the fzf
set -gx FZF_DEFAULT_OPTS '--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8,fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8'
alias --save fz='nvim (fzf -m --preview="bat --color=always {}")'

# fzf bindings and completions
fzf --fish | source

set -gx PATH /Library/TeX/texbin $PATH
# source ~/.sdkman/bin/sdkman-init.sh
alias python python3
fish_add_path $HOME/.local/bin
