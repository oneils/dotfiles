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

set -gx PATH /Library/TeX/texbin $PATH
