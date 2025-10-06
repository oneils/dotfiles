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

set -gx PATH /Library/TeX/texbin $PATH
# source ~/.sdkman/bin/sdkman-init.sh
alias python python3
fish_add_path $HOME/.local/bin
