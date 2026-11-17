# ssh wrapper: switches the terminal to the Gruvbox Dark palette while connected,
# so a remote shell (warm brown-gray) is clearly distinct from the local Rosé Pine Moon (purple) theme.
# Inside tmux it styles only the current pane (window-style + pane-colours);
# outside tmux it recolors kitty via OSC 4/10/11.
#
# The reset lives in a fish_postexec handler, not after `command ssh`: Ctrl-C cancels
# the rest of a fish function, but fish_postexec still fires once the command line ends.

# Gruvbox Dark (hard contrast): https://github.com/morhetz/gruvbox
set -g __ssh_fg '#ebdbb2' # fg1
set -g __ssh_bg '#1d2021' # bg0_h
# ANSI 0-15: black red green yellow blue magenta cyan white, then bright variants
set -g __ssh_ansi \
    '#1d2021' '#cc241d' '#98971a' '#d79921' '#458588' '#b16286' '#689d6a' '#a89984' \
    '#928374' '#fb4934' '#b8bb26' '#fabd2f' '#83a598' '#d3869b' '#8ec07c' '#ebdbb2'

function ssh --wraps ssh --description 'ssh with Gruvbox Dark colors'
    if not status is-interactive
        command ssh $argv
        return
    end

    set -g __ssh_tinted 1
    if set -q TMUX
        tmux select-pane -t $TMUX_PANE -P "fg=$__ssh_fg,bg=$__ssh_bg"
        for i in (seq 0 15)
            tmux set -p -t $TMUX_PANE "pane-colours[$i]" $__ssh_ansi[(math $i + 1)]
        end
    else
        printf '\e]10;%s\a\e]11;%s\a' $__ssh_fg $__ssh_bg
        for i in (seq 0 15)
            printf '\e]4;%d;%s\a' $i $__ssh_ansi[(math $i + 1)]
        end
    end

    command ssh $argv
end

function __ssh_tint_reset --on-event fish_postexec
    set -q __ssh_tinted; or return
    set -e __ssh_tinted
    if set -q TMUX
        tmux select-pane -t $TMUX_PANE -P 'fg=default,bg=default'
        tmux set -pu -t $TMUX_PANE pane-colours
    else
        printf '\e]110\a\e]111\a\e]104\a' # restore theme fg, bg and palette
    end
end
